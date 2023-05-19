package tables

import (
	"net/http"

	"github.com/360EntSecGroup-Skylar/excelize"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func HandleUploadFromExcel(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		// parse data from uri
		var uriData getInp

		err := ctx.ShouldBindUri(&uriData)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
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

		ctx.JSON(http.StatusOK, rows[0])
	}
}
