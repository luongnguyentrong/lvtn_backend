package core

import "time"

type BlockAccess struct {
	UserID    *string   `json:"user_id" gorm:"primaryKey"`
	BlockIDs  *[]string `json:"managers" gorm:"serializer:json"`
	CreatedAt time.Time
	UpdatedAt time.Time
}
