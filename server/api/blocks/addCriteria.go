package blocks

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"strconv"

	"api.ducluong.monster/core"
	"api.ducluong.monster/shared/db"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type addCriteriaInp struct{
	Id 	     int    `json:"id"`
	Contents string    `json:"contents"`
}

type addEviInp struct{
	CritId   int       `json:"id"`
	Contents string    `json:"name"`
	Title    string    `json:"title"`
}

func HandleAddCriteria(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var inp getInp
		var inpBody addCriteriaInp

		err := ctx.ShouldBindUri(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		requestBody, err := ioutil.ReadAll(ctx.Request.Body)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		err = json.Unmarshal(requestBody, &inpBody)
		if err != nil {
			panic(err)
		}

		var block core.Block
		block.ID = inp.BlockID		

		err = metadataDB.First(&block).Error
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		//open 
		pckDB, err := db.Create("pck")
		if err != nil {
			log.Fatal(err)
		}
		
		sql := "INSERT INTO " + *block.Name +".criteria(id,contents) VALUES(" +  strconv.Itoa(inpBody.Id) + `, '`+ inpBody.Contents +`')`

		if err := pckDB.Exec(sql).Error; err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}

		// Return the items as the API response
		ctx.JSON(http.StatusOK, gin.H{
			"message": "Add criteria successfully",
		})
	}
}

func HandleAddEvidence(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var inp getEvidenceInp
		var inpBody addEviInp

		err := ctx.ShouldBindUri(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		requestBody, err := ioutil.ReadAll(ctx.Request.Body)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		err = json.Unmarshal(requestBody, &inpBody)
		if err != nil {
			panic(err)
		}

		var block core.Block
		block.ID = inp.BlockID		

		err = metadataDB.First(&block).Error
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		//open 
		pckDB, err := db.Create("pck")
		if err != nil {
			log.Fatal(err)
		}
		
		sql := "INSERT INTO " + *block.Name +".evidences(crit_id,id,contents,title) VALUES(" + strconv.Itoa(inpBody.CritId)+ `, `+  strconv.Itoa(int(*inp.CritID)) + `, '`+ inpBody.Contents +`', '` + inpBody.Title+ `')`

		fmt.Println(sql)
		if err := pckDB.Exec(sql).Error; err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}

		// Return the items as the API response
		ctx.JSON(http.StatusOK, gin.H{
			"message": "Add criteria successfully",
		})
	}
}