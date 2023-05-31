package users

import (
	"net/http"
	"os"

	"api.ducluong.monster/core"
	"github.com/Nerzal/gocloak/v13"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type createInput struct {
	FirstName *string   `json:"fname" binding:"required"`
	LastName  *string   `json:"lname" binding:"required"`
	Email     *string   `json:"email" binding:"required"`
	Username  *string   `json:"username" binding:"required"`
	Password  *string   `json:"password" binding:"required"`
	UnitName  *string   `json:"unit_name" binding:"required"`
	Role      *string   `json:"role" binding:"required"`
	Access    *[]string `json:"access" binding:"required"`
}

func HandleCreate(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var inp createInput

		err := ctx.Bind(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}

		// Init keycloak client
		client := gocloak.NewClient(os.Getenv("KEYCLOAK_HOST"))

		token, err := client.LoginAdmin(ctx, os.Getenv("KEYCLOAK_USERNAME"), os.Getenv("KEYCLOAK_PASSWORD"), "master")
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}

		userID, err := client.CreateUser(ctx, token.AccessToken, *inp.UnitName, gocloak.User{
			FirstName:     inp.FirstName,
			LastName:      inp.LastName,
			Email:         inp.Email,
			EmailVerified: gocloak.BoolP(true),
			Enabled:       gocloak.BoolP(true),
			Username:      inp.Username,
		})

		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}

		err = client.SetPassword(ctx, token.AccessToken, userID, *inp.UnitName, *inp.Password, false)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}

		// Fetch keycloak role
		role, err := client.GetRealmRole(ctx, token.AccessToken, *inp.UnitName, *inp.Role)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}

		// Add realm role to user
		err = client.AddRealmRoleToUser(ctx, token.AccessToken, *inp.UnitName, userID, []gocloak.Role{*role})
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}

		// Save user block access in metadata
		block_access := core.BlockAccess{
			UserID:   &userID,
			BlockIDs: inp.Access,
		}

		err = metadataDB.Create(&block_access).Error
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}

		ctx.Status(http.StatusCreated)
	}
}
