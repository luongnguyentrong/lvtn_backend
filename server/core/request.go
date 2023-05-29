package core

type Request struct {
	ID          *uint           `json:"id"`
	CreatedBy   *string         `json:"created_by" gorm:"NOT NULL"`
	Status      *string         `json:"status" gorm:"NOT NULL"`
	RequestType *string         `json:"request_type" gorm:"NOT NULL"`
	Body        interface{}     `json:"body" gorm:"serializer:json"`
	Creator     *map[string]any `json:"creator" gorm:"-"`
}
