package tables

import (
	"fmt"
	"net/http"

	"api.ducluong.monster/core"
	"api.ducluong.monster/shared/db"
	"api.ducluong.monster/utils"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func HandleDelete(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		// get block id from uri
		var inp getInp

		err := ctx.ShouldBindUri(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// get block info
		var block core.Block
		block.ID = inp.BlockID

		result := metadataDB.First(&block)
		if result.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": result.Error})
			return
		}

		// get table info
		var table core.Table
		table.ID = inp.TableID

		err = metadataDB.First(&table).Error
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err})
			return
		}

		// open connection to unit database
		db, err := db.Create(utils.GetUnit(ctx.Request.Header.Get("Origin")))
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		// delete corresponding table
		err = db.Exec(fmt.Sprintf("DROP TABLE %s.%s", *block.Name, *table.Name)).Error
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

		// delete table info in metadata
		err = metadataDB.Delete(&table).Error
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err})
			return
		}

		ctx.Status(http.StatusOK)
	}
}
