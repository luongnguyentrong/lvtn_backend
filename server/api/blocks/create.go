package blocks

import (
	"fmt"
	"net/http"
	"os"

	"api.ducluong.monster/core"
	"api.ducluong.monster/utils"
	"github.com/gin-gonic/gin"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

type createBlockInp struct {
	DisplayName *string `json:"display_name" binding:"required"`
	Name        *string `json:"name" binding:"required"`
	Description *string `json:"description"`
	CreatedBy   *string `json:"created_by" binding:"required"`
}

func HandleCreate(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var inp createBlockInp

		err := ctx.Bind(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		cur_unit := utils.GetUnit(ctx.Request.Header.Get("Origin"))

		// insert new block to database
		newBlock := core.Block{
			Name:        inp.Name,
			Realm:       &cur_unit,
			DisplayName: inp.DisplayName,
			Description: inp.Description,
			CreatedBy:   inp.CreatedBy,
		}

		result := metadataDB.Create(&newBlock)
		if result.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": result.Error.Error()})
			return
		}

		db, err := gorm.Open(postgres.Open(os.Getenv("POSTGRES_DSN") + "/" + cur_unit))
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		// create corresponding database
		result = db.Exec(fmt.Sprintf("CREATE SCHEMA IF NOT EXISTS %s", *inp.Name))
		if result.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": result.Error.Error()})
			return
		}

		connection, err := db.DB()
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		connection.Close()

		ctx.Status(http.StatusCreated)
	}
}
