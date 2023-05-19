package core

type Client struct {
	ClientID     *string `json:"client_id"`
	ClientSecret *string `json:"client_secret"`
	RealmID      *string `json:"realm_id"`
}
