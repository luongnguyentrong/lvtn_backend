package middleware

import (
	"bytes"
	"encoding/json"
	"errors"
	"fmt"
	"net/http"
	"net/url"
	"os"
	"strings"

	"api.ducluong.monster/core"
	"api.ducluong.monster/utils"
	"github.com/gin-gonic/gin"
)

var errorUserNotFound = errors.New("user not found")

func verifyToken(token string, ctx *gin.Context) (bool, error) {
	unit_name := utils.GetUnit(ctx.Request.Header.Get("Origin"))

	INTROSPECT_ENDPOINT := fmt.Sprintf("https://sso.ducluong.monster/realms/%s/protocol/openid-connect/token/introspect", unit_name)

	data := url.Values{}
	data.Set("client_id", os.Getenv("CLIENT_ID"))
	data.Set("client_secret", os.Getenv("CLIENT_SECRET"))
	data.Set("token", token)

	fmt.Println(os.Getenv("CLIENT_ID"), os.Getenv("CLIENT_SECRET"), INTROSPECT_ENDPOINT)

	resp, err := http.Post(INTROSPECT_ENDPOINT, "application/x-www-form-urlencoded", bytes.NewBufferString(data.Encode()))
	if err != nil {
		return false, err
	}

	defer resp.Body.Close()

	var introspectionResp core.User

	err = json.NewDecoder(resp.Body).Decode(&introspectionResp)
	if err != nil {
		fmt.Println("IN HERE HERE")
		return false, err
	}

	ctx.Set("user", introspectionResp)

	fmt.Println("OR IN HERE", introspectionResp)
	return introspectionResp.Active, nil
}

func Protected() gin.HandlerFunc {
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

		isActive, err := verifyToken(token, ctx)
		fmt.Println("IN HERE: ", isActive)
		if !isActive {
			if err != nil {
				ctx.AbortWithError(http.StatusUnauthorized, err)
				return
			}

			ctx.AbortWithError(http.StatusUnauthorized, errors.New("Token is expired"))
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
