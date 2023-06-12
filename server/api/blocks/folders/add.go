package folders

import (
	"context"
	"fmt"
	"net/http"
	"os"

	"api.ducluong.monster/core"
	"api.ducluong.monster/utils"
	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/credentials"
	"github.com/aws/aws-sdk-go-v2/service/s3"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type AddInp struct {
	NewFolderName *string `uri:"new_folder_name"`
	BlockID       *uint   `uri:"block_id"`
}

func HandleAdd(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var inp AddInp

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

		bucketName := fmt.Sprintf("%sstorage", utils.GetUnit(ctx.Request.Header.Get("Origin")))

		folderPath := *block.Name + "/"
		folderPath += *inp.NewFolderName + "/"

		params := &s3.PutObjectInput{
			Bucket: aws.String(bucketName),
			Key:    aws.String(folderPath),
		}

		cfg, err := config.LoadDefaultConfig(context.TODO(),
			config.WithCredentialsProvider(credentials.NewStaticCredentialsProvider(os.Getenv("AWS_ACCESS_KEY_ID"), os.Getenv("AWS_SECRET_ACCESS_KEY"), "")),
		)
		if err != nil {
			fmt.Printf("error: %v", err)
			return
		}
		client := s3.NewFromConfig(cfg)

		// Call the API
		_, err = client.PutObject(context.TODO(), params)
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, gin.H{
				"error": err.Error(),
			})
			return
		}

		// Return the items as the API response
		ctx.JSON(http.StatusOK, gin.H{
			"message": "Folder created successfully",
		})
	}
}
