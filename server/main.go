package main

import (
	"errors"
	"log"

	"api.ducluong.monster/api"
	"github.com/joho/godotenv"
)

var errorUserNotFound = errors.New("user not found")



func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal(err)
	}

	api.Handlers().Run()
}
