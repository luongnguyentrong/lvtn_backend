package units

import (
	"net/http"

	"api.ducluong.monster/core"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func HandleGet(metadataDB *gorm.DB, keycloakDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var unit core.Unit

		if err := ctx.ShouldBindUri(&unit); err != nil {
			ctx.JSON(http.StatusBadRequest, gin.H{
				"message": err,
			})
		}

		// get unit info
		result := metadataDB.First(&unit)
		if result.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": result.Error})
			return
		}

		// get manager info
		manager := map[string]any{}

		err := keycloakDB.Raw("SELECT * FROM user_entity WHERE id = ?", *unit.ManagerID).Scan(&manager).Error
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		unit.Manager = &manager

		ctx.JSON(http.StatusOK, unit)
	}
}
