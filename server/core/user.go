package core

type User struct {
	ID       int64    `json:"sub"`
	Username string   `json:"username"`
	Active   bool     `json:"active"`
	Roles    []string `json:"roles"`
}
