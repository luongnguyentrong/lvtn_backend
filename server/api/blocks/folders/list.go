package folders

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

func HandleList(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var inp getInp
		err := ctx.ShouldBindUri(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}
		var block core.Block
		block.ID = inp.BlockID

		results := metadataDB.First(&block)

		//open 
		cur_unit := utils.GetUnit(ctx.Request.Header.Get("Origin"))
		db, err := gorm.Open(postgres.Open(os.Getenv("POSTGRES_DSN") + "/" + cur_unit))
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		//sql := "SELECT * FROM " + *block.Name + ".folders"

		var result []map[string]any = []map[string]any{}
		db.Raw(fmt.Sprintf("SELECT * FROM %s.%s",*block.Name,"folders")).Scan(&result)
		
		fmt.Println(result)

		if results.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": results.Error.Error()})
			return
		}

		ctx.JSON(http.StatusOK, result)
	}
}
