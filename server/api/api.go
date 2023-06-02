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
	metadataDB.AutoMigrate(&core.BlockAccess{})

	// requests rest apis
	requestsRoute := r.Group("/requests")
	requestsRoute.Use(middleware.Protected(keycloakDB))
	{
		requestsRoute.POST("/", requests.HandleCreate(metadataDB))
		requestsRoute.GET("/", middleware.AllowedRoles("admin"), requests.HandleList(metadataDB, keycloakDB))

		requestDetails := requestsRoute.Group("/:request_id")
		requestDetails.PUT("/", requests.HandleUpdate(metadataDB))
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
		blocksRoute.GET("/:block_id/criteria/get", blocks.HandleListCriteria(metadataDB))
		blocksRoute.GET("/:block_id/criteria/:crit_id/get", blocks.HandleListEvidence(metadataDB))
		blocksRoute.POST("/:block_id/criteria/add", blocks.HandleAddCriteria(metadataDB))
		blocksRoute.POST("/:block_id/criteria/:crit_id/source/add", blocks.HandleAddEvidence(metadataDB))
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
			tablesRoute.DELETE("/:table_id/data", tables.HandleRemove(metadataDB))
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
			foldersRoute.POST("/:folder_name/upload", folders.HandleUploadFile(metadataDB))
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
		usersRoute.POST("/", users.HandleCreate(metadataDB))
		usersRoute.PUT("/:user_id", middleware.InjectKeycloak(), users.HandleUpdate(metadataDB))
		usersRoute.DELETE("/:user_id", middleware.InjectKeycloak(), users.HandleDelete(metadataDB))
		usersRoute.GET("/", middleware.InjectKeycloak(), users.HandleList(metadataDB))
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

	return r
}
