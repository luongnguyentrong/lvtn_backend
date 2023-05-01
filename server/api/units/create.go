package units

import (
	"fmt"
	"net/http"

	"os"

	"api.ducluong.monster/core"
	"github.com/Nerzal/gocloak/v13"
	"github.com/gin-gonic/gin"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

type createUnitInp struct {
	UnitName      string `json:"unit_name"`
	DisplayName   string `json:"display_name"`
	Description   string `json:"description"`
	ParentUnit    string `json:"parent_unit"`
	AdminUsername string `json:"admin_username"`
	AdminPassword string `json:"admin_password"`
}

func HandleCreate() gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var inp createUnitInp

		err := ctx.Bind(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		client := gocloak.NewClient(os.Getenv("KEYCLOAK_HOST"))
		token, err := client.LoginAdmin(ctx, os.Getenv("KEYCLOAK_USERNAME"), os.Getenv("KEYCLOAK_PASSWORD"), "master")
		if err != nil {
			ctx.AbortWithError(http.StatusInternalServerError, err)
			return
		}

		// Create a new realm
		realmID, err := client.CreateRealm(ctx, token.AccessToken, gocloak.RealmRepresentation{
			Realm:   &inp.UnitName,
			Enabled: gocloak.BoolP(true),
		})

		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// Create a new user
		userID, err := client.CreateUser(ctx, token.AccessToken, inp.UnitName, gocloak.User{
			Username: &inp.AdminUsername,
			Enabled:  gocloak.BoolP(true),
		})

		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		err = client.SetPassword(ctx, token.AccessToken, userID, inp.UnitName, inp.AdminPassword, false)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// Create realm roles for this new realm (unit_admin, unit_user)
		REALM_ROLES := []string{"unit_admin", "unit_normal"}

		for _, role := range REALM_ROLES {
			_, err = client.CreateRealmRole(ctx, token.AccessToken, inp.UnitName, gocloak.Role{
				Name: &role,
			})

			if err != nil {
				ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
				return
			}

		}

		// attach role unit_admin to this user
		roles, err := client.GetRealmRoles(ctx, token.AccessToken, inp.UnitName, gocloak.GetRoleParams{})

		for _, role := range roles {
			if *role.Name == "unit_admin" {
				err = client.AddRealmRoleToUser(ctx, token.AccessToken, inp.UnitName, userID, []gocloak.Role{*role})
				break
			}
		}

		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// create console client
		_, err = client.CreateClient(ctx, token.AccessToken, inp.UnitName, gocloak.Client{
			ClientID:     gocloak.StringP("console"),
			PublicClient: gocloak.BoolP(true),
			RedirectURIs: &[]string{
				fmt.Sprintf("https://%s.ducluong.monster/*", inp.UnitName),
			},
			WebOrigins: &[]string{
				fmt.Sprintf("https://%s.ducluong.monster", inp.UnitName),
			},
		})

		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// find client scope: role
		clientScopes, err := client.GetClientScopes(ctx, token.AccessToken, inp.UnitName)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		for _, clientScope := range clientScopes {
			if *clientScope.Name == "roles" {
				for _, mapper := range *clientScope.ProtocolMappers {
					if *mapper.Name == "realm roles" {
						mapper.ProtocolMappersConfig.ClaimName = gocloak.StringP("roles")
						mapper.ProtocolMappersConfig.UserinfoTokenClaim = gocloak.StringP("true")

						err := client.UpdateClientScopeProtocolMapper(ctx, token.AccessToken, inp.UnitName, *clientScope.ID, mapper)

						if err != nil {
							ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
							return
						}

						break
					}
				}
			}
		}

		// Init database instance
		db, err := gorm.Open(postgres.Open(os.Getenv("POSTGRES_DSN") + "/metadata"))
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// get current requesting user
		user, exits := ctx.Get("user")
		if !exits {
			ctx.AbortWithStatus(500)
			return
		}

		unit_url := fmt.Sprintf("%s.ducluong.monster", inp.UnitName)

		result := db.Create(core.Unit{
			RealmID:     realmID,
			OwnerID:     user.(core.User).ID,
			Name:        inp.UnitName,
			DisplayName: inp.DisplayName,
			Description: inp.Description,
			URL:         unit_url,
			ParentName:  &inp.ParentUnit,
		})

		if result.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": result.Error.Error()})
			return
		}

		// create database for the unit
		ctx.AbortWithStatus(201)
	}
}
