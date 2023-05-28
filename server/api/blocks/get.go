package blocks

import (
	"net/http"

	"api.ducluong.monster/core"
	"api.ducluong.monster/shared/db"
	"api.ducluong.monster/utils"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type getInp struct {
	BlockID *uint `uri:"block_id"`
}

func HandleGet(metadataDB *gorm.DB, keycloakDB *gorm.DB) gin.HandlerFunc {
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

		// open connection to unit database
		db, err := db.Create(utils.GetUnit(ctx.Request.Header.Get("Origin")))
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		type scheme_size struct {
			SchemaSize *string `json:"schema_size"`
		}

		// get schema size
		var schemaSize scheme_size
		err = db.Raw("SELECT pg_size_pretty(SUM(pg_total_relation_size(c.oid))) AS schema_size FROM pg_class c JOIN pg_namespace n ON (c.relnamespace = n.oid) WHERE n.nspname = ?", *block.Name).Scan(&schemaSize).Error
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		// close connection
		sqlDB, _ := db.DB()
		sqlDB.Close()

		// get manager info
		managers := make([]map[string]any, len(block.ManagerIDs))

		for j, manager_id := range block.ManagerIDs {
			err := keycloakDB.Raw("SELECT * FROM user_entity WHERE id = ?", manager_id).Scan(&managers[j]).Error
			if err != nil {
				ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
				return
			}
		}

		ctx.JSON(http.StatusOK, gin.H{
			"block":       block,
			"schema_size": schemaSize.SchemaSize,
			"managers":    managers,
		})
	}
}
