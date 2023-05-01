package units

import (
	"net/http"
	"os"

	"api.ducluong.monster/core"
	"github.com/gin-gonic/gin"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

func HandleGet() gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var unit core.Unit

		if err := ctx.ShouldBindUri(&unit); err != nil {
			ctx.JSON(http.StatusBadRequest, gin.H{ 
				"message": err,
			})
		}

		db, err := gorm.Open(postgres.Open(os.Getenv("POSTGRES_DSN") + "/metadata"))
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		result := db.First(&unit)

		if result.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": result.Error})
			return
		}

		ctx.JSON(http.StatusOK, unit)
	}
}
