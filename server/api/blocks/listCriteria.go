package blocks

import (
	"log"
	"net/http"
	"strconv"

	"api.ducluong.monster/core"
	"api.ducluong.monster/shared/db"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type getEvidenceInp struct {
	BlockID *uint `uri:"block_id"`
	CritID *uint64 `uri:"crit_id"`
}

func HandleListEvidence(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var inp getEvidenceInp
		err := ctx.ShouldBindUri(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
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
		

		var evidences []map[string]interface{}
		err = pckDB.Raw("SELECT id,contents,title FROM " + *block.Name + ".evidences WHERE crit_id = " + strconv.FormatUint(*inp.CritID,10)+ " ORDER BY id").Scan(&evidences).Error
		if err != nil {
			log.Fatal(err)
		}

		// Return the items as the API response
		ctx.JSON(http.StatusOK, gin.H{
			"body": evidences,
		})

	}
}

func HandleListCriteria(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var inp getInp
		err := ctx.ShouldBindUri(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
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
		

		var crits []map[string]interface{}
		err = pckDB.Raw("SELECT * FROM " + *block.Name + ".criteria").Scan(&crits).Error
		if err != nil {
			log.Fatal(err)
		}

		
		// Return the items as the API response
		ctx.JSON(http.StatusOK, gin.H{
			"body": crits,
		})

	}
}