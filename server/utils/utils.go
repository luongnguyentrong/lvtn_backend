package utils

import (
	"os"
	"strings"
)

func GetUnit(host string) string {
	res := strings.Split(host, ".")

	if os.Getenv("GO_ENV") == "development" {
		return "master"
	}

	if len(res) == 3 {
		return res[0]
	} else if len(res) == 2 {
		return "master"
	}

	return ""
}