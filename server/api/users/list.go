package users

import (
	"net/http"

	"api.ducluong.monster/utils"
	"github.com/Nerzal/gocloak/v13"
	"github.com/gin-gonic/gin"
)

func HandleList() gin.HandlerFunc {
	return func(ctx *gin.Context) {
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

		admin_users, err := client.(*gocloak.GoCloak).GetUsersByRoleName(ctx, admin_token.(string), current_unit, "admin", gocloak.GetUsersByRoleParams{})
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		unitadmin_users, err := client.(*gocloak.GoCloak).GetUsersByRoleName(ctx, admin_token.(string), current_unit, "unit_admin", gocloak.GetUsersByRoleParams{})
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		normal_users, err := client.(*gocloak.GoCloak).GetUsersByRoleName(ctx, admin_token.(string), current_unit, "unit_normal", gocloak.GetUsersByRoleParams{})
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		ctx.JSON(http.StatusOK, gin.H{
			"admin": admin_users,
			"unit_admin": unitadmin_users,
			"normal": normal_users,
		})

	}
}
