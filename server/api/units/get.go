package units

import (
	"net/http"

	"api.ducluong.monster/core"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func HandleGet(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var unit core.Unit

		if err := ctx.ShouldBindUri(&unit); err != nil {
			ctx.JSON(http.StatusBadRequest, gin.H{ 
				"message": err,
			})
		}

		result := metadataDB.First(&unit)

		if result.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": result.Error})
			return
		}

		ctx.JSON(http.StatusOK, unit)
	}
}
