package folders

import (
	"fmt"
	"net/http"

	"api.ducluong.monster/core"
	"api.ducluong.monster/utils"
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/service/s3"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type getInp struct {
	BlockID *uint `uri:"block_id"`
	TableID *uint `uri:"table_id"`
}

func HandleList(metadataDB *gorm.DB, svc *s3.S3) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		// get uri params
		var inp getInp
		err := ctx.ShouldBindUri(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// get block info
		var block core.Block
		block.ID = inp.BlockID

		err = metadataDB.First(&block).Error
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		// list folders from s3
		resp, err := svc.ListObjectsV2(&s3.ListObjectsV2Input{
			Bucket:    aws.String(fmt.Sprintf("%sstorage", utils.GetUnit(ctx.Request.Header.Get("Origin")))),
			Prefix:    aws.String(*block.Name + "/"),
			Delimiter: aws.String("/"),
		})

		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		ctx.JSON(http.StatusOK, gin.H{
			"folders": resp.CommonPrefixes,
		})
	}
}
