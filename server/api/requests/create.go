package requests

import (
	"net/http"

	"api.ducluong.monster/core"
	"github.com/Nerzal/gocloak/v13"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type manager struct {
	FirstName *string `json:"fname" binding:"required"`
	LastName  *string `json:"lname" binding:"required"`
	Email     *string `json:"email" binding:"required"`
	Username  *string `json:"username" binding:"required"`
	Password  *string `json:"password" binding:"required"`
}

type createInput struct {
	DisplayName *string  `json:"display_name" binding:"required"`
	Name        *string  `json:"name" binding:"required"`
	Description *string  `json:"description"`
	ParentUnit  *string  `json:"parent_unit" binding:"required"`
	Manager     *manager `json:"manager" binding:"required"`
}

func HandleCreate(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		var inp createInput

		// decode request body
		err := ctx.Bind(&inp)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		// get requesting user
		raw, exists := ctx.Get("user")
		user := raw.(core.User)

		if !exists {
			ctx.AbortWithStatus(http.StatusInternalServerError)
			return
		}

		new_request := core.Request{
			CreatedBy:   user.ID,
			Status:      gocloak.StringP("init"),
			RequestType: gocloak.StringP("new_unit"),
			Body:        inp,
		}

		// save request data to metadata
		err = metadataDB.Create(&new_request).Error
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		ctx.AbortWithStatus(http.StatusCreated)
	}
}
