package blocks

import (
	"net/http"

	"api.ducluong.monster/core"
	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
	"gorm.io/gorm"
)

type updateBlock struct {
	DisplayName *string `json:"display_name"`
	// Name        *string        `json:"name" binding:"required"`
	Description *string         `json:"description"`
	ManagerIDs  *pq.StringArray `json:"manager_ids"`
}

func HandleUpdate(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		// get block id from uri
		var uriData getInp

		err := ctx.ShouldBindUri(&uriData)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// decode request body
		var inp updateBlock

		err = ctx.Bind(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// get block info
		var block core.Block
		block.ID = uriData.BlockID

		result := metadataDB.First(&block)
		if result.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": result.Error})
			return
		}

		// update block info
		if inp.DisplayName != nil {
			block.DisplayName = inp.DisplayName
		}
		if inp.Description != nil {
			block.Description = inp.Description
		}
		if inp.ManagerIDs != nil {
			block.ManagerIDs = *inp.ManagerIDs
		}

		err = metadataDB.Save(&block).Error
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": result.Error})
			return
		}

		ctx.JSON(http.StatusOK, block)
	}
}
