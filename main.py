import os
import sys
from pathlib import Path
import subprocess

def parse_tests_output(tests_output):
    parsed_output = {}
    for part in tests_output.split(","):
        elements = part.split(" ")[::-1]
        elements[1] = int(elements[1])

        parsed_output[elements[0]] = elements[1]
    return parsed_output

def main():
    workspace = Path(os.environ.get("GITHUB_WORKSPACE", ""))

    if len(sys.argv) < 2 + 1:
        print("Not enough arguments")
        exit(2)

    filepaths = sys.argv[1]
    test_classes = sys.argv[2]

    cuis_params = [
        "/home/linux64/vm-jit/squeak",
        "-vm-display-null", "-vm-sound-null",
        "/home/linux64/CuisUniversity-5706.image", "-e",
        "-d", "Utilities setAuthorName: 'algo3' initials: 'algo3'",
        "-l", "/home/InternalTools.st",
        "-s", "/home/loadFiles.st",
    ]

    for filepath in filepaths.split(","):
        filepath = Path(filepath)
        file = workspace / filepath

        if not file.is_file():
            print("No se pudo encontrar el archivo", str(file))
            exit(2)

        cuis_params.append(str(file.absolute()))

    cuis_params.extend(["-s", "/home/runTests.st"])
    cuis_params.extend(test_classes.split(","))

    # Timeout in seconds
    try:
        cmd = subprocess.run(cuis_params, capture_output=True, timeout=10)
    except subprocess.TimeoutExpired:
        print("""Ha ocurrido un error. Esto no significa necesariamente que tu codigo este mal.
        Puede ser que se haya renombrado la clase de Tests o algun archivo. Por favor, avisale al equipo docente.""")
        exit(3)
    else:
        output = cmd.stdout.decode("utf-8").strip()

        print(output)

        # if parsed_output['failed'] > 0 or parsed_output['errors'] > 0:
        #     print("There are failed or errored tests")
        #     exit(1)

if __name__ == "__main__":
    main()