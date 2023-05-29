package utils

import (
	"context"
	"fmt"

	"api.ducluong.monster/core"
	"github.com/Nerzal/gocloak/v13"
	"gorm.io/gorm"
)

func CreateUnit(ctx context.Context, unit *core.Unit, client *gocloak.GoCloak, access_token *string, metadata *gorm.DB) error {
	// create database for unit
	result := metadata.Exec(fmt.Sprintf("CREATE DATABASE %s", *unit.Name))
	if result.Error != nil {
		return result.Error
	}

	if result.RowsAffected > 0 {
		return fmt.Errorf("database %s already exists", *unit.Name)
	}

	// Create a new realm in keycloak
	_, err := client.CreateRealm(ctx, *access_token, gocloak.RealmRepresentation{
		Realm:   unit.Name,
		Enabled: gocloak.BoolP(true),
	})

	if err != nil {
		return err
	}

	// Create realm roles for this new realm (unit_manager, unit_user)
	REALM_ROLES := []string{"unit_admin", "unit_normal", "unit_viewer"}

	for _, role := range REALM_ROLES {
		_, err = client.CreateRealmRole(ctx, *access_token, *unit.Name, gocloak.Role{
			Name: &role,
		})

		if err != nil {
			return err
		}

	}

	// Create console client for client authentication
	_, err = client.CreateClient(ctx, *access_token, *unit.Name, gocloak.Client{
		ClientID:     gocloak.StringP("console"),
		PublicClient: gocloak.BoolP(true),
		RedirectURIs: &[]string{
			"http://localhost:3000/*",
			fmt.Sprintf("https://%s.ducluong.monster/*", *unit.Name),
		},
		WebOrigins: &[]string{
			"http://localhost:3000",
			fmt.Sprintf("https://%s.ducluong.monster", *unit.Name),
		}})

	if err != nil {
		return err
	}

	// Create api_server client to perform sso on this unit
	_, err = client.CreateClient(ctx, *access_token, *unit.Name, gocloak.Client{
		ClientID:                  gocloak.StringP("api_server"),
		PublicClient:              gocloak.BoolP(false),
		StandardFlowEnabled:       gocloak.BoolP(true),
		DirectAccessGrantsEnabled: gocloak.BoolP(true),
		WebOrigins: &[]string{
			"http://localhost:5000",
			"https://api.ducluong.monster",
		}})

	if err != nil {
		return err
	}

	// Create superset client for superset service
	_, err = client.CreateClient(ctx, *access_token, *unit.Name, gocloak.Client{
		ClientID:                  gocloak.StringP("superset"),
		PublicClient:              gocloak.BoolP(false),
		StandardFlowEnabled:       gocloak.BoolP(true),
		DirectAccessGrantsEnabled: gocloak.BoolP(true),
		WebOrigins: &[]string{
			fmt.Sprintf("https://%s.superset.ducluong.monster", *unit.Name),
		}})

	if err != nil {
		return err
	}

	// Find client scope: role
	clientScopes, err := client.GetClientScopes(ctx, *access_token, *unit.Name)
	if err != nil {
		return err
	}

	for _, clientScope := range clientScopes {
		if *clientScope.Name == "roles" {
			for _, mapper := range *clientScope.ProtocolMappers {
				if *mapper.Name == "realm roles" {
					mapper.ProtocolMappersConfig.ClaimName = gocloak.StringP("roles")
					mapper.ProtocolMappersConfig.UserinfoTokenClaim = gocloak.StringP("true")

					err := client.UpdateClientScopeProtocolMapper(ctx, *access_token, *unit.Name, *clientScope.ID, mapper)

					if err != nil {
						return err
					}

					break
				}
			}
		}
	}

	return nil
}
