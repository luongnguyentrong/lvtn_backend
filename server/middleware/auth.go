package middleware

import (
	"bytes"
	"encoding/json"
	"errors"
	"fmt"
	"net/http"
	"net/url"
	"strings"

	"api.ducluong.monster/core"
	"api.ducluong.monster/utils"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

var errorUserNotFound = errors.New("user not found")

func verifyToken(token string, keycloakDB *gorm.DB, ctx *gin.Context) (bool, error) {
	unit_name := utils.GetUnit(ctx.Request.Header.Get("Origin"))

	INTROSPECT_ENDPOINT := fmt.Sprintf("https://sso.ducluong.monster/realms/%s/protocol/openid-connect/token/introspect", unit_name)

	var client map[string]any

	keycloakDB.Raw("select client.client_id, client.secret from realm, client where realm.name = ? and realm.id = client.realm_id and client.client_id = 'api_server'", unit_name).Scan(&client)

	data := url.Values{}
	data.Set("client_id", client["client_id"].(string))
	data.Set("client_secret", client["secret"].(string))
	data.Set("token", token)

	resp, err := http.Post(INTROSPECT_ENDPOINT, "application/x-www-form-urlencoded", bytes.NewBufferString(data.Encode()))
	if err != nil {
		return false, err
	}

	defer resp.Body.Close()

	var introspectionResp core.User

	err = json.NewDecoder(resp.Body).Decode(&introspectionResp)
	if err != nil {
		return false, err
	}

	ctx.Set("user", introspectionResp)

	return introspectionResp.Active, nil
}

func Protected(keycloakDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		authHeader := ctx.GetHeader("Authorization")

		// Check if the Authorization header is empty
		if authHeader == "" {
			ctx.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"error": "Missing Authorization header"})
			return
		}

		// Check if the Authorization header starts with "Bearer"
		if !strings.HasPrefix(authHeader, "Bearer ") {
			ctx.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"error": "Invalid Authorization header"})
			return
		}

		// Extract the token from the Authorization header
		token := strings.TrimPrefix(authHeader, "Bearer ")

		isActive, err := verifyToken(token, keycloakDB, ctx)
		if !isActive {
			if err != nil {
				ctx.AbortWithError(http.StatusUnauthorized, err)
				return
			}

			ctx.AbortWithError(http.StatusUnauthorized, errors.New("token is expired"))
			return
		}

		if err != nil {
			ctx.AbortWithError(http.StatusUnauthorized, err)
			return
		}

		// Call the next handler
		ctx.Next()
	}
}

func AllowedRoles(roles ...string) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		user, exists := ctx.Get("user")
		if !exists {
			ctx.AbortWithError(http.StatusUnauthorized, errorUserNotFound)
			return
		}

		for _, allowedRole := range roles {
			for _, userRole := range user.(core.User).Roles {
				if allowedRole == userRole {
					ctx.Next()
					return
				}
			}
		}

		ctx.Status(401)
	}
}
