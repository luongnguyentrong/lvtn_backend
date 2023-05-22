package references

import (
	"fmt"
	"net/http"

	"api.ducluong.monster/core"
	"api.ducluong.monster/shared/db"
	"api.ducluong.monster/utils"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type uriInp struct {
	BlockID *uint `uri:"block_id"`
}

type createInp struct {
	TableName     *string `json:"table_name" binding:"required"`
	ColumnName    *string `json:"column_name" binding:"required"`
	RefTableName  *string `json:"ref_table_name" binding:"required"`
	RefColumnName *string `json:"ref_column_name" binding:"required"`
}

func HandleCreate(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var uriData uriInp
		var inp createInp

		// get data from request body
		err := ctx.Bind(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// get data from uri
		err = ctx.ShouldBindUri(&uriData)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// get block data
		var block core.Block
		block.ID = uriData.BlockID

		err = metadataDB.First(&block).Error
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err})
			return
		}

		// create contraint name for this reference
		constraint_name := fmt.Sprintf("fk_%s_%s", *inp.ColumnName, *inp.RefColumnName)

		sql_command := fmt.Sprintf("ALTER TABLE %s.%s ADD CONSTRAINT %s FOREIGN KEY (%s) REFERENCES %s.%s(%s)",
			*block.Name, *inp.TableName, constraint_name, *inp.ColumnName, *block.Name, *inp.RefTableName, *inp.RefColumnName)

		// create connection to unit's database
		db, err := db.Create(utils.GetUnit(ctx.Request.Header.Get("Origin")))
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// create contraint in unit's database
		if err := db.Exec(sql_command).Error; err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}

		// save reference info to metadata
		ref := core.Reference{
			TableName:     inp.TableName,
			ColumnName:    inp.ColumnName,
			RefTableName:  inp.RefTableName,
			RefColumnName: inp.RefColumnName,
			ContraintName: &constraint_name,
			BlockID:       uriData.BlockID,
		}

		if err := metadataDB.Create(&ref).Error; err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}

		// close connection to database unit
		postgres, _ := db.DB()
		postgres.Close()

		ctx.JSON(http.StatusCreated, ref)
	}
}
