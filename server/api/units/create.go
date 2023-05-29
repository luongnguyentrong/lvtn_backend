package units

import (
	"fmt"
	"net/http"

	"api.ducluong.monster/core"
	"api.ducluong.monster/utils"
	"github.com/Nerzal/gocloak/v13"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type createUnitInp struct {
	UnitName    *string `json:"name" binding:"required"`
	DisplayName *string `json:"display_name" binding:"required"`
	Description *string `json:"description"`
	ParentUnit  *string `json:"parent_unit" binding:"required"`
}

func HandleCreate(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		// decode request body
		var inp createUnitInp

		err := ctx.Bind(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// get keycloak client from context
		raw, exists := ctx.Get("keycloak_client")
		if !exists {
			ctx.AbortWithStatus(http.StatusInternalServerError)
		}

		client := raw.(*gocloak.GoCloak)

		// get admin access token from context
		raw, exists = ctx.Get("admin_token")
		if !exists {
			ctx.AbortWithStatus(http.StatusInternalServerError)
		}

		access_token := raw.(string)

		// get current user from context
		raw, exists = ctx.Get("user")
		user := raw.(core.User)

		if !exists {
			ctx.AbortWithStatus(http.StatusInternalServerError)
			return
		}

		unit_url := fmt.Sprintf("https://%s.ducluong.monster", *inp.UnitName)

		// create new unit
		new_unit := core.Unit{
			RealmID:        inp.UnitName,
			DisplayName:    inp.DisplayName,
			Name:           inp.UnitName,
			Description:    inp.Description,
			URL:            &unit_url,
			ParentName:     inp.ParentUnit,
			ManagerID:      user.ID,
			SupersetStatus: gocloak.StringP("proccessing"),
		}

		err = utils.CreateUnit(ctx, &new_unit, client, &access_token, metadataDB)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// save unit info to metadata
		err = metadataDB.Create(&new_unit).Error
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// create database for the unit
		ctx.AbortWithStatus(201)
	}
}
