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

type manager struct {
	FirstName *string `json:"fname" binding:"required"`
	LastName  *string `json:"lname" binding:"required"`
	Email     *string `json:"email" binding:"required"`
	Username  *string `json:"username" binding:"required"`
	Password  *string `json:"password" binding:"required"`
}

type createUnitInp struct {
	DisplayName *string  `json:"display_name" binding:"required"`
	Name        *string  `json:"name" binding:"required"`
	Description *string  `json:"description"`
	ParentUnit  *string  `json:"parent_unit" binding:"required"`
	Manager     *manager `json:"manager" binding:"required"`
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

		// create new unit
		unit_url := fmt.Sprintf("https://%s.ducluong.monster", *inp.Name)
		new_unit := core.Unit{
			RealmID:        inp.Name,
			DisplayName:    inp.DisplayName,
			Name:           inp.Name,
			Description:    inp.Description,
			URL:            &unit_url,
			ParentName:     inp.ParentUnit,
			SupersetStatus: gocloak.StringP("processing"),
		}

		err = utils.CreateUnit(ctx, &new_unit, client, &access_token, metadataDB)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// create manager account
		userID, err := client.CreateUser(ctx, access_token, *inp.Name, gocloak.User{
			FirstName:     inp.Manager.FirstName,
			LastName:      inp.Manager.LastName,
			Email:         inp.Manager.Email,
			EmailVerified: gocloak.BoolP(true),
			Enabled:       gocloak.BoolP(true),
			Username:      inp.Manager.Username,
		})

		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}

		// set manager
		err = client.SetPassword(ctx, access_token, userID, *inp.Name, *inp.Manager.Password, false)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}

		// Fetch keycloak role
		role, err := client.GetRealmRole(ctx, access_token, *inp.Name, "unit_admin")
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}

		// Add realm role to user
		err = client.AddRealmRoleToUser(ctx, access_token, *inp.Name, userID, []gocloak.Role{*role})
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}

		// save unit info to metadata
		new_unit.ManagerID = &userID
		err = metadataDB.Create(&new_unit).Error
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// create database for the unit
		ctx.AbortWithStatus(201)
	}
}
