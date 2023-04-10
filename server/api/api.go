package api

import (
	"net/http"

	"api.ducluong.monster/api/units"
	"api.ducluong.monster/middleware"
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

func Handlers() *gin.Engine {
	r := gin.Default()
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

	return r
}
