package core

type Reference struct {
	ID            *uint   `json:"id"  gorm:"not null;"`
	TableName     *string `json:"table_name" gorm:"foreignKey:CompanyRefer"`
	ColumnName    *string `json:"column_name"`
	RefTableName  *string `json:"ref_table_name" gorm:"not null;"`
	RefColumnName *string `json:"ref_column_name"`
	ContraintName *string `json:"constraint_name" gorm:"not null;"`
	BlockID       *uint   `json:"block_id"`
	Block         Block
}
