package units

import (
	"net/http"

	"api.ducluong.monster/core"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func HandleList(metadataDB *gorm.DB, keycloakDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		type userInfo struct {
			ID        *string `json:"id"`
			FirstName *string `json:"first_name"`
			LastName  *string `json:"last_name"`
			Username  *string `json:"username"`
		}

		type displayUnit struct {
			RealmID     *string  `json:"realm_id"`
			CreatedBy   userInfo `json:"created_by"`
			DisplayName *string  `json:"display_name" gorm:"not null"`
			Name        *string  `json:"name" uri:"name" gorm:"primaryKey;not null;unique"`
			Description *string  `json:"description"`
			URL         *string  `json:"url"`
		}

		var units []core.Unit
		results := metadataDB.Find(&units)

		if results.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": results.Error.Error()})
			return
		}

		data := make([]displayUnit, len(units))

		for i, unit := range units {
			var user userInfo
			user.ID = unit.CreatedBy

			userResult := keycloakDB.Raw("select first_name, last_name, username from user_entity where id = ?", unit.CreatedBy).Scan(&user)
			if userResult.Error != nil {
				ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": userResult.Error})
				return
			}

			data[i].RealmID = unit.RealmID
			data[i].DisplayName = unit.DisplayName
			data[i].Name = unit.Name
			data[i].CreatedBy = user
			data[i].Description = unit.Description
			data[i].URL = unit.URL
		}

		ctx.JSON(http.StatusOK, data)
	}
}
