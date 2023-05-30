package users

import (
	"net/http"

	"api.ducluong.monster/core"
	"api.ducluong.monster/utils"
	"github.com/Nerzal/gocloak/v13"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type uriData struct {
	UserID *string `uri:"user_id"`
}

func HandleDelete(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		// get user id from uri
		var inp uriData

		err := ctx.ShouldBindUri(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// Init keycloak client
		client, exists := ctx.Get("keycloak_client")

		if !exists {
			ctx.AbortWithStatus(http.StatusInternalServerError)
			return
		}

		admin_token, exists := ctx.Get("admin_token")
		if !exists {
			ctx.AbortWithStatus(http.StatusInternalServerError)
			return
		}

		current_unit := utils.GetUnit(ctx.Request.Header.Get("Origin"))
		err = client.(*gocloak.GoCloak).DeleteUser(ctx, admin_token.(string), current_unit, *inp.UserID)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// delete block access 
		block_access := core.BlockAccess{}
		block_access.UserID = inp.UserID
		err = metadataDB.Delete(&block_access).Error
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err})
			return
		}

		ctx.Status(http.StatusOK)
	}
}
