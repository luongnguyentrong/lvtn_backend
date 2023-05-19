package middleware

import (
	"net/http"
	"os"

	"github.com/Nerzal/gocloak/v13"
	"github.com/gin-gonic/gin"
)

func InjectKeycloak() gin.HandlerFunc {
	return func(ctx *gin.Context) {
		client := gocloak.NewClient(os.Getenv("KEYCLOAK_HOST"))

		token, err := client.LoginAdmin(ctx, os.Getenv("KEYCLOAK_USERNAME"), os.Getenv("KEYCLOAK_PASSWORD"), "master")

		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err})
			return
		}

		ctx.Set("keycloak_client", client)
		ctx.Set("admin_token", token.AccessToken)

		ctx.Next()
	}
}
