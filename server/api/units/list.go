package units

import (
	"net/http"
	"os"

	"api.ducluong.monster/core"
	"github.com/gin-gonic/gin"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

func HandleList() gin.HandlerFunc {
	return func(ctx *gin.Context) {
		// Save unit org structure
		db, err := gorm.Open(postgres.Open(os.Getenv("POSTGRES_DSN") + "/metadata"))
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		var units []core.Unit

		results := db.Find(&units)

		if results.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": results.Error.Error()})
			return
		}

		ctx.JSON(http.StatusOK, units)
	}
}