package superset

import (
	"bytes"
	"encoding/json"
	"fmt"
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
)

type createDashboard struct {
	Title *string `json:"title" binding:"required"`
}

func HandleCreate() gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var inp createDashboard

		err := ctx.Bind(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}

		superset_token, exists := ctx.Get("superset_admin_token")
		if !exists {
			ctx.AbortWithStatus(http.StatusInternalServerError)
			return
		}

		URL := os.Getenv("SUPERSET_HOST") + "api/v1/dashboard/"
		body := map[string]string{
			"dashboard_title": *inp.Title,
		}

		json_data, err := json.Marshal(body)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}

		req, err := http.NewRequest("POST", URL, bytes.NewBuffer(json_data))
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}

		req.Header.Set("Content-Type", "application/json")
		req.Header.Set("Authorization", fmt.Sprintf("Bearer %s", superset_token))

		client := &http.Client{}
		resp, err := client.Do(req)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}

		defer resp.Body.Close()

		ctx.AbortWithStatus(http.StatusCreated)
	}
}
