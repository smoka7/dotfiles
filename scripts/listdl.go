package main

import (
	"flag"
	"fmt"
	"log"
	"os"
	"os/exec"
	"strconv"
	"strings"
)

func download(url string) {
	fmt.Println(url)
	cmd := exec.Command("top")
	stdoutStderr, err := cmd.Output()
	if err != nil {
		log.Fatal(err)
	}
	fmt.Printf("%s\n", stdoutStderr)
}
func main() {
	url := os.Args[3]
	start := flag.Int("s", 0, "")
	end := flag.Int("e", 0, "")
	flag.Parse()
	if *start > *end {
		fmt.Println("Args not valid")
	} else {
		for i := *start; i <= *end; i++ {
			if i < 10 {
				durl := strings.Replace(url, "*", "0"+strconv.Itoa(i), 1)
				download(durl)
				continue
			}
			durl := strings.Replace(url, "*", strconv.Itoa(i), 1)
			//download function
			download(durl)
		}
	}
}
