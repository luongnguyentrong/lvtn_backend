package requests

import (
	"net/http"

	"api.ducluong.monster/core"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type uriData struct {
	RequestID *uint `uri:"request_id"`
}

type updateInp struct {
	Status *string `json:"status" binding:"required"`
}

func HandleUpdate(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		// get uri params
		var uri uriData

		err := ctx.ShouldBindUri(&uri)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// decode request body
		var inp updateInp

		err = ctx.Bind(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// update request status
		var request core.Request
		request.ID = uri.RequestID

		err = metadataDB.First(&request).Error
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		request.Status = inp.Status
		err = metadataDB.Save(&request).Error
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		ctx.AbortWithStatus(http.StatusOK)
	}
}
