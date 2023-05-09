package api

import (
	"context"
	"database/sql"
	"encoding/csv"
	"encoding/json"
	"fmt"
	"io"
	"io/ioutil"
	"log"
	"net/http"
	//"net/url"
	"os"
	"path/filepath"
	"strconv"
	"strings"

	"api.ducluong.monster/api/blocks"
	"api.ducluong.monster/api/superset"
	"api.ducluong.monster/api/users"
	"api.ducluong.monster/shared/db"

	// "time"
	"api.ducluong.monster/api/units"
	"api.ducluong.monster/middleware"
	"github.com/360EntSecGroup-Skylar/excelize"
	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/credentials"
	"github.com/aws/aws-sdk-go-v2/feature/s3/manager"
	"github.com/aws/aws-sdk-go-v2/service/s3"
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/postgres"
	_ "github.com/lib/pq"
)

type Table struct {
	Name         string   `json:"name"`
	Cols         []string `json:"cols"`
	Descriptrion []string `json:"des"`
}

type DynamicModel struct {
	gorm.Model
	Columns map[string]interface{}
}

type Account struct {
	Value string `json:"value"`
	Label string `json:"label"`
}

type User struct {
	Id        int
	Firstname string
	Lastname  string
}

type TableRow struct {
	Key int         `json:"key"`
	Row interface{} `json:"row"`
}

type AddRow struct {
	Name  string        `json:"name"`
	Value []interface{} `json:"value"`
	Col   []string      `json:"col"`
}

type RowChange struct {
	Name   string          `json:"table"`
	Change json.RawMessage `json:"change"`
	Cond   interface{}     `json:"cond"`
}

type Update struct {
	Old string `json:"old"`
	New string `json:"new"`
	NewDis string `json:"new_dis"`
}

type BlockInfo struct {
	BlockName    string `json:"name"`
	DisplayName  string `json:"display"`
	Descriptrion string `json:"descript"`
}

type CreateBlock struct {
	DisplayName string `json:"disname"`
	NorName		string	`json:"norname"`
}

const (
	host     = "159.223.66.111"
	port     = 5432
	user     = "khoa"
	password = "7jySGi9Yj6jX9A12lijb5wsPntUiPdU8"
)

func OpenConnect(dbname string) *sql.DB {
	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s "+
		"password=%s dbname=%s sslmode=disable",
		host, port, user, password, dbname)
	db, err := sql.Open("postgres", psqlInfo)
	if err != nil {
		panic(err)
	}
	return db
}

func CreateDb(dbname string) {
	db := OpenConnect("postgres")
	_, err := db.Exec(`CREATE DATABASE "` + dbname + `"`)
	if err != nil {
		log.Fatal(err)
	}
	db.Close()
}

func CreateTable(dbname string, name string, cols []string, des []string) {
	db := OpenConnect(dbname)
	sql := "CREATE TABLE " + name + "("
	for _, ele := range cols {
		sql = sql + ele + ", "
	}
	sql = sql[:len(sql)-2]
	sql = sql + ")"
	var columnNames []string
	for _, column := range cols {
		parts := strings.Split(column, " ")
		columnName := parts[0]
		columnNames = append(columnNames, columnName)
	}
	_, err := db.Exec(sql)
	if err != nil {
		log.Fatal(err)
	}
	for i, ele := range columnNames {
		sql := "COMMENT ON COLUMN " + name + "." + ele + " IS " + `'` + des[i] + `'`
		_, err := db.Exec(sql)
		if err != nil {
			log.Fatal(err)
		}
	}
	db.Close()
}

