package superset

import (
	"net/http"
	"os"

	"api.ducluong.monster/utils"
	"github.com/gin-gonic/gin"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

func HandleList() gin.HandlerFunc {
	return func(ctx *gin.Context) {
		// open connection to unit's superset database
		cur_unit := utils.GetUnit(ctx.Request.Header.Get("Origin"))

		db, err := gorm.Open(postgres.Open(os.Getenv("POSTGRES_DSN") + "/superset_" + cur_unit))
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		// query dashboard table
		var result []map[string]any = []map[string]any{}
		db.Raw("SELECT * FROM dashboards").Scan(&result)

		// close connection
		postgres, _ := db.DB()
		postgres.Close()

		ctx.JSON(http.StatusOK, result)
	}
}
