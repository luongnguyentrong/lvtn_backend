package requests

import (
	"net/http"

	"api.ducluong.monster/core"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func HandleApprove(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var requests []core.Request
		results := metadataDB.Find(&requests)
		if results.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": results.Error.Error()})
			return
		}

		// create unit realm in keycloak

		// provision database for unit

		// provision superset


		ctx.JSON(http.StatusOK, requests)
	}
}
