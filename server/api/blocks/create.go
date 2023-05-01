package blocks

import (
	"fmt"
	"net/http"
	"os"

	"api.ducluong.monster/core"
	"github.com/gin-gonic/gin"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

type createBlockInp struct {
	DisplayName string `json:"display_name"`
	Name        string `json:"name"`
	Description string `json:"description"`
	CreatedBy   string `json:"created_by"`
}

func HandleCreate() gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var inp createBlockInp

		err := ctx.Bind(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		db, err := gorm.Open(postgres.Open(os.Getenv("POSTGRES_DSN") + "/metadata"))
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		// insert new block to database
		newBlock := core.Block{
			Name: inp.Name,
			DisplayName: inp.DisplayName,
			Description: inp.Description,
			CreatedBy: inp.CreatedBy,
		}

		result := db.Create(&newBlock)
		if result.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": result.Error.Error()})
			return
		}

		// create corresponding database
		result = db.Exec(fmt.Sprintf("CREATE DATABASE %s", inp.Name))
		if result.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": result.Error.Error()})
			return
		}

		ctx.Status(http.StatusCreated)
	}
}
