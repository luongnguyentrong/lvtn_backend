package tables

import (
	"fmt"
	"log"
	"net/http"
	"strconv"
	"strings"

	"api.ducluong.monster/core"
	"api.ducluong.monster/shared/db"
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

		var block core.Block
		block.ID = uriData.BlockID
		results := metadataDB.First(&block)
		if results.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": results.Error})
			return
		}

		var table core.Table
		table.ID = uriData.TableID

		results = metadataDB.First(&table)
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
		pckDB, err := db.Create("pck")
		if err != nil {
			log.Fatal(err)
		}

		tx := pckDB.Begin()
		fmt.Println(tx)
		fields := make([]string, 0) // Store the field names dynamically
		lengthField := len(rows[0])
		for i, row := range rows {
			if len(row) != lengthField {
				ctx.JSON(http.StatusBadRequest, gin.H{"Tên cột và các trường dữ liệu không khớp": err.Error()})
			 	return
			}
			if i == 0 {
				fields = generateCodeList(row)
				continue
			}
			var values []interface{}
			for j, field := range fields {
				// Convert the value to the expected data type based on the PostgreSQL table column
				colValue := row[j]
				if colValue != "" {
					if isIntColumn(field) {
						intValue, err := strconv.Atoi(colValue)
						if err != nil {
							ctx.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to convert value to integer"})
							return
						}
						values = append(values, intValue)
					} else {
						if colValue == "DEFAULT" {
							values = append(values, nil) // Use NULL for DEFAULT keyword
						}else {
							values = append(values, colValue)
						}
					}
				} else {
					values = append(values, nil) // Handle empty values as NULL
				}
			}
			insertQuery := fmt.Sprintf("INSERT INTO %s(%s) VALUES ",*block.Name+ "."+*table.Name, strings.Join(fields, ", "))
			placeholders := make([]string, len(fields))
			for j := range fields {
				placeholders[j] = fmt.Sprintf("$%d", j+1)
			}
			insertQuery += fmt.Sprintf("(%s)", strings.Join(placeholders, ", "))
			//fmt.Println("Query: ",insertQuery, values)
			result := tx.Exec(insertQuery, values...)
			//fmt.Println(result)
			if result.Error != nil {
				// Print the error message if it's not nil
				fmt.Println("Exec Error:", result.Error.Error())
				tx.Rollback()
				return
			}
		}
		if err := tx.Commit().Error; err != nil {
				fmt.Println("Commit Error:", err.Error())
				ctx.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
				return
		}
		ctx.JSON(http.StatusOK, gin.H{"message": "File uploaded and data imported successfully"})
	}
}

func isIntColumn(columnName string) bool {
	_, err := strconv.Atoi(columnName)
	return err == nil
}

func generateCodeList(input []string) []string {
	var output []string

	for _, str := range input {
		words := strings.Fields(str) // Split string into words
		code := ""

		for _, word := range words {
			// Convert "Đ" to "d"
			word = strings.ReplaceAll(word, "Đ", "d")
			word = strings.ReplaceAll(word, "đ", "d")

			code += string(word[0]) // Take the first character of each word
		}

		output = append(output, strings.ToLower(code))
	}

	return output
}
