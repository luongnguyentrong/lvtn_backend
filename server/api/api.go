package api

import (
	"net/http"

	"api.ducluong.monster/api/units"
	"api.ducluong.monster/middleware"
	"github.com/gin-gonic/gin"
)

func Handlers() *gin.Engine {
	r := gin.Default()
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

	return r
}