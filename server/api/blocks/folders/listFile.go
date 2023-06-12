package folders

import (
	"context"
	"fmt"
	"net/http"
	"os"
	"strconv"

	//"path/filepath"
	"strings"

	//"path/filepath"

	// "os"

	"api.ducluong.monster/core"
	"api.ducluong.monster/utils"
	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/credentials"
	"github.com/aws/aws-sdk-go-v2/service/s3"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)
type listInp struct {
	FolderName *string `uri:"folder_name"`
	BlockID *uint `uri:"block_id"`
	TableID *uint `uri:"table_id"`
}

func HandleListFile(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var inp listInp
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
		bucketName := fmt.Sprintf("%sstorage", utils.GetUnit(ctx.Request.Header.Get("Origin")))
		folderPath := *block.Name + "/"
		folderPath += *inp.FolderName + "/"
		fmt.Println(folderPath)
		params := &s3.ListObjectsV2Input{
			Bucket:    aws.String(bucketName),
			Prefix:    aws.String(folderPath),
			Delimiter: aws.String("/"), // Only list items directly inside the folder, excluding sub-folders
		}

		cfg, err := config.LoadDefaultConfig(context.TODO(),
			config.WithCredentialsProvider(credentials.NewStaticCredentialsProvider(os.Getenv("AWS_ACCESS_KEY_ID"), os.Getenv("AWS_SECRET_ACCESS_KEY"), "")),
		)
		if err != nil {
			fmt.Printf("error: %v", err)
			return
		}
		client := s3.NewFromConfig(cfg)
		// Call the ListObjectsV2 API
		resp, err := client.ListObjectsV2(context.TODO(), params)
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, gin.H{
				"error": err.Error(),
			})
			return
		}

		// Extract the item names and sizes from the response
		var items []gin.H
		for _, obj := range resp.Contents {
			item := gin.H{
				"name": strings.TrimPrefix(*obj.Key, folderPath),
				"size": strconv.FormatInt(obj.Size,10)+"B",
			}
			items = append(items, item)
		}


		items = items[1:]
		// Return the items as the API response
		ctx.JSON(http.StatusOK, gin.H{
			"items": items,
		})
	}
}