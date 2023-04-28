package utils

import (
	"fmt"
	"os"
	"strings"
)

func GetUnit(host string) string {
	res := strings.Split(host, ".")

	fmt.Println("IN HERE GET_UNITS: ", os.Getenv("ENVIROMENT"))
	if os.Getenv("ENVIROMENT") == "development" {
		return "master"
	}

	if len(res) == 3 {
		return res[0]
	} else if len(res) == 2 {
		return "master"
	}

	return ""
}