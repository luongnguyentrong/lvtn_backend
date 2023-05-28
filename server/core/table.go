package core

import "time"

type Table struct {
	ID          *uint   `json:"id"`
	Name        *string `json:"name"`
	Description *string `json:"description"`
	DisplayName *string `json:"display_name"`
	BlockID     *uint   `json:"block_id"`
	Block       Block   `gorm:"constraint:OnUpdate:CASCADE,OnDelete:CASCADE;"`
	CreatedAt   time.Time
	UpdatedAt   time.Time
}
