package main

import (
	"fmt"
	"strings"
)


func main() {
	res := strings.Split("https://ducluong.monster", ".")

	fmt.Println(res)
}