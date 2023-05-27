package blocks

import (
	"fmt"
	"net/http"

	"api.ducluong.monster/core"
	"api.ducluong.monster/shared/db"
	"api.ducluong.monster/utils"
	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
	"gorm.io/gorm"
)

type createBlockInp struct {
	DisplayName *string        `json:"display_name" binding:"required"`
	Name        *string        `json:"name" binding:"required"`
	Description *string        `json:"description"`
	CreatedBy   *string        `json:"created_by" binding:"required"`
	ManagerIDs  pq.StringArray `json:"manager_ids" binding:"required"`
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

		// open connection to unit database
		db, err := db.Create(cur_unit)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		// create corresponding schema
		err = db.Exec(fmt.Sprintf("CREATE SCHEMA IF NOT EXISTS %s", *inp.Name)).Error
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err})
			return
		}

		// close connection
		connection, err := db.DB()
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		connection.Close()

		// save metadata to database
		newBlock := core.Block{
			Name:        inp.Name,
			UnitName:    &cur_unit,
			DisplayName: inp.DisplayName,
			Description: inp.Description,
			CreatedBy:   inp.CreatedBy,
			ManagerIDs:  inp.ManagerIDs,
		}

		result := metadataDB.Create(&newBlock)
		if result.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": result.Error.Error()})
			return
		}

		ctx.Status(http.StatusCreated)
	}
}
