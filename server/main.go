package main

import (
	"log"

	"api.ducluong.monster/api"
	"github.com/joho/godotenv"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Println(err)
	}

	api.Handlers().Run()
}
