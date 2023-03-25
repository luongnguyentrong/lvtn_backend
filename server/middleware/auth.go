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
	"github.com/gin-gonic/gin"
)

func verifyToken(token string, ctx *gin.Context) (bool, error) {
	unit_name := "hcmut"

	INTROSPECT_ENDPOINT := fmt.Sprintf("https://sso.ducluong.monster/realms/%s/protocol/openid-connect/token/introspect", unit_name)

	data := url.Values{}
	data.Set("client_id", os.Getenv("CLIENT_ID"))
	data.Set("client_secret", os.Getenv("CLIENT_SECRET"))
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

	fmt.Println(introspectionResp)

	ctx.Set("user", introspectionResp)

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
