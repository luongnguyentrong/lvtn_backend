package core

import "time"

type Table struct {
	ID          uint
	Name        *string `json:"name"`
	BlockName   *string `json:"block_name"`
	DisplayName *string `json:"display_name"`
	Description *string `json:"description"`
	CreatedBy   *string `json:"created_by"`
	Block       Block
	CreatedAt   time.Time
	UpdatedAt   time.Time
}
