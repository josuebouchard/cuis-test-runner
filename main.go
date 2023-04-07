package main

import (
	"fmt"
	"os"
	"os/exec"
	"path"
	"strings"
)

func main() {
	githubWorkspace := os.Getenv("GITHUB_WORKSPACE")
	if githubWorkspace == "" {
		fmt.Println("GITHUB_WORKSPACE not set")
		os.Exit(-2)
	}

	filepaths := os.Args[1]
	if filepaths == "" {
		fmt.Println("FILES not set")
		os.Exit(-2)
	}

	testClasses := os.Args[2]
	if testClasses == "" {
		fmt.Println("TEST_CLASSES not set")
		os.Exit(-2)
	}

	cuis_params := []string{
		"-vm-display-null", "-vm-sound-null",
		"/home/linux64/CuisUniversity-5706.image", "-e",
		"-d", "Utilities setAuthorName: 'algo3' initials: 'algo3'",
	}

	files := strings.Split(filepaths, ",")
	for _, v := range files {
		file := path.Join(githubWorkspace, v)
		cuis_params = append(cuis_params, "-l", file)

		stat, err := os.Stat(file)

		if os.IsNotExist(err) || stat.IsDir() {
			fmt.Println("No se ha podido encontrar el archivo en: ", file)
			os.Exit(-2)
		}
	}
	cuis_params = append(cuis_params, "-s", "/home/runTests.st")
	cuis_params = append(cuis_params, strings.Split(testClasses, ",")...)

	cmd := exec.Command(
		"/home/linux64/vm-jit/squeak",
		cuis_params...,
	)

	outputBytes, _ := cmd.Output()
	output := string(outputBytes)

	fmt.Println(output)

	if !strings.Contains(output, "0 failed, 0 errors") {
		os.Exit(-1)
	}
}
