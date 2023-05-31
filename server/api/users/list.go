package users

import (
	"net/http"

	"api.ducluong.monster/core"
	"api.ducluong.monster/utils"
	"github.com/Nerzal/gocloak/v13"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type user_with_access struct {
	*gocloak.User
	BlockIDs *[]string `json:"block_ids"`
}

func inject_block_ids(users []*gocloak.User, metadataDB *gorm.DB) ([]user_with_access, error) {
	new_users := make([]user_with_access, len(users))

	for i, user := range users {
		new_users[i].User = user

		block_access := core.BlockAccess{}
		block_access.UserID = user.ID

		err := metadataDB.First(&block_access).Error
		if err != nil && err != gorm.ErrRecordNotFound {
			return nil, err
		}

		new_users[i].BlockIDs = block_access.BlockIDs
	}

	return new_users, nil
}

func HandleList(metadataDB *gorm.DB) gin.HandlerFunc {
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

		// admin_users, err := client.(*gocloak.GoCloak).GetUsersByRoleName(ctx, admin_token.(string), current_unit, "admin", gocloak.GetUsersByRoleParams{})
		// if err != nil {
		// 	ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		// 	return
		// }

		raw_unitadmin_users, err := client.(*gocloak.GoCloak).GetUsersByRoleName(ctx, admin_token.(string), current_unit, "unit_admin", gocloak.GetUsersByRoleParams{})
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		unitadmin_users, err := inject_block_ids(raw_unitadmin_users, metadataDB)
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		raw_normal_users, err := client.(*gocloak.GoCloak).GetUsersByRoleName(ctx, admin_token.(string), current_unit, "unit_normal", gocloak.GetUsersByRoleParams{})
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		normal_users, err := inject_block_ids(raw_normal_users, metadataDB)
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		ctx.JSON(http.StatusOK, gin.H{
			"unit_admin": unitadmin_users,
			"normal":     normal_users,
		})
	}
}
