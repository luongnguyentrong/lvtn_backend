package api

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"net/url"
	"strings"

	"api.ducluong.monster/api/units"
	"api.ducluong.monster/middleware"
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq"
)

type Table struct{
	Name string 	`json:"name"`
	Cols []string	`json:"cols"`
	Descriptrion []string `json:"des"`
}

type Account struct{
	Value string `json:"value"`
	Label string `json:"label"`
}

type User struct{
	Id int
	Firstname string
	Lastname string
}

type TableRow struct {
	Key int         `json:"key"`
	Row interface{} `json:"row"`
}


type BlockInfo struct{
	BlockName string	`json:"name"`
	DisplayName string	`json:"display"`
	Descriptrion string	`json:"descript"`
}

const (
  host     = "68.183.238.254"
  port     = 5432
  user     = "khoa"
  password = "7jySGi9Yj6jX9A12lijb5wsPntUiPdU8"
)

func OpenConnect(dbname string) *sql.DB{
	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s "+
    "password=%s dbname=%s sslmode=disable",
    host, port, user, password, dbname)
	db, err := sql.Open("postgres", psqlInfo)
	if err != nil {
	panic(err)
	}
	return db
}

func CreateDb(dbname string,) {
	db := OpenConnect("lvtn")
	_, err := db.Exec(`CREATE DATABASE "` + dbname + `"`)
	if err != nil {
    log.Fatal(err)
}
}

func CreateTable(dbname string,name string, cols []string, des []string){
	db:= OpenConnect(dbname)
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
	for i, ele := range columnNames{
		sql := "COMMENT ON COLUMN " + name+"."+ele+ " IS " + `'`+des[i]+ `'`
		_, err := db.Exec(sql)
		if err != nil {
			log.Fatal(err)
		}
		fmt.Println(sql)
	}
}

func Handlers() *gin.Engine {
	r := gin.Default()
	config := cors.DefaultConfig()
	config.AllowAllOrigins = true
	config.AllowHeaders = []string{"Origin", "Content-Length", "Content-Type", "Authorization"}
	r.Use(cors.New(config))
	r.Use(gin.Logger())
	r.Use(gin.Recovery())

	// Create a realm, an admin user and init necessery clients
	r.POST("/units", middleware.Protected(), units.HandleCreate())

	// Define tables for a unit
	r.POST("/units/:unit_name/tables", func(ctx *gin.Context) {
		// create a table in postgres

		// save table info to datbase
	})

	// Insert values to a table 
	r.PUT("/units/:unit_name/tables/:table_name", func(ctx *gin.Context) {
		// insert values to the table in postgres

		// save insert data to database

	})

	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "pong",
		})
	})

	r.GET("/show_tables",func(ctx *gin.Context) {
		blockName := ctx.Request.URL.Query().Get("block_name")
		db := OpenConnect(blockName)
		sql := `SELECT table_name from information_schema.tables WHERE table_schema='public';`
		dbs, err := db.Query(sql)
		var tablist []string;
		if err != nil {
			panic(err)
		}
		for dbs.Next() {
			var datname string; 
			err = dbs.Scan(&datname)
			if err != nil {
				panic(err)
			}
			tablist = append(tablist, datname)
		}
		ctx.JSON(http.StatusOK, gin.H{
			"body": tablist,
		})
	})

	r.GET("/show_inside",func(ctx *gin.Context) {
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
				"title":    columnName,
				"dataIndex": columnName,
				"editable": true,
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
			rowsJSON[i].Key = columnName.Key +1
		}
		ctx.JSON(http.StatusOK, gin.H{
			"body": []interface{}{columnNamesJSON, rowsJSON, columnNames},
		})
	})

	r.POST("/create_block",func(ctx *gin.Context) {
		encodedName := ctx.Request.URL.Query().Get("name")
		name, _ := url.QueryUnescape(encodedName)
		fmt.Println("Name=",name)
		CreateDb(name)
	})

	r.POST("/create_tables",func(ctx *gin.Context) {
		name := ctx.Request.URL.Query().Get("name")
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
			CreateTable(name,ele.Name,ele.Cols,ele.Descriptrion)
		}
	})

	r.POST("/add_des", func(ctx *gin.Context){
		name := "hcmut_meta"
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
		sql = sql +`'`+ blockInfo.BlockName+ `', '` + blockInfo.DisplayName + `', '` + blockInfo.Descriptrion + `')`;
		db.Exec(sql)
	})

	r.POST("/add_users", func(ctx *gin.Context){
		name := "hcmut_meta"
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
		for _, ele := range users{
			sql := `INSERT INTO user_permission (username,  blocks) VALUES (`
			sql = sql +`'`+ ele + `', '` + block + `')`;
			db.Exec(sql)
		}
	})

	r.POST("/show_user",func(ctx *gin.Context) {
		name := ctx.Request.URL.Query().Get("name")
		name = name + "_user"
		db := OpenConnect("keycloak")
		sql := `SELECT username FROM user_entity as u, user_role_mapping as m WHERE u.id = m.user_id AND m.role_id='3cc1a1b7-83fc-468e-8ff1-36e5654b3f6f';`
		rows, err := db.Query(sql)
		if err != nil {
			panic(err)
		}
		defer rows.Close()
		var rowss []Account
		for rows.Next() {
			var username string;
			err = rows.Scan(&username)
			if err != nil {
				panic(err)
			} 
			rowss = append(rowss,Account{username,username})
		}
		if err = rows.Err(); err != nil {
			panic(err)
		}
		fmt.Println(rowss)
		ctx.JSON(http.StatusOK, gin.H{
			"body": rowss,
		})
	})

	r.GET("/show_folders",func(ctx *gin.Context) {
		sql := "SELECT datname FROM pg_database"
		db := OpenConnect("postgres")
		dbs, err := db.Query(sql)
		var dblist []string;
		if err != nil {
			panic(err)
		}
		for dbs.Next() {
			var datname string; 
			err = dbs.Scan(&datname)
			if err != nil {
				panic(err)
			}
			if strings.Contains(datname,"hcmut_") && datname != "hcmut_user" {
				dblist = append(dblist,datname)
			}
		}
		ctx.JSON(http.StatusOK, gin.H{
			"body": dblist,
		})
	})

	return r
}