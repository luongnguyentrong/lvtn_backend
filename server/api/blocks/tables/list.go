package tables

import (
	"net/http"

	"api.ducluong.monster/core"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func HandleList(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var blockData uriData

		err := ctx.ShouldBindUri(&blockData)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// fetch block data
		var block core.Block
		block.ID = blockData.BlockID

		results := metadataDB.First(&block)
		if results.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": results.Error})
			return
		}

		var tables []core.Table

		results = metadataDB.Where("block_id = ?", block.ID).Find(&tables)
		if results.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": results.Error})
			return
		}

		ctx.JSON(http.StatusOK, tables)
	}
}
