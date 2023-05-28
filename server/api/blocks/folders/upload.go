package folders

import (
	"context"
	"fmt"
	"log"
	"net/http"
	"os"

	"api.ducluong.monster/core"
	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/credentials"
	"github.com/aws/aws-sdk-go-v2/feature/s3/manager"
	"github.com/aws/aws-sdk-go-v2/service/s3"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func HandleUploadFile(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		file, err := ctx.FormFile("upload")
		//fmt.Println(file.Open())
		var inp listInp
		err = ctx.ShouldBindUri(&inp)
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
		if err != nil {
			panic(err)
		}
		cfg, err := config.LoadDefaultConfig(context.TODO(),
			config.WithCredentialsProvider(credentials.NewStaticCredentialsProvider(os.Getenv("AWS_ACCESS_KEY_ID"), os.Getenv("AWS_SECRET_ACCESS_KEY"), "")),
		)
		if err != nil {
			log.Printf("error: %v", err)
			return
		}
		f, err := file.Open()
		if err != nil {
			log.Printf("error: %v", err)
			return
		}
		//fmt.Println("B: ",b)
		client := s3.NewFromConfig(cfg)
		uploader := manager.NewUploader(client)
		//fmt.Println(uploader,f)
		objectKey := *block.Name + "/" + *inp.FolderName + "/" + file.Filename
		fmt.Println("file name", f)
		result, err := uploader.Upload(context.TODO(), &s3.PutObjectInput{ 
			Bucket: aws.String("pckstorage"),
			Key:    aws.String(objectKey),
			Body:   f,
		})
		fmt.Println("Error: ",err)
		fmt.Println(result)
	}
}