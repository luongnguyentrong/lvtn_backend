package core

type Column struct {
	ID          uint
	Name        *string `json:"name"`
	DisplayName *string `json:"display_name"`
	ColumnType  *string `json:"column_type"`
	TableID     *string `json:"table_id"`
	Table       Table
}
