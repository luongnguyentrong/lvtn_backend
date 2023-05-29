package units

import (
	"net/http"

	"api.ducluong.monster/core"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func HandleList(metadataDB *gorm.DB, keycloakDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var units []core.Unit
		results := metadataDB.Find(&units)

		if results.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": results.Error.Error()})
			return
		}

		// get manager info
		for i, unit := range units {
			manager := map[string]interface{}{}
			userResult := keycloakDB.Raw("select * from user_entity where id = ?", *unit.ManagerID).Scan(&manager)
			if userResult.Error != nil {
				ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": userResult.Error})
				return
			}

			units[i].Manager = &manager
		}

		ctx.JSON(http.StatusOK, units)
	}
}
