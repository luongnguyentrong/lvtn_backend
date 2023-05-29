package api

import (
	"api.ducluong.monster/api/blocks"
	"api.ducluong.monster/api/blocks/folders"
	"api.ducluong.monster/api/blocks/references"
	"api.ducluong.monster/api/blocks/tables"
	"api.ducluong.monster/api/blocks/tables/columns"
	"api.ducluong.monster/api/requests"
	"api.ducluong.monster/api/superset"
	"api.ducluong.monster/api/units"
	"api.ducluong.monster/api/users"
	"api.ducluong.monster/core"
	"api.ducluong.monster/middleware"
	"api.ducluong.monster/shared/db"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/s3"
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
)

func enableCors(router *gin.Engine) {
	config := cors.DefaultConfig()
	config.AllowAllOrigins = true
	config.AllowHeaders = []string{"Origin", "Content-Length", "Content-Type", "Authorization", "X-Requested-With"}
	router.Use(cors.New(config))
	router.Use(gin.Logger())
	router.Use(gin.Recovery())
}

func Handlers() *gin.Engine {
	r := gin.Default()

	enableCors(r)

	// Init database clients
	metadataDB, err := db.Create("metadata")
	if err != nil {
		log.Fatal(err)
	}

	keycloakDB, err := db.Create("keycloak")
	if err != nil {
		log.Fatal(err)
	}

	// Init s3 client service
	sess, err := session.NewSession()
	if err != nil {
		log.Fatal(err)
	}

	svc := s3.New(sess)

	// migrate core models
	metadataDB.AutoMigrate(&core.Unit{})
	metadataDB.AutoMigrate(&core.Block{})
	metadataDB.AutoMigrate(&core.Table{})
	metadataDB.AutoMigrate(&core.Column{})
	metadataDB.AutoMigrate(&core.Reference{})
	metadataDB.AutoMigrate(&core.Request{})

	// requests rest apis
	requestsRoute := r.Group("/requests")
	requestsRoute.Use(middleware.Protected(keycloakDB))
	{
		requestsRoute.POST("/", requests.HandleCreate(metadataDB))
		requestsRoute.GET("/", middleware.AllowedRoles("admin"), requests.HandleList(metadataDB, keycloakDB))

		requestDetails := requestsRoute.Group("/:request_id")
		requestDetails.POST("/approve", requests.HandleApprove(metadataDB))
	}

	// blocks rest apis
	blocksRoute := r.Group("/blocks")
	blocksRoute.Use(middleware.Protected(keycloakDB))
	{
		blocksRoute.GET("/", blocks.HandleList(metadataDB, keycloakDB))
		blocksRoute.POST("/", middleware.AllowedRoles("admin", "unit_admin"), blocks.HandleCreate(metadataDB))
		blocksRoute.GET("/:block_id", blocks.HandleGet(metadataDB, keycloakDB))
		blocksRoute.DELETE("/:block_id", blocks.HandleDelete(metadataDB))
		blocksRoute.PUT("/:block_id", blocks.HandleUpdate(metadataDB))

		referenceRoute := blocksRoute.Group("/:block_id/refs")
		{
			referenceRoute.GET("/", references.HandleList(metadataDB))
			referenceRoute.POST("/", references.HandleCreate(metadataDB))
			referenceRoute.DELETE("/:ref_id", references.HandleDelete(metadataDB))
		}

		tablesRoute := blocksRoute.Group("/:block_id/tables")
		{
			tablesRoute.POST("/", middleware.AllowedRoles("admin", "unit_admin"), tables.HandleCreate(metadataDB))
			tablesRoute.GET("/", tables.HandleList(metadataDB))
			tablesRoute.GET("/:table_id", tables.HandleGet(metadataDB))
			tablesRoute.DELETE("/:table_id", tables.HandleDelete(metadataDB))

			tablesRoute.POST("/:table_id/data", tables.HandleInsert(metadataDB))
			tablesRoute.POST("/:table_id/upload", tables.HandleUploadFromExcel(metadataDB))

			tableRoute := tablesRoute.Group("/:table_id")
			{
				tableRoute.GET("/columns", columns.HandleList(metadataDB))
			}
		}

		foldersRoute := blocksRoute.Group("/:block_id/folders")
		{
			foldersRoute.GET("/", folders.HandleList(metadataDB, svc))
			foldersRoute.GET("/:folder_name", folders.HandleListFile(metadataDB))
			foldersRoute.GET("/add/:new_folder_name", folders.HandleAdd(metadataDB))
		}
	}

	// units rest apis
	unitsRoute := r.Group("/units")
	unitsRoute.Use(middleware.Protected(keycloakDB))
	{
		unitsRoute.GET("/", units.HandleList(metadataDB, keycloakDB))
		unitsRoute.GET("/organizations", units.HandleListOrg(metadataDB))
		unitsRoute.GET("/:name", units.HandleGet(metadataDB, keycloakDB))
		unitsRoute.POST("/", middleware.AllowedRoles("admin"), middleware.InjectKeycloak(), units.HandleCreate(metadataDB))
	}

	// users rest apis
	usersRoute := r.Group("/users")
	usersRoute.Use(middleware.Protected(keycloakDB))
	usersRoute.Use(middleware.AllowedRoles("admin", "unit_admin"))
	{
		usersRoute.POST("/", users.HandleCreate())
		usersRoute.GET("/", middleware.InjectKeycloak(), users.HandleList())
	}

	// superset routes
	supersetRoute := r.Group("/superset")
	supersetRoute.Use(middleware.Protected(keycloakDB))
	{
		supersetRoute.POST("/", middleware.InjectSupersetToken(), superset.HandleCreate())
		supersetRoute.GET("/", superset.HandleList())
	}

	// ping api
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "pong",
			"origin":  c.Request.Header.Get("Origin"),
		})
	})

	// r.POST("/import_with_excel", func(c *gin.Context) {
	// 	name := c.Request.URL.Query().Get("block")
	// 	table := c.Request.URL.Query().Get("table")
	// 	db, err := gorm.Open("postgres", "host=159.223.66.111 port=5432 user=khoa password=7jySGi9Yj6jX9A12lijb5wsPntUiPdU8 dbname="+name+" sslmode=disable")
	// 	if err != nil {
	// 		log.Fatal(err)
	// 	}
	// 	file, err := c.FormFile("file")
	// 	if err != nil {
	// 		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
	// 		return
	// 	}
	// 	src, err := file.Open()

	// 	f, err := excelize.OpenReader(src)
	// 	if err != nil {
	// 		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
	// 		return
	// 	}

	// 	rows := f.GetRows(f.GetSheetName(1)) // Assuming the data is in the first sheet

	// 	tx := db.Begin()
	// 	fields := make([]string, 0) // Store the field names dynamically
	// 	for i, row := range rows {
	// 		if i == 0 {
	// 			fields = row
	// 			continue
	// 		}

	// 		var values []interface{}
	// 		for j, field := range fields {
	// 			// Convert the value to the expected data type based on the PostgreSQL table column
	// 			colValue := row[j]
	// 			if colValue != "" {
	// 				if isIntColumn(field) {
	// 					intValue, err := strconv.Atoi(colValue)
	// 					if err != nil {
	// 						c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to convert value to integer"})
	// 						return
	// 					}
	// 					values = append(values, intValue)
	// 				} else {
	// 					values = append(values, colValue)
	// 				}
	// 			} else {
	// 				values = append(values, nil) // Handle empty values as NULL
	// 			}
	// 		}

	// 		insertQuery := fmt.Sprintf("INSERT INTO %s (%s) VALUES ", table, strings.Join(fields, ", "))
	// 		placeholders := make([]string, len(fields))
	// 		for j := range fields {
	// 			placeholders[j] = fmt.Sprintf("$%d", j+1)
	// 		}
	// 		insertQuery += fmt.Sprintf("(%s)", strings.Join(placeholders, ", "))

	// 		tx.Exec(insertQuery, values...)
	// 		// if err := tx.Exec(insertQuery, values...); err != nil {
	// 		// 	tx.Rollback()
	// 		// 	print(err)
	// 		// 	return
	// 		// }
	// 	}
	// 	if err := tx.Commit().Error; err != nil {
	// 		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
	// 		return
	// 	}

	// 	c.JSON(http.StatusOK, gin.H{"message": "File uploaded and data imported successfully"})
	// })

	return r
}
