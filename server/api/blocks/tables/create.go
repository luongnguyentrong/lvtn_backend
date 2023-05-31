package tables

import (
	"fmt"
	"net/http"
	"strings"

	"api.ducluong.monster/core"
	"api.ducluong.monster/shared/db"
	"api.ducluong.monster/utils"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type colInp struct {
	Name        *string `json:"name"`
	IsPrimary   *bool   `json:"is_primary"`
	NotNull     *bool   `json:"not_null"`
	IsIndexed   *bool   `json:"is_indexed"`
	DisplayName *string `json:"display_name"`
	ColumnType  *string `json:"column_type"`
	Order       *uint   `json:"order"`
}

type createTableInp struct {
	DisplayName *string  `json:"display_name" binding:"required"`
	Name        *string  `json:"name" binding:"required"`
	Description *string  `json:"description"`
	CreatedBy   *string  `json:"created_by" binding:"required"`
	Columns     []colInp `json:"columns"`
}

type uriData struct {
	BlockID *uint `uri:"block_id"`
}

func toSQL(table createTableInp, blockName string) string {
	columnDefs := make([]string, len(table.Columns))

	for i, col := range table.Columns {
		columnDefs[i] = fmt.Sprintf("%s %s", *col.Name, *col.ColumnType)

		if col.IsPrimary != nil && *col.IsPrimary {
			columnDefs[i] += " PRIMARY KEY"
		}

		if col.NotNull != nil && *col.NotNull {
			columnDefs[i] += " NOT NULL"
		}
	}

	createTable := fmt.Sprintf("CREATE TABLE IF NOT EXISTS %s.%s (%s)", blockName, *table.Name, strings.Join(columnDefs[:], ","))

	return createTable
}

func getIndexCols(cols []colInp) []string {
	var res []string
	for _, col := range cols {
		if col.IsIndexed != nil && *col.IsIndexed {
			res = append(res, *col.Name)
		}
	}

	return res
}

func HandleCreate(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var blockData uriData
		var inp createTableInp

		// decode request body
		err := ctx.Bind(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// get data from uri
		err = ctx.ShouldBindUri(&blockData)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// get block data
		var block core.Block
		block.ID = blockData.BlockID

		result := metadataDB.First(&block)
		if result.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": result.Error.Error()})
			return
		}

		// get current unit from request origin
		cur_unit := utils.GetUnit(ctx.Request.Header.Get("Origin"))

		// open database connection to unit's database
		db, err := db.Create(cur_unit)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		// create table in unit's database
		result = db.Exec(toSQL(inp, *block.Name))
		if result.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": result.Error.Error()})
			return
		}

		// create index
		index_cols := getIndexCols(inp.Columns)

		if len(index_cols) > 0 {
			for _, col := range index_cols {
				sql_command := fmt.Sprintf("CREATE INDEX idx_%s ON %s.%s (%s);", col, *block.Name, *inp.Name, col)

				result = db.Exec(sql_command)
				if result.Error != nil {
					ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": result.Error.Error()})
					return
				}
			}
		}

		// close connection
		sqlDB, _ := db.DB()
		sqlDB.Close()

		// save table metadata to database
		newTable := core.Table{
			Name:        inp.Name,
			DisplayName: inp.DisplayName,
			BlockID:     blockData.BlockID,
			Description: inp.Description,
		}

		result = metadataDB.Create(&newTable)
		if result.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": result.Error.Error()})
			return
		}

		// save table column metadata to database
		for _, col := range inp.Columns {
			newColumn := core.Column{
				Name:        col.Name,
				DisplayName: col.DisplayName,
				ColumnType:  col.ColumnType,
				TableID:     newTable.ID,
				IsPrimary:   col.IsPrimary,
				NotNull:     col.NotNull,
				Order:       col.Order,
			}

			result = metadataDB.Create(&newColumn)
			if result.Error != nil {
				ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": result.Error.Error()})
				return
			}
		}

		ctx.JSON(http.StatusCreated, newTable)
	}
}
