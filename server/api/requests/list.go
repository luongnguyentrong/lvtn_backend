package requests

import (
	"net/http"

	"api.ducluong.monster/core"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func HandleList(metadataDB *gorm.DB, keycloakDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var requests []core.Request
		results := metadataDB.Find(&requests)
		if results.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": results.Error.Error()})
			return
		}

		// get manager info
		for i, request := range requests {
			manager := map[string]any{}

			err := keycloakDB.Raw("SELECT * FROM user_entity WHERE id = ?", request.CreatedBy).Scan(&manager).Error
			if err != nil {
				ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
				return
			}

			requests[i].Creator = &manager
		}

		ctx.JSON(http.StatusOK, requests)
	}
}
