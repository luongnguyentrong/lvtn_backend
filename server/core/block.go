package core

import (
	"time"
)

type Block struct {
	ID          *uint   `json:"id" gorm:"primaryKey"`
	Name        *string `json:"name"`
	DisplayName *string `json:"display_name"`
	Description *string `json:"description"`
	CreatedBy   *string `json:"created_by"`
	UnitName    *string `json:"unit_name"`
	ManagerID   *string `json:"manager_id"`
	CreatedAt   time.Time
	UpdatedAt   time.Time
}
