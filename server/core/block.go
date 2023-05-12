package core

import (
	"time"
)

type Block struct {
	Name        *string `json:"name" gorm:"primaryKey"`
	Realm       *string `json:"realm"`
	DisplayName *string `json:"display_name"`
	Description *string `json:"description"`
	CreatedBy   *string `json:"created_by"`
	CreatedAt   time.Time
	UpdatedAt   time.Time
}
