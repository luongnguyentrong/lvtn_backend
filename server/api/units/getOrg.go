package units

import (
	"net/http"

	"api.ducluong.monster/core"
	"api.ducluong.monster/utils"
	"github.com/Nerzal/gocloak/v13"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func HandleListOrg(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		resultUnit := core.Unit{}
		resultUnit.Name = gocloak.StringP(utils.GetUnit(ctx.Request.Header.Get("Origin"))) 

		result := metadataDB.Preload("Children").Find(&resultUnit)
		if result.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": result.Error.Error()})
			return
		}

		ctx.JSON(http.StatusOK, resultUnit)
	}
}
