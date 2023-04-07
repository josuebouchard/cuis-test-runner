# Smalltalk test runner

This is a project intended to run automatically tests using a headless version of CUIS University Smalltalk.

## Example to test it

Building the image:

`docker build . --tag smalltalk`

Running the image:

`docker run -it -v "./classes:/home/classes" -e 'GITHUB_WORKSPACE=/home/classes' smalltalk "./MyClasses.st,./MyTestClass.st" "ExampleTest"`