package tables

import (
	"fmt"
	"net/http"
	"strings"

	"os"

	"api.ducluong.monster/core"
	"api.ducluong.monster/utils"
	"github.com/gin-gonic/gin"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

type colInp struct {
	Name        *string `json:"name"`
	DisplayName *string `json:"display_name"`
	ColumnType  *string `json:"column_type"`
}

type createTableInp struct {
	DisplayName *string  `json:"display_name" binding:"required"`
	Name        *string  `json:"name" binding:"required"`
	Description *string  `json:"description"`
	CreatedBy   *string  `json:"created_by" binding:"required"`
	Columns     []colInp `json:"columns"`
}

type uriData struct {
	BlockName string `uri:"block_name"`
}

func toSQL(table createTableInp, blockName string) string {
	columnDefs := make([]string, len(table.Columns))

	for i, col := range table.Columns {
		columnDefs[i] = fmt.Sprintf("%s %s", *col.Name, *col.ColumnType)

		if i == 0 {
			columnDefs[i] += " PRIMARY KEY"
		}
	}

	createTable := fmt.Sprintf("CREATE TABLE IF NOT EXISTS %s.%s (%s)", blockName, *table.Name, strings.Join(columnDefs[:], ","))

	return createTable
}

func HandleCreate(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var blockData uriData
		var inp createTableInp

		err := ctx.Bind(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		err = ctx.ShouldBindUri(&blockData)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		newTable := core.Table{
			Name:        inp.Name,
			DisplayName: inp.DisplayName,
			BlockName:   &blockData.BlockName,
			Description: inp.Description,
			CreatedBy:   inp.CreatedBy,
		}

		result := metadataDB.Create(&newTable)
		if result.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": result.Error.Error()})
			return
		}

		// for _, col := range inp.Columns {
		// 	newColumn := core.Column{
		// 		Name:        col.Name,
		// 		DisplayName: col.DisplayName,
		// 		ColumnType:  col.ColumnType,
		// 		TableName:   inp.Name,
		// 	}

		// 	result = metadataDB.Create(&newColumn)
		// 	if result.Error != nil {
		// 		ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": result.Error.Error()})
		// 		return
		// 	}
		// }

		cur_unit := utils.GetUnit(ctx.Request.Header.Get("Origin"))

		db, err := gorm.Open(postgres.Open(os.Getenv("POSTGRES_DSN") + "/" + cur_unit))
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		result = db.Exec(toSQL(inp, blockData.BlockName))
		if result.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": result.Error.Error()})
			return
		}

		ctx.Status(http.StatusCreated)
	}
}
