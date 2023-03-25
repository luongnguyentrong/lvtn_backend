package core

type User struct {
	ID       string    `json:"sub"`
	Username string   `json:"username"`
	Active   bool     `json:"active"`
	Roles    []string `json:"roles"`
}
