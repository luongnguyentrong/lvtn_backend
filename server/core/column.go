package core

type Column struct {
	ID          *uint   `json:"id"`
	Name        *string `json:"name"`
	DisplayName *string `json:"display_name"`
	IsPrimary   *bool   `json:"is_primary" gorm:"default:false"`
	ColumnType  *string `json:"column_type"`
	TableID     *uint   `json:"table_id"`
	Table       Table
}
