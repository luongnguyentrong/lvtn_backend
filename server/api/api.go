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
	config := cors.DefaultConfig()
	config.AllowAllOrigins = true
	config.AllowHeaders = []string{"Origin", "Content-Length", "Content-Type", "Authorization"}
	r.Use(cors.New(config))

	// Create a realm, an admin user and init necessery clients
	r.POST("/units", middleware.Protected(), middleware.AllowedRoles("admin"), units.HandleCreate())

	// Get the org structure of the current requesting unit
	r.GET("/units/org", middleware.Protected(), units.HandleListOrg())

	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "pong",
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
		fmt.Println(dblist)
	})

	return r
}
