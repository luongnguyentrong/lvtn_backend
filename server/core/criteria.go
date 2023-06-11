package core

type Criteria struct {
	ID        *uint      `json:"id"`
	Contents  *string    `json:"contents"`
	Evidences []Evidence `json:"evidences" gorm:"foreignKey:CritID;references:ID"`
}
