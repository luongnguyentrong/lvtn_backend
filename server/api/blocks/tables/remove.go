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

func HandleRemove(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		// get data from uri
		var inp getInp

		err := ctx.ShouldBindUri(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// get data from request body
		var data map[string]interface{}

		err = ctx.Bind(&data)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// get data from uri
		var uriData getInp
		err = ctx.ShouldBindUri(&uriData)
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

		// open database connection to unit's database
		cur_unit := utils.GetUnit(ctx.Request.Header.Get("Origin"))

		db, err := db.Create(cur_unit)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		// get primary columns
		var cols []core.Column
		err = metadataDB.Where("is_primary = true and table_id = ?", inp.TableID).Find(&cols).Error
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		// build query string
		query_strings := make([]string, len(cols))

		for i, col := range cols {
			if strings.HasPrefix(strings.ToLower(*col.ColumnType), "varchar") {
				query_strings[i] = fmt.Sprintf("%s = '%v'", *col.Name, data[*col.Name])
			} else {
				query_strings[i] = fmt.Sprintf("%s = %v", *col.Name, data[*col.Name])
			}
		}

		query_str := strings.Join(query_strings, " and ")

		err = db.Table(fmt.Sprintf("%s.%s", *block.Name, *table.Name)).Where(query_str).Delete(data).Error

		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err})
			return
		}

		ctx.Status(http.StatusOK)
	}
}
