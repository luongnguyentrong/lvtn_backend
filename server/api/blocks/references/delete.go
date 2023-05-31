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

type deleteInp struct {
	RefID   *uint `uri:"ref_id"`
	BlockID *uint `uri:"block_id"`
}

func HandleDelete(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var uriData deleteInp

		// get data from uri
		err := ctx.ShouldBindUri(&uriData)
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

		// query reference from metadata
		var ref core.Reference
		ref.ID = uriData.RefID
		results := metadataDB.First(&ref)
		if results.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": results.Error.Error()})
			return
		}

		// create connection to unit's database
		db, err := db.Create(utils.GetUnit(ctx.Request.Header.Get("Origin")))
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// drop contraint in unit's database
		delete_constraint_sql := fmt.Sprintf("ALTER TABLE %s.%s DROP CONSTRAINT %s", *block.Name, *ref.TableName, *ref.ContraintName)
		if err := db.Exec(delete_constraint_sql).Error; err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}

		// delete reference data
		results = metadataDB.Delete(&ref)
		if results.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": results.Error.Error()})
			return
		}

		// drop connection to unit's database
		postgres, _ := db.DB()
		postgres.Close()

		ctx.AbortWithStatus(http.StatusOK)
	}
}
