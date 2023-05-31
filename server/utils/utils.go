package utils

import (
	"os"
	"strings"
)

func GetUnit(host string) string {
	if os.Getenv("ENVIROMENT") == "development" {
		return "pck"
	}

	unitName := strings.TrimPrefix(host, "https://")

	res := strings.Split(unitName, ".")
	if len(res) == 3 {
		return res[0]
	} else if len(res) <= 2 {
		return "master"
	}

	return ""
}