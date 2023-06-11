package tables

import (
	"fmt"
	"net/http"
	"strings"

	"api.ducluong.monster/core"
	"api.ducluong.monster/shared/db"
	"api.ducluong.monster/utils"
	"github.com/lib/pq"
	"github.com/360EntSecGroup-Skylar/excelize"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func build_insert(row []string, cols []core.Column) string {
	arr := []string{}

	for i, col := range row {
		if strings.Contains(*cols[i].ColumnType, "varchar") {
			quoted_str := pq.QuoteLiteral(col)
			arr = append(arr, quoted_str)
		} else {
			arr = append(arr, col)
		}
	}

	return "(" + strings.Join(arr[:], ",") + ")"
}

func HandleUploadFromExcel(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		// parse data from uri
		var uriData getInp

		err := ctx.ShouldBindUri(&uriData)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// get block info
		var block core.Block
		block.ID = uriData.BlockID
		results := metadataDB.First(&block)
		if results.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": results.Error})
			return
		}

		// get table info
		var table core.Table
		table.ID = uriData.TableID

		results = metadataDB.First(&table)
		if results.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": results.Error})
			return
		}

		// get columns metadata from database
		var cols []core.Column
		results = metadataDB.Where("table_id = ?", table.ID).Order("\"order\" ASC").Find(&cols)
		if results.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": results.Error})
			return
		}

		// read csv file from request
		file, err := ctx.FormFile("file")
		if err != nil {
			ctx.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			return
		}

		src, err := file.Open()
		if err != nil {
			ctx.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			return
		}

		// parse csv file
		excel, err := excelize.OpenReader(src)
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		// Assuming the data is in the first sheet
		rows := excel.GetRows(excel.GetSheetName(1))

		// extract rows
		exec_cols := rows[0]
		data_rows := rows[1:]

		// build the first insert str
		insert_str := fmt.Sprintf("INSERT INTO %s.%s (%s)", *block.Name, *table.Name, strings.Join(exec_cols[:], ","))

		// build bulk values
		values_str := "VALUES "

		string_rows := make([]string, len(data_rows))
		for i, row := range data_rows {
			string_rows[i] = build_insert(row, cols)
		}

		values_str += strings.Join(string_rows[:], ",")

		// build conflict string
		on_conflict := "ON CONFLICT "

		// find primary columns
		for _, col := range cols {
			if col.IsPrimary != nil && *col.IsPrimary {
				on_conflict += " (" + *col.Name + ")"
				break
			}
		}

		// build update string on flict
		update_str := "DO UPDATE SET "
		for i, col := range cols {
			update_str += fmt.Sprintf("%s = EXCLUDED.%s", *col.Name, *col.Name)

			if i < len(cols)-1 {
				update_str += ", "
			}
		}

		// Open connection to unit's database
		pckDB, err := db.Create(utils.GetUnit(ctx.Request.Header.Get("Origin")))
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		err = pckDB.Exec(fmt.Sprintf("%s %s %s %s", insert_str, values_str, on_conflict, update_str)).Error
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		ctx.AbortWithStatus(http.StatusOK)
	}
}
