package criteria

import (
	"fmt"
	"net/http"
	"strings"

	"api.ducluong.monster/core"
	"api.ducluong.monster/shared/db"
	"api.ducluong.monster/utils"
	md "github.com/JohannesKaufmann/html-to-markdown"
	"github.com/gin-gonic/gin"
	"github.com/johnfercher/maroto/pkg/color"
	"github.com/johnfercher/maroto/pkg/consts"
	"github.com/johnfercher/maroto/pkg/pdf"
	"github.com/johnfercher/maroto/pkg/props"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
)

func init_maroto(unit core.Unit, block core.Block) pdf.Maroto {
	m := pdf.NewMaroto(consts.Portrait, consts.A4)

	m.AddUTF8Font("Montserrat", consts.Normal, "Montserrat/static/Montserrat-Regular.ttf")
	m.AddUTF8Font("Montserrat", consts.Italic, "Montserrat/static/Montserrat-Italic.ttf")
	m.AddUTF8Font("Montserrat", consts.Bold, "Montserrat/static/Montserrat-Bold.ttf")
	m.AddUTF8Font("Montserrat", consts.BoldItalic, "Montserrat/static/Montserrat-BoldItalic.ttf")

	m.SetDefaultFontFamily("Montserrat")

	blue := color.Color{
		Red:   10,
		Green: 10,
		Blue:  150,
	}

	m.RegisterHeader(func() {
		m.Row(15, func() {
			m.Col(2, func() {
				_ = m.FileImage("logo.png", props.Rect{
					Center:  true,
					Percent: 80,
				})
			})

			m.Col(10, func() {
				m.Text("Trường Đại Học Bách Khoa Tp.Hồ Chí Minh", props.Text{
					Size:  12,
					Top:   3,
					Color: blue,
					Align: consts.Left,
				})
				m.Text(*unit.DisplayName, props.Text{
					Size:  12,
					Top:   8,
					Color: blue,
					Align: consts.Left,
				})
			})
		})
	})

	m.Line(1.0,
		props.Line{
			Color: color.Color{
				Red:   255,
				Blue:  0,
				Green: 0,
			},
		})

	m.Row(20, func() {
		m.Col(12, func() {
			m.Text(strings.ToUpper(*block.DisplayName), props.Text{
				Top:   10,
				Style: consts.Bold,
				Align: consts.Center,
				Size:  20,
			})
		})
	})
	m.Row(10, func() {
		m.Col(12, func() {
			m.Text("Tiêu chí", props.Text{
				Size:  17,
				Style: consts.BoldItalic,
				Align: consts.Center,
			})
		})
	})

	return m
}

type uriData struct {
	BlockID *uint `uri:"block_id"`
}

func HandleExport(metadataDB *gorm.DB) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		// get uri params
		var uri uriData

		err := ctx.ShouldBindUri(&uri)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"message": err.Error()})
			return
		}

		cur_unit := utils.GetUnit(ctx.Request.Header.Get("Origin"))

		// get unit info
		var unit core.Unit
		unit.Name = &cur_unit
		err = metadataDB.First(&unit).Error
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err})
			return
		}

		// get block info
		var block core.Block
		block.ID = uri.BlockID

		results := metadataDB.First(&block)
		if results.Error != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": results.Error})
			return
		}

		// open database connection to unit's database
		db, err := db.Create(cur_unit)
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		// mirgrate criteria and evidences table
		db.AutoMigrate(&core.Criteria{})
		db.AutoMigrate(&core.Evidence{})

		db.Logger.LogMode(logger.Info)

		// get criteria of block
		var criterias []core.Criteria
		err = db.Table(fmt.Sprintf("%s.criteria", *block.Name)).Find(&criterias).Error
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		for i, criteria := range criterias {
			err = db.Table(fmt.Sprintf("%s.evidences", *block.Name)).
				Where("crit_id = ?", criteria.ID).
				Find(&criterias[i].Evidences).
				Error

			if err != nil {
				ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
				return
			}
		}

		// create a pdf instance
		pdf := init_maroto(unit, block)

		// init a html to markdown converter
		converter := md.NewConverter("", true, nil)

		// insert criteria to pdf instance
		for _, crit := range criterias {
			pdf.Row(20, func() {
				pdf.Col(12, func() {
					pdf.Text(fmt.Sprintf("Tiêu chí %d. %s:", *crit.ID, *crit.Contents), props.Text{
						Top:   8,
						Size:  12,
						Style: consts.Bold,
						Align: consts.Left,
					})
				})
			})

			for _, evidence := range crit.Evidences {
				// convert evidence's contents to markdown
				markdown, err := converter.ConvertString(*evidence.Contents)
				if err != nil {
					ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
					return
				}

				pdf.Row(40, func() {
					pdf.Col(11, func() {
						pdf.Text(fmt.Sprintf("Dẫn chứng %d", *evidence.ID), props.Text{
							Size:            12,
							Align:           consts.Left,
							Style:           consts.BoldItalic,
							VerticalPadding: 1.3,
						})

						pdf.Text(strings.ReplaceAll(markdown, "\n", ""), props.Text{
							Top:             12,
							Size:            12,
							Align:           consts.Left,
							Extrapolate:     true,
							VerticalPadding: 1.3,
						})
					})
				})
			}
		}

		// output to bytes array
		buffer, err := pdf.Output()
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		// close database connection
		connection, err := db.DB()
		if err != nil {
			ctx.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}

		connection.Close()

		// return response
		ctx.Data(http.StatusOK, "application/pdf", buffer.Bytes())
	}
}
