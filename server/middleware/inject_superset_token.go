package middleware

import (
	"bytes"
	"encoding/json"
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
)

func InjectSupersetToken() gin.HandlerFunc {
	return func(ctx *gin.Context) {
		URL := os.Getenv("SUPERSET_HOST") + "/api/v1/security/login"

		body := map[string]any{
			"password": os.Getenv("SUPERSET_ADMIN_PASSWORD"),
			"provider": "db",
			"refresh":  true,
			"username": os.Getenv("SUPERSET_ADMIN_USER"),
		}

		json_data, err := json.Marshal(body)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err})
			return
		}

		resp, err := http.Post(URL, "application/json", bytes.NewBuffer(json_data))
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err})
			return
		}

		defer resp.Body.Close()

		var res map[string]interface{}

		err = json.NewDecoder(resp.Body).Decode(&res)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err})
			return
		}

		ctx.Set("superset_admin_token", res["access_token"])

		ctx.Next()
	}
}
