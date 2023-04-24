package api

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"net/url"
	"strconv"
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

type AddRow struct{
	Name string `json:"name"`
	Value []interface{} `json:"value"`
	Col []string `json:"col"`
}

type RowChange struct {
	Name string		`json:"table"`
	Change json.RawMessage  `json:"change"`
	Cond interface{} 	`json:"cond"`
}

type Update struct{
	Old string `json:"old"`
	New string `json:"new"`
}

type BlockInfo struct{
	BlockName string	`json:"name"`
	DisplayName string	`json:"display"`
	Descriptrion string	`json:"descript"`
}

const (
  host     = "159.223.66.111"
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
	db := OpenConnect("postgres")
	_, err := db.Exec(`CREATE DATABASE "` + dbname + `"`)
	if err != nil {
    log.Fatal(err)
}
	db.Close()
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
	db.Close()
}

func Handlers() *gin.Engine {
	r := gin.Default()
	config := cors.DefaultConfig()
	config.AllowAllOrigins = true
	config.AllowHeaders = []string{"Origin", "Content-Length", "Content-Type", "Authorization"}
	r.Use(cors.New(config))
	r.Use(gin.Logger())
	r.Use(gin.Recovery())

	config.AllowAllOrigins = true
	config.AllowHeaders = []string{"Origin", "Content-Length", "Content-Type", "Authorization"}
	r.Use(cors.New(config))

	// List all realms 
	r.GET("/units", middleware.Protected(), middleware.AllowedRoles("admin"), units.HandleList())

	// Create a realm, an admin user and init necessery clients
	r.POST("/units", middleware.Protected(), middleware.AllowedRoles("admin"), units.HandleCreate())

	// Get the org structure of the current requesting unit
	r.GET("/units/org", middleware.Protected(), units.HandleListOrg())

	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "pong",
		})
	})
	r.PUT("/units/:unit_name/tables/:table_name", func(ctx *gin.Context) {})
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
		db.Close()
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
		db.Close()
	})

	r.POST("/create_block",func(ctx *gin.Context) {
		encodedName := ctx.Request.URL.Query().Get("name")
		name, _ := url.QueryUnescape(encodedName)
		fmt.Println("Name=",name)
		CreateDb(name)
	})

	r.POST("/create_tables",func(ctx *gin.Context) {
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
			CreateTable(name,ele.Name,ele.Cols,ele.Descriptrion)
		}
	})

	r.POST("/add_des", func(ctx *gin.Context){
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
		sql = sql +`'`+ blockInfo.BlockName+ `', '` + blockInfo.DisplayName + `', '` + blockInfo.Descriptrion + `')`;
		db.Exec(sql)
		db.Close()
	})

	r.POST("/add_data",func(ctx *gin.Context) {
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
		for _,ele := range info.Col {
			sql = sql + ele + ", "
		}
		sql = sql[:len(sql)-2]
		sql = sql + ") VALUES ("
		for _,ele1 := range info.Value{
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
				sql = sql +`'` + cond1+`'` + ", "
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

	r.POST("/add_users", func(ctx *gin.Context){
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
		for _, ele := range users{
			sql := `INSERT INTO user_permission (username,  blocks) VALUES (`
			sql = sql +`'`+ ele + `', '` + block + `')`;
			db.Exec(sql)
		}
		db.Close()
	})

	r.POST("/show_user",func(ctx *gin.Context) {
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

	r.POST("/edit_colname",func(ctx *gin.Context) {
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
		sql := "ALTER TABLE " + table + " RENAME COLUMN "+ update.Old +" to "+ update.New
		_, err = db.Exec(sql)
		if err != nil {
			log.Fatal(err)
		}
		db.Close()
	})

	r.POST("/edit_criteria",func(ctx *gin.Context) {
		name := ctx.Request.URL.Query().Get("block")
		newDes := ctx.Request.URL.Query().Get("new")
		db := OpenConnect("hcmut_metadata")
		sql := `UPDATE block_info SET description = '`+ newDes+`' WHERE block_name = '` + name +`'`
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
 
	r.POST("/edit_row",func(ctx *gin.Context) {
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
		sql := `UPDATE `+ info.Name + ` SET `
		for _,key := range keys {
			value := extractedData[key]
			add := value.(string)
			sql = sql + key + ` = ` + `'`  + add + `' ` +`, `
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
		db.Close()
	})

	return r
}