func enableCors(router *gin.Engine) {
	config := cors.DefaultConfig()
	config.AllowAllOrigins = true
	config.AllowHeaders = []string{"Origin", "Content-Length", "Content-Type", "Authorization"}
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

	// Create new block
	r.POST("/blocks", middleware.Protected(), middleware.AllowedRoles("admin", "unit_admin"), blocks.HandleCreate())

	// units rest apis
	unitsRoute := r.Group("/units")
	unitsRoute.Use(middleware.Protected())
	{
		unitsRoute.GET("/", middleware.AllowedRoles("admin"), units.HandleList(metadataDB, keycloakDB))
		unitsRoute.GET("/org", units.HandleListOrg(metadataDB))
		unitsRoute.GET("/:name", units.HandleGet(metadataDB))
		unitsRoute.POST("/", middleware.AllowedRoles("admin"), units.HandleCreate())
	}

	// users rest apis
	usersRoute := r.Group("/users")
	usersRoute.Use(middleware.Protected())
	usersRoute.Use(middleware.AllowedRoles("admin", "unit_admin"))
	{
		usersRoute.POST("/", users.HandleCreate())
		usersRoute.GET("/", middleware.InjectKeycloak(), users.HandleList())
	}

	// superset routes
	supersetRoute := r.Group("/superset")
	supersetRoute.GET("/", middleware.InjectSupersetToken(), superset.HandleList())
	supersetRoute.Use(middleware.Protected())
	{
		supersetRoute.POST("/", middleware.InjectSupersetToken(), superset.HandleCreate())
	}

	// ping api
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "dmm",
			"host":    c.Request.Host,
			"origin":  c.Request.Header.Get("Origin"),
		})
	})

	r.PUT("/units/:unit_name/tables/:table_name", func(ctx *gin.Context) {})
	r.GET("/show_tables", func(ctx *gin.Context) {
		blockName := ctx.Request.URL.Query().Get("block_name")
		db := OpenConnect(blockName)
		sql := `SELECT table_name from information_schema.tables WHERE table_schema='public';`
		dbs, err := db.Query(sql)
		var tablist []string
		if err != nil {
			panic(err)
		}
		for dbs.Next() {
			var datname string
			err = dbs.Scan(&datname)
			if err != nil {
				panic(err)
			}
			tablist = append(tablist, datname)
		}

		ctx.JSON(http.StatusOK, gin.H{
			"body": tablist,
		})
		db.Close()
	})

	r.GET("/show_inside", func(ctx *gin.Context) {
		blockName := ctx.Request.URL.Query().Get("block_name")
		tableName := ctx.Request.URL.Query().Get("table_name")
		db := OpenConnect(blockName)
		sql := `SELECT * FROM ` + tableName
		rows, err := db.Query(sql)
		if err != nil {
			log.Fatal(err)
			ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		defer rows.Close()

		columnNames, err := rows.Columns()
		if err != nil {
			log.Fatal(err)
			ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		columnCount := len(columnNames)
		columnNamesJSON := make([]gin.H, columnCount)
		for i, columnName := range columnNames {
			columnNamesJSON[i] = gin.H{
				"title":     columnName,
				"dataIndex": columnName,
				"editable":  true,
			}
		}

		rowsJSON := make([]TableRow, 0)
		for rows.Next() {
			row := make([]interface{}, columnCount)
			rowJSON := make(map[string]interface{})
			for i := range row {
				row[i] = new(interface{})
			}
			if err := rows.Scan(row...); err != nil {
				log.Fatal(err)
				ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
				return
			}
			for i, columnName := range columnNames {
				rowJSON[columnName] = *(row[i].(*interface{}))
			}
			rowsJSON = append(rowsJSON, TableRow{Key: len(rowsJSON), Row: rowJSON})
		}
		if err := rows.Err(); err != nil {
			log.Fatal(err)
			ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		for i, columnName := range rowsJSON {
			rowsJSON[i].Key = columnName.Key + 1
		}
		ctx.JSON(http.StatusOK, gin.H{
			"body": []interface{}{columnNamesJSON, rowsJSON, columnNames},
		})
		db.Close()
	})

	r.POST("/create_block", func(ctx *gin.Context) {
		requestBody, err := ioutil.ReadAll(ctx.Request.Body)
		if err != nil {
			panic(err)
		}
		var blocks CreateBlock
		err = json.Unmarshal(requestBody, &blocks)
		if err != nil {
			panic(err)
		}
		fmt.Println(blocks)
		CreateDb(blocks.NorName)
	})

	r.POST("/create_tables", func(ctx *gin.Context) {
		name := ctx.Request.URL.Query().Get("name")
		// name = "hcmut_" +name
		requestBody, err := ioutil.ReadAll(ctx.Request.Body)
		if err != nil {
			panic(err)
		}
		var tables []Table
		err = json.Unmarshal(requestBody, &tables)
		if err != nil {
			panic(err)
		}
		for _, ele := range tables {
			CreateTable(name, ele.Name, ele.Cols, ele.Descriptrion)
		}
	})

	r.POST("/add_des", func(ctx *gin.Context) {
		name := "hcmut_metadata"
		db := OpenConnect(name)
		requestBody, err := ioutil.ReadAll(ctx.Request.Body)
		if err != nil {
			panic(err)
		}
		var blockInfo BlockInfo
		err = json.Unmarshal(requestBody, &blockInfo)
		if err != nil {
			panic(err)
		}
		sql := `INSERT INTO block_info (block_name,  display_name, description) VALUES (`
		sql = sql + `'` + blockInfo.BlockName + `', '` + blockInfo.DisplayName + `', '` + blockInfo.Descriptrion + `')`
		db.Exec(sql)
		db.Close()
	})

	r.POST("/add_data", func(ctx *gin.Context) {
		block := ctx.Request.URL.Query().Get("block")
		db := OpenConnect(block)
		requestBody, err := ioutil.ReadAll(ctx.Request.Body)
		if err != nil {
			panic(err)
		}
		var info AddRow
		err = json.Unmarshal(requestBody, &info)
		if err != nil {
			panic(err)
		}
		sql := `INSERT INTO ` + info.Name + " (id, "
		for _, ele := range info.Col {
			sql = sql + ele + ", "
		}
		sql = sql[:len(sql)-2]
		sql = sql + ") VALUES ("
		for _, ele1 := range info.Value {
			var cond1 string
			switch v := ele1.(type) {
			case float64:
				cond1 = strconv.FormatFloat(v, 'f', -1, 64)
				sql = sql + cond1 + ", "
			case int:
				cond1 = strconv.Itoa(v)
				sql = sql + cond1 + ", "
			case string:
				cond1 = v
				sql = sql + `'` + cond1 + `'` + ", "
			default:
				// Handle the case where the value is not a supported type
			}
		}
		sql = sql[:len(sql)-2]
		sql = sql + ")"
		// fmt.Println(sql)
		db.Exec(sql)
		db.Close()
	})

	r.POST("/add_users", func(ctx *gin.Context) {
		name := "hcmut_metadata"
		block := ctx.Request.URL.Query().Get("block")
		db := OpenConnect(name)
		requestBody, err := ioutil.ReadAll(ctx.Request.Body)
		if err != nil {
			panic(err)
		}
		var users []string
		err = json.Unmarshal(requestBody, &users)
		if err != nil {
			panic(err)
		}
		for _, ele := range users {
			sql := `INSERT INTO user_permission (username,  blocks) VALUES (`
			sql = sql + `'` + ele + `', '` + block + `')`
			db.Exec(sql)
		}
		db.Close()
	})

	r.POST("/show_user", func(ctx *gin.Context) {
		name := ctx.Request.URL.Query().Get("name")
		name = name + "_user"
		db := OpenConnect("keycloak")
		sql := `SELECT username FROM user_entity as u, user_role_mapping as m WHERE u.id = m.user_id AND m.role_id='ced8dca4-72f0-4e77-ad98-1ae94b79e2c8';`
		rows, err := db.Query(sql)
		if err != nil {
			panic(err)
		}
		defer rows.Close()
		var rowss []Account
		for rows.Next() {
			var username string
			err = rows.Scan(&username)
			if err != nil {
				panic(err)
			}
			rowss = append(rowss, Account{username, username})
		}
		if err = rows.Err(); err != nil {
			panic(err)
		}
		fmt.Println(rowss)
		ctx.JSON(http.StatusOK, gin.H{
			"body": rowss,
		})
		db.Close()
	})

	r.GET("/show_criteria", func(ctx *gin.Context) {
		name := ctx.Request.URL.Query().Get("block")
		db := OpenConnect("hcmut_metadata")
		sql := `SELECT description FROM block_info WHERE block_name ='` + name + `'`
		rs, err := db.Query(sql)
		if err != nil {
			panic(err)
		}
		var response string
		for rs.Next() {
			err = rs.Scan(&response)
			if err != nil {
				panic(err)
			}
		}
		ctx.JSON(http.StatusOK, gin.H{
			"body": response,
		})
		db.Close()
	})

	r.DELETE("/delete", func(ctx *gin.Context) {
		name := ctx.Request.URL.Query().Get("block")
		db := OpenConnect("postgres")
		sql := "DROP DATABASE " + name
		_, err := db.Exec(sql)
		if err != nil {
			log.Fatal(err)
		}
		db.Close()
	})

	r.POST("/edit_blockname", func(ctx *gin.Context) {
		requestBody, err := ioutil.ReadAll(ctx.Request.Body)
		if err != nil {
			panic(err)
		}
		var update Update
		err = json.Unmarshal(requestBody, &update)
		if err != nil {
			panic(err)
		}
		db := OpenConnect("hcmut_metadata")
		sql := `ALTER DATABASE "` + update.Old + `" RENAME TO "` + update.New + `"`
		sql2 := `UPDATE block_info SET block_name = '` + update.New + `', display_name ='` + update.NewDis + `' WHERE block_name='` + update.Old+ `'`
		sql3 := `UPDATE user_permission SET blocks = '` + update.New + `' WHERE blocks='` + update.Old+ `'`
		fmt.Println(sql2)
		fmt.Println(sql3)
		db.Exec(sql)
		db.Exec(sql2)
		db.Exec(sql3)
		db.Close()
	})

	r.POST("/edit_colname", func(ctx *gin.Context) {
		name := ctx.Request.URL.Query().Get("block")
		db := OpenConnect(name)
		table := ctx.Request.URL.Query().Get("table")
		requestBody, err := ioutil.ReadAll(ctx.Request.Body)
		if err != nil {
			panic(err)
		}
		var update Update
		err = json.Unmarshal(requestBody, &update)
		if err != nil {
			panic(err)
		}
		sql := "ALTER TABLE " + table + " RENAME COLUMN " + update.Old + " to " + update.New
		_, err = db.Exec(sql)
		if err != nil {
			log.Fatal(err)
		}
		db.Close()
	})

	r.POST("/edit_criteria", func(ctx *gin.Context) {
		name := ctx.Request.URL.Query().Get("block")
		newDes := ctx.Request.URL.Query().Get("new")
		db := OpenConnect("hcmut_metadata")
		sql := `UPDATE block_info SET description = '` + newDes + `' WHERE block_name = '` + name + `'`
		fmt.Println(sql)
		_, err := db.Exec(sql)
		if err != nil {
			log.Fatal(err)
		}
		db.Close()
	})

	// r.POST("/add_col",func(ctx *gin.Context) {
	// 	name := ctx.Request.URL.Query().Get("block")
	// 	table := ctx.Request.URL.Query().Get("table")
	// 	db := OpenConnect(name)
	// 	sql := "ALTER TABLE table1 RENAME COLUMN col1 to newcol;"
	// })

	r.DELETE("/delete_row", func(ctx *gin.Context) {
		block := ctx.Request.URL.Query().Get("block")
		table := ctx.Request.URL.Query().Get("table")
		id := ctx.Request.URL.Query().Get("id")
		db := OpenConnect(block)
		sql := `DELETE FROM ` + table + ` WHERE id = ` + id + ``
		fmt.Println(sql)
		db.Exec(sql)
		db.Close()
	})

	r.DELETE("/delete_table", func(ctx *gin.Context) {
		block := ctx.Request.URL.Query().Get("block")
		table := ctx.Request.URL.Query().Get("table")
		db := OpenConnect(block)
		sql := `DROP TABLE ` + table
		db.Exec(sql)
		db.Close()
	})

	r.POST("/edit_row", func(ctx *gin.Context) {
		name := ctx.Request.URL.Query().Get("block")
		db := OpenConnect(name)
		requestBody, err := ioutil.ReadAll(ctx.Request.Body)
		if err != nil {
			log.Fatal(err)
		}
		var info RowChange
		err = json.Unmarshal(requestBody, &info)
		if err != nil {
			panic(err)
		}
		var extractedData map[string]interface{}
		if err := json.Unmarshal(info.Change, &extractedData); err != nil {
			log.Fatal(err)
		}
		keys := make([]string, 0, len(extractedData))
		for key := range extractedData {
			keys = append(keys, key)
		}
		sql := `UPDATE ` + info.Name + ` SET `
		for _, key := range keys {
			value := extractedData[key]
			add := value.(string)
			sql = sql + key + ` = ` + `'` + add + `' ` + `, `
		}
		sql = sql[:len(sql)-2]
		cond := info.Cond
		var cond1 string
		switch v := cond.(type) {
		case float64:
			cond1 = strconv.FormatFloat(v, 'f', -1, 64)
		case int:
			cond1 = strconv.Itoa(v)
		case string:
			cond1 = v
		default:
			// Handle the case where the value is not a supported type
		}
		sql = sql + "WHERE id = " + cond1
		db.Exec(sql)
		db.Close()
	})

	r.GET("/show_folders", middleware.Protected(), func(ctx *gin.Context) {
		sql := "SELECT datname FROM pg_database"
		db := OpenConnect("postgres")
		dbs, err := db.Query(sql)
		var dblist []string
		if err != nil {
			panic(err)
		}
		for dbs.Next() {
			var datname string
			err = dbs.Scan(&datname)
			if err != nil {
				panic(err)
			}
			if strings.Contains(datname, "hcmut_") && datname != "hcmut_user" && datname != "hcmut_metadata" {
				dblist = append(dblist, datname)
			}
		}
		ctx.JSON(http.StatusOK, gin.H{
			"body": dblist,
		})
		db.Close()
	})

	r.GET("/show_folders_normal", func(ctx *gin.Context) {
		user := ctx.Request.URL.Query().Get("user")
		sql := `SELECT display_name FROM user_permission as u JOIN block_info as b ON u.blocks = b.block_name  WHERE username = '` + user + `'`
		db := OpenConnect("hcmut_metadata")
		dbs, err := db.Query(sql)
		var dblist []string
		if err != nil {
			panic(err)
		}
		for dbs.Next() {
			var datname string
			err = dbs.Scan(&datname)
			if err != nil {
				panic(err)
			}
			dblist = append(dblist, datname)
		}
		ctx.JSON(http.StatusOK, gin.H{
			"body": dblist,
		})
		db.Close()
	})

	// 	r.OPTIONS("/upload_files", func(c *gin.Context) {
	//     c.Header("Access-Control-Allow-Origin", "*")
	//     c.Header("Access-Control-Allow-Methods", "POST")
	//     c.Header("Access-Control-Allow-Headers", "Content-Type")
	//     c.Header("Access-Control-Max-Age", "86400") // Optional, max age for preflight response (in seconds)
	//     c.Status(http.StatusOK)
	//   })

	r.POST("/upload_files", func(ctx *gin.Context) {
		file, err := ctx.FormFile("upload")
		name := ctx.Request.URL.Query().Get("block")
		if err != nil {
			panic(err)
		}
		cfg, err := config.LoadDefaultConfig(context.TODO(),
			config.WithCredentialsProvider(credentials.NewStaticCredentialsProvider(os.Getenv("AWS_ACCESS_KEY_ID"), os.Getenv("AWS_SECRET_ACESS_KEY"), "")),
		)
		if err != nil {
			log.Printf("error: %v", err)
			return
		}
		f, err := file.Open()
		if err != nil {
			log.Printf("error: %v", err)
			return
		}
		client := s3.NewFromConfig(cfg)
		uploader := manager.NewUploader(client)
		folder := "hcmut"
		objectKey := folder + "/" + name + "/" + file.Filename
		result, err := uploader.Upload(context.TODO(), &s3.PutObjectInput{
			Bucket: aws.String("lvtnstorage"),
			Key:    aws.String(objectKey),
			Body:   f,
		})
		fmt.Println(result)
	})
	r.POST("/import_with_excel", func(c *gin.Context) {
		name := c.Request.URL.Query().Get("block")
		table := c.Request.URL.Query().Get("table")
		db, err := gorm.Open("postgres", "host=159.223.66.111 port=5432 user=khoa password=7jySGi9Yj6jX9A12lijb5wsPntUiPdU8 dbname="+name+" sslmode=disable")
		if err != nil {
			log.Fatal(err)
		}
		file, err := c.FormFile("file")
		if err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			return
		}
		src, err := file.Open()

		f, err := excelize.OpenReader(src)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		rows := f.GetRows(f.GetSheetName(1)) // Assuming the data is in the first sheet

		tx := db.Begin()
		fields := make([]string, 0) // Store the field names dynamically
		for i, row := range rows {
			if i == 0 {
				fields = row
				continue
			}

			var values []interface{}
			for j, field := range fields {
				// Convert the value to the expected data type based on the PostgreSQL table column
				colValue := row[j]
				if colValue != "" {
					if isIntColumn(field) {
						intValue, err := strconv.Atoi(colValue)
						if err != nil {
							c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to convert value to integer"})
							return
						}
						values = append(values, intValue)
					} else {
						values = append(values, colValue)
					}
				} else {
					values = append(values, nil) // Handle empty values as NULL
				}
			}

			insertQuery := fmt.Sprintf("INSERT INTO %s (%s) VALUES ", table, strings.Join(fields, ", "))
			placeholders := make([]string, len(fields))
			for j := range fields {
				placeholders[j] = fmt.Sprintf("$%d", j+1)
			}
			insertQuery += fmt.Sprintf("(%s)", strings.Join(placeholders, ", "))

			tx.Exec(insertQuery, values...)
			// if err := tx.Exec(insertQuery, values...); err != nil {
			// 	tx.Rollback()
			// 	print(err)
			// 	return
			// }
		}
		if err := tx.Commit().Error; err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		c.JSON(http.StatusOK, gin.H{"message": "File uploaded and data imported successfully"})
	})
	r.GET("/list-items", func(c *gin.Context) {
		bucketName := "lvtnstorage"
		name := c.Request.URL.Query().Get("block")
		folderPath := "hcmut/"
		folderPath += name + "/"

		// Set the S3 parameters for listing objects
		params := &s3.ListObjectsV2Input{
			Bucket:    aws.String(bucketName),
			Prefix:    aws.String(folderPath),
			Delimiter: aws.String("/"), // Only list items directly inside the folder, excluding sub-folders
		}

		cfg, err := config.LoadDefaultConfig(context.TODO(),
			config.WithCredentialsProvider(credentials.NewStaticCredentialsProvider(os.Getenv("AWS_ACCESS_KEY_ID"), os.Getenv("AWS_SECRET_ACESS_KEY"), "")),
		)
		if err != nil {
			log.Printf("error: %v", err)
			return
		}
		client := s3.NewFromConfig(cfg)
		// Call the ListObjectsV2 API
		resp, err := client.ListObjectsV2(context.TODO(), params)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{
				"error": err.Error(),
			})
			return
		}

		// Extract the item names from the response
		var itemNames []string
		for _, obj := range resp.Contents {
			itemNames = append(itemNames, *obj.Key)
		}

		// Return the item names as the API response
		fileNames := make([]string, len(itemNames))
		for i, path := range itemNames {
			fileNames[i] = filepath.Base(path)
		}
		c.JSON(http.StatusOK, gin.H{
			"items": fileNames,
		})
	})
	// r.GET("/get_column", func(ctx *gin.Context) {
	// 	name := ctx.Request.URL.Query().Get("block")
	// 	table := ctx.Request.URL.Query().Get("table")
	// 	db := OpenConnect(name)
	// 	db.Query()
	// 	db.Close()
 
	// })
	r.POST("/import", func(c *gin.Context) {
		name := c.Request.URL.Query().Get("block")
		table := c.Request.URL.Query().Get("table")
		db, err := gorm.Open("postgres", "host=159.223.66.111 port=5432 user=khoa password=7jySGi9Yj6jX9A12lijb5wsPntUiPdU8 dbname="+name+" sslmode=disable")
		if err != nil {
			log.Fatal(err)
		}
		file, err := c.FormFile("file")
		if err != nil {

			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			return
		}

		src, err := file.Open()
		if err != nil {

			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		defer src.Close()

		reader := csv.NewReader(src)
		reader.Comma = ',' // Modify this if your CSV file has a different delimiter

		header, err := reader.Read()
		// fmt.Println(reader)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		tx := db.Begin()
		for {
			record, err := reader.Read()
			if err == io.EOF {
				break
			}
			if err != nil {
				tx.Rollback()
				c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
				return
			}

			// Skip the header row
			if strings.HasPrefix(record[0], "column1") {
				continue
			}

			values := make([]interface{}, len(record))
			for i, col := range record {
				values[i] = col
			}

			insertQuery := fmt.Sprintf("INSERT INTO %s (%s) VALUES (%s)", table, strings.Join(header, ","), strings.Join(strings.Split(strings.Repeat("?", len(record)), ""), ","))
			if err := tx.Exec(insertQuery, values...).Error; err != nil {
				tx.Rollback()
				c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
				return
			}
		}

		if err := tx.Commit().Error; err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		c.JSON(http.StatusOK, gin.H{"message": "File uploaded and data imported successfully"})
	})
	r.GET("/download", func(c *gin.Context) {
		// Get the object key from the query parameter
		fileName := c.Request.URL.Query().Get("name")
		//name := c.Request.URL.Query().Get("block")

		cfg, err := config.LoadDefaultConfig(context.TODO(),
			config.WithCredentialsProvider(credentials.NewStaticCredentialsProvider(os.Getenv("AWS_ACCESS_KEY_ID"), os.Getenv("AWS_SECRET_ACESS_KEY"), "")),
		)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		client := s3.NewFromConfig(cfg)
		presign := s3.NewPresignClient(client)
		presignedURL, err := createPresignedURL(presign, "lvtnstorage", fileName)
		c.JSON(http.StatusOK, gin.H{"url": presignedURL})
	})
	// r.POST("/add_relationship", func(ctx *gin.Context) {
	// 	fileName := c.Request.URL.Query().Get("name")

	// })

	return r
}

func createPresignedURL(client *s3.PresignClient, bucketName, objectKey string) (string, error) {
	req := &s3.GetObjectInput{
		Bucket: aws.String("lvtnstorage"),
		Key:    aws.String(objectKey),
	}
	presignedURL, err := client.PresignGetObject(context.TODO(), req)
	if err != nil {
		return "", err
	}

	return presignedURL.URL, nil
}
func isIntColumn(columnName string) bool {
	_, err := strconv.Atoi(columnName)
	return err == nil
}
