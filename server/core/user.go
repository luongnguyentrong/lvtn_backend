package core
type User struct {
	ID       *string  `json:"sub"`
	Username *string  `json:"username"`
	Fname    *string  `json:"fname"`
	Lname    *string  `json:"lname"`
	Email    *string  `json:"email"`
	Active   bool     `json:"active"`
	Roles    []string `json:"roles"`
}
