package blocks

import (
	"net/http"

	"api.ducluong.monster/core"
	"api.ducluong.monster/utils"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func HandleList(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var blocks []core.Block

		results := metadataDB.Where("realm = ?", utils.GetUnit(ctx.Request.Header.Get("Origin"))).Find(&blocks)

		if results.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": results.Error.Error()})
			return
		}

		ctx.JSON(http.StatusOK, blocks)
	}
}