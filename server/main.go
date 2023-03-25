package main

import (
	"fmt"
	"log"
	"net/http"
	"os"

	"github.com/Nerzal/gocloak/v13"
	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
)

func getAccessToken() string {
	return "access_token"
} 

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal(err)
	}

	r := gin.Default()
	r.Use(gin.Logger())
	r.Use(gin.Recovery())

	// Create a realm, an admin user and init necessery clients
	r.POST("/units", func(ctx *gin.Context) {
		// create realm <body.realm_name>
		client := gocloak.NewClient(os.Getenv("KEYCLOAK_HOST"))

		fmt.Println(client)

		// create realm roles for this new realm (unit_admin, unit_user)

		// create a new user 

		// attack role unit_admin to this user

		// create console client

		// create database for the unit
	})

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

	r.Run()
}
