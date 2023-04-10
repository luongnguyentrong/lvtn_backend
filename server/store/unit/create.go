package unit

import (
	"context"
	"os"

	"api.ducluong.monster/core"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

type unitStore struct {
}

// New returns a new RepositoryStore.
func New() core.UnitStore {
	return &unitStore{}
}

func (s *unitStore) Create(ctx context.Context, parentID string, unit *core.Unit) error {
	// gorm.Open(postgres.Open(os.Getenv("POSTGRES_DSN")))
}