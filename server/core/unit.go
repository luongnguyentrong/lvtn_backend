package core

import "context"

type Unit struct {
	RealmID     string  `json:"realm_id"`
	OwnerID     string  `json:"owner_id"`
	Name        string  `json:"name" gorm:"primaryKey;not null;unique"`
	DisplayName string  `json:"display_name" gorm:"not null"`
	Description string  `json:"description"`
	URL         string  `json:"url"`
	ParentName  *string `json:"parent_name"`
	Children    []Unit  `json:"children" gorm:"foreignkey:ParentName;references:Name;constraint:OnUpdate:CASCADE,OnDelete:SET NULL;"`
}

type UnitStore interface {
	Create(ctx context.Context, parentID string, org *Unit) error
}
