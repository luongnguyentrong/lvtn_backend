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
	UnitName    *string `json:"unit_name" binding:"required"`
	DisplayName *string `json:"display_name" binding:"required"`
	Description *string `json:"description"`
	ParentUnit  *string `json:"parent_unit" binding:"required"`
}

func HandleCreate() gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var inp createUnitInp

		err := ctx.Bind(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// Init keycloak client
		client := gocloak.NewClient(os.Getenv("KEYCLOAK_HOST"))
		token, err := client.LoginAdmin(ctx, os.Getenv("KEYCLOAK_USERNAME"), os.Getenv("KEYCLOAK_PASSWORD"), "master")
		if err != nil {
			ctx.AbortWithError(http.StatusInternalServerError, err)
			return
		}

		// Create a new realm
		realmID, err := client.CreateRealm(ctx, token.AccessToken, gocloak.RealmRepresentation{
			Realm:   inp.UnitName,
			Enabled: gocloak.BoolP(true),
		})

		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// Create realm roles for this new realm (unit_manager, unit_user)
		REALM_ROLES := []string{"unit_manager", "unit_normal"}

		for _, role := range REALM_ROLES {
			_, err = client.CreateRealmRole(ctx, token.AccessToken, *inp.UnitName, gocloak.Role{
				Name: &role,
			})

			if err != nil {
				ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
				return
			}

		}

		// Create console client to perform sso on this unit
		_, err = client.CreateClient(ctx, token.AccessToken, *inp.UnitName, gocloak.Client{
			ClientID:     gocloak.StringP("console"),
			PublicClient: gocloak.BoolP(true),
			RedirectURIs: &[]string{
				"http://localhost:3000/*",
				fmt.Sprintf("https://%s.ducluong.monster/*", *inp.UnitName),
			},
			WebOrigins: &[]string{
				"http://localhost:3000",
				fmt.Sprintf("https://%s.ducluong.monster", *inp.UnitName),
			}, })

		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// Find client scope: role
		clientScopes, err := client.GetClientScopes(ctx, token.AccessToken, *inp.UnitName)
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

						err := client.UpdateClientScopeProtocolMapper(ctx, token.AccessToken, *inp.UnitName, *clientScope.ID, mapper)

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

		requesting_user_id := user.(core.User).ID

		unit_url := fmt.Sprintf("%s.ducluong.monster", *inp.UnitName)

		result := db.Create(core.Unit{
			RealmID:     &realmID,
			CreatedBy:   &requesting_user_id,
			Name:        inp.UnitName,
			DisplayName: inp.DisplayName,
			Description: inp.Description,
			URL:         &unit_url,
			ParentName:  inp.ParentUnit,
		})

		if result.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": result.Error.Error()})
			return
		}

		// create database for the unit
		ctx.AbortWithStatus(201)
	}
}
