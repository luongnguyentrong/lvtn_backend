package columns

import (
	"net/http"

	"api.ducluong.monster/core"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type uriData struct {
	BlockID *uint `uri:"block_id"`
	TableID *uint `uri:"table_id"`
}

func HandleList(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var params uriData

		err := ctx.ShouldBindUri(&params)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// fetch block data
		var cols []core.Column

		results := metadataDB.Where("table_id = ?", params.TableID).Find(&cols)
		if results.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": results.Error})
			return
		}

		ctx.JSON(http.StatusOK, cols)
	}
}
