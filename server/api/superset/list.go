package superset

import (
	"encoding/json"
	"fmt"
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
)

func HandleList() gin.HandlerFunc {
	return func(ctx *gin.Context) {
		superset_token, exists := ctx.Get("superset_admin_token")
		if !exists {
			ctx.AbortWithStatus(http.StatusInternalServerError)
			return
		}

		URL := os.Getenv("SUPERSET_HOST") + "api/v1/dashboard/"

		req, _ := http.NewRequest("GET", URL, nil)

		// Add authorization header with bearer token
		req.Header.Set("Authorization", fmt.Sprintf("Bearer %s", superset_token))

		client := &http.Client{}
		resp, err := client.Do(req)

		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}

		defer resp.Body.Close()

		var data map[string]any
		if err := json.NewDecoder(resp.Body).Decode(&data); err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}

		ctx.JSON(http.StatusOK, gin.H{
			"dashboards": data["result"],
		})
	}
}
