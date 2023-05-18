package tables

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

type getInp struct {
	BlockID *uint `uri:"block_id"`
	TableID *uint `uri:"table_id"`
}

type column struct {
	Title      *string `json:"title"`
	DataIndex  *string `json:"dataIndex"`
	ColumnType *string `json:"column_type"`
	IsPrimary  *bool   `json:"is_primary"`
}

func truncate(cols []core.Column) []column {
	var new_cols = make([]column, len(cols))

	for i, col := range cols {
		new_cols[i].Title = col.DisplayName
		new_cols[i].DataIndex = col.Name
		new_cols[i].ColumnType = col.ColumnType
		new_cols[i].IsPrimary = col.IsPrimary
	}

	return new_cols
}

func HandleGet(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var inp getInp

		err := ctx.ShouldBindUri(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// get block info
		var block core.Block
		block.ID = inp.BlockID

		results := metadataDB.First(&block)
		if results.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": results.Error})
			return
		}

		// get table info
		var table core.Table
		table.ID = inp.TableID

		results = metadataDB.First(&table)
		if results.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": results.Error})
			return
		}

		// get columns metadata from database
		var cols []core.Column
		results = metadataDB.Where("table_id = ?", inp.TableID).Find(&cols)
		if results.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": results.Error})
			return
		}

		var truncated_cols = truncate(cols)

		// open database connection to unit's database
		cur_unit := utils.GetUnit(ctx.Request.Header.Get("Origin"))

		db, err := gorm.Open(postgres.Open(os.Getenv("POSTGRES_DSN") + "/" + cur_unit))
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		var result []map[string]any = []map[string]any{}
		db.Raw(fmt.Sprintf("SELECT * FROM %s.%s", *block.Name, *table.Name)).Scan(&result)

		ctx.JSON(http.StatusOK, gin.H{
			"columns": truncated_cols,
			"data":    result,
		})
	}
}
