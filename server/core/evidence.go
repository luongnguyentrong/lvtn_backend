package core

type Evidence struct {
	ID       *uint    `json:"id" gorm:"primaryKey"`
	Title    *string  `json:"title"`
	Contents *string  `json:"contents"`
	CritID   *uint    `json:"crit_id" gorm:"primaryKey"`
	Criteria Criteria `json:"criteria" gorm:"foreignKey:CritID;references:ID"`
}