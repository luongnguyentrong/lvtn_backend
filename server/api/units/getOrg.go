package units

import (
	"net/http"

	"api.ducluong.monster/core"
	"github.com/Nerzal/gocloak/v13"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

func preload(d *gorm.DB) *gorm.DB {
	return d.Preload("Children", preload)
}

func HandleListOrg(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		resultUnit := core.Unit{}
		resultUnit.Name = gocloak.StringP("master")

		result := metadataDB.Preload(clause.Associations, preload).Find(&resultUnit)
		if result.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": result.Error.Error()})
			return
		}

		ctx.JSON(http.StatusOK, resultUnit)
	}
}
