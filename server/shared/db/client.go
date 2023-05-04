package db

import (
	"os"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

func Create(database string) (*gorm.DB, error) {
	db, err := gorm.Open(postgres.Open(os.Getenv("POSTGRES_DSN") + "/" + database))
	if err != nil {
		return nil, err
	}

	sqlClient, err := db.DB()
	if err != nil {
		return nil, err
	}

	sqlClient.SetMaxIdleConns(10)
	sqlClient.SetMaxOpenConns(10)

	return db, nil
}
