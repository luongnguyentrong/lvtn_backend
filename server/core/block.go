package core

import (
	"time"

	"github.com/lib/pq"
)

type Block struct {
	ID          *uint             `json:"id" gorm:"primaryKey"`
	Name        *string           `json:"name"`
	DisplayName *string           `json:"display_name"`
	Description *string           `json:"description"`
	CreatedBy   *string           `json:"created_by"`
	UnitName    *string           `json:"unit_name"`
	ManagerIDs  pq.StringArray    `json:"manager_ids" gorm:"type:text[]"`
	Managers    *[]map[string]any `json:"managers" gorm:"-"`
	CreatedAt   time.Time
	UpdatedAt   time.Time
}
