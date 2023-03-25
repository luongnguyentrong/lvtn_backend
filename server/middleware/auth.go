package middleware

import (
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
)

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

		// Set the token in the context for use in the handler
		ctx.Set("token", token)

		// Call the next handler
		ctx.Next()
	}
}
