package blocks

import (
	"net/http"

	"api.ducluong.monster/core"
	"api.ducluong.monster/utils"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func HandleList(metadataDB *gorm.DB, keycloakDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var blocks []core.Block

		// get requesting user
		raw, exists := ctx.Get("user")
		user := raw.(core.User)

		if !exists {
			ctx.AbortWithStatus(http.StatusInternalServerError)
			return
		}

		all_blocks := false
		for _, role := range user.Roles {
			if role == "unit_admin" || role == "admin" {
				all_blocks = true
				break
			}
		}

		// get blocks from metadata
		if !all_blocks {
			var access core.BlockAccess
			access.UserID = user.ID

			err := metadataDB.First(&access).Error
			if err != nil {
				ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
				return
			}

			results := metadataDB.
				Where("unit_name = ?", utils.GetUnit(ctx.Request.Header.Get("Origin"))).
				Where("name IN ?", *access.BlockIDs).
				Find(&blocks)

			if results.Error != nil {
				ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": results.Error.Error()})
				return
			}
		} else {
			results := metadataDB.Where("unit_name = ?", utils.GetUnit(ctx.Request.Header.Get("Origin"))).Find(&blocks)

			if results.Error != nil {
				ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": results.Error.Error()})
				return
			}
		}

		for i, block := range blocks {
			// get manager info
			manager := make([]map[string]any, len(block.ManagerIDs))

			for j, manager_id := range block.ManagerIDs {
				err := keycloakDB.Raw("SELECT * FROM user_entity WHERE id = ?", manager_id).Scan(&manager[j]).Error
				if err != nil {
					ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
					return
				}
			}

			blocks[i].Managers = &manager
		}

		ctx.JSON(http.StatusOK, blocks)
	}
}
