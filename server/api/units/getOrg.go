package units

import (
	"net/http"
	"os"

	"api.ducluong.monster/core"
	"api.ducluong.monster/utils"
	"github.com/Nerzal/gocloak/v13"
	"github.com/gin-gonic/gin"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

func HandleListOrg() gin.HandlerFunc {
	return func(ctx *gin.Context) {
		db, err := gorm.Open(postgres.Open(os.Getenv("POSTGRES_DSN") + "/metadata"))
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		resultUnit := core.Unit{}
		resultUnit.Name = gocloak.StringP(utils.GetUnit(ctx.Request.Host)) 

		result := db.Preload("Children").Find(&resultUnit)
		if result.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		ctx.JSON(http.StatusOK, resultUnit)
	}
}
