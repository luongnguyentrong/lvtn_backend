package main

import (
	"log"
	"os"

	"api.ducluong.monster/api"
	"api.ducluong.monster/core"
	"github.com/Nerzal/gocloak/v13"
	"github.com/joho/godotenv"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

func init() {
	err := godotenv.Load()
	if err != nil {
		log.Println(err)
	}

	db, err := gorm.Open(postgres.Open(os.Getenv("POSTGRES_DSN") + "/metadata"))
	if err != nil {
		log.Fatal(err)
	}

	db.AutoMigrate(&core.Unit{})
	db.AutoMigrate(&core.Block{})
}

func createMasterUnit() {
	// Save unit org structure
	db, err := gorm.Open(postgres.Open(os.Getenv("POSTGRES_DSN") + "/metadata"))

	if err != nil {
		log.Fatal(err)
		return
	}

	err = db.AutoMigrate(&core.Unit{})
	if err != nil {
		log.Fatal(err)
		return
	}

	result := db.Create(&core.Unit{
		RealmID:     gocloak.StringP("26066533-0192-41d5-a160-14f7d44d380e"),
		CreatedBy:   gocloak.StringP("61876c40-49a5-4049-869c-e3c69e72144c"),
		Name:        gocloak.StringP("master"),
		DisplayName: gocloak.StringP("Đại học Bách Khoa"),
		Description: gocloak.StringP("Root unit"),
		URL:         gocloak.StringP("ducluong.monster"),
	})

	if result.Error != nil {
		log.Fatal(result.Error)
	}
}

func main() {
	// createMasterUnit()

	api.Handlers().Run()
}
