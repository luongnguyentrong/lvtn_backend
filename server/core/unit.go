package core

type Unit struct {
	RealmID        *string                 `json:"id"`
	ManagerID      *string                 `json:"manager_id"`
	DisplayName    *string                 `json:"display_name" gorm:"not null"`
	Name           *string                 `json:"name" uri:"name" gorm:"primaryKey;not null;unique"`
	Description    *string                 `json:"description"`
	URL            *string                 `json:"url"`
	ParentName     *string                 `json:"parent_name"`
	SupersetStatus *string                 `json:"superset_status" gorm:"\"proccessing\""`
	Children       []Unit                  `json:"children" gorm:"foreignkey:ParentName;references:Name;constraint:OnUpdate:CASCADE,OnDelete:SET NULL;"`
	Manager        *map[string]interface{} `json:"manager" gorm:"-"`
}
