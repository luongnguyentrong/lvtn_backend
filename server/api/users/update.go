package users

import (
	"net/http"

	"api.ducluong.monster/core"
	"api.ducluong.monster/utils"
	"github.com/Nerzal/gocloak/v13"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type updateUser struct {
	Enabled   *bool     `json:"enabled"`
	FirstName *string   `json:"firstName"`
	LastName  *string   `json:"lastName"`
	Email     *string   `json:"email"`
	Access    *[]string `json:"access"`
}

func HandleUpdate(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		// get user id from uri
		var uri uriData

		err := ctx.ShouldBindUri(&uri)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// decode request body
		var inp updateUser

		err = ctx.Bind(&inp)
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

		// get user from keycloak
		current_unit := utils.GetUnit(ctx.Request.Header.Get("Origin"))
		user, err := client.(*gocloak.GoCloak).GetUserByID(ctx, admin_token.(string), current_unit, *uri.UserID)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		if inp.Email != nil && *inp.Email != *user.Email {
			user.Email = inp.Email
		}
		if inp.FirstName != nil && *inp.FirstName != *user.FirstName {
			user.FirstName = inp.FirstName
		}
		if inp.LastName != nil && *inp.LastName != *user.LastName {
			user.LastName = inp.LastName
		}
		if inp.Enabled != nil && *inp.Enabled != *user.Enabled {
			user.Enabled = inp.Enabled
		}

		err = client.(*gocloak.GoCloak).UpdateUser(ctx, admin_token.(string), current_unit, *user)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err})
			return
		}

		// update block access
		if inp.Access != nil {
			var access core.BlockAccess
			access.UserID = uri.UserID
			access.BlockIDs = inp.Access

			err = metadataDB.Save(&access).Error
			if err != nil {
				ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err})
				return
			}
		}

		ctx.JSON(http.StatusOK, user)
	}
}
