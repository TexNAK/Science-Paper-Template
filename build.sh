#!/usr/bin/env bash
OUTPUT_FOLDER="out"
OUTPUT_FILE="${OUTPUT_FOLDER}/main"

# Flags for pandoc
PANDOC_INPUT="src/*.md"
FLAGS_PANDOC=$(cat .build/FlagsGeneral.txt)
FLAGS_PDF="${FLAGS_PANDOC} $(cat .build/FlagsPDF.txt)"
FLAGS_EPUB="${FLAGS_PANDOC} $(cat .build/FlagsEPUB.txt)"
FLAGS_HTML="${FLAGS_PANDOC} $(cat .build/FlagsHTML.txt)"
FLAGS_PLAINTEXT="${FLAGS_PANDOC} $(cat .build/FlagsPlaintext.txt)"

build() {
    PREFIX=""
    if [ "$2" = true ]; then
        PREFIX="$(date "+[%H:%M:%S]") "
    fi

    MESSAGE="${PREFIX}Building for target '${TARGET}' ..."

    echo ${MESSAGE}

    mkdir -p ${OUTPUT_FOLDER}

    case $1 in
        pdf)
            pandoc ${PANDOC_INPUT} ${FLAGS_PDF} -o "${OUTPUT_FILE}.pdf"
            ;;
        plaintext)
            pandoc ${PANDOC_INPUT} ${FLAGS_PLAINTEXT} -o "${OUTPUT_FILE}.txt"
            ;;
        html)
            pandoc ${PANDOC_INPUT} ${FLAGS_HTML} -o "${OUTPUT_FILE}.html"
            ;;
        epub)
            pandoc ${PANDOC_INPUT} ${FLAGS_EPUB} -t epub -o "${OUTPUT_FILE}.epub"
            ;;
        *)
            echo -e "\r\033[1A\033[0KInvalid target: '${TARGET}'"
            return -1
            ;;
    esac

    local status=$?

    if [ $status -ne 0 ]; then
        echo -e "\n${MESSAGE} \033[31merror\033[0m" >&2
    else
        echo -e "\r\033[1A\033[0K${MESSAGE} \033[32mdone\033[0m"
    fi

    return $status
}

help() {
    cat << EOF
Markdown typesetting tool.

    usage:
        build.sh [--target type][--docker][--help]

    parameters:
        --target        Determines the output file type. One of: pdf, html, plaintext, epub
        --docker        Run inside docker container. Ignored if already inside a container.
        --help          Print this help.

    examples:
        build.sh watch
        build.sh --docker build

    Report bugs to: https://github.com/TexNAK/TFL-Template/issues
EOF
}

PARAMETERS="$@"

DOCKER=false
TARGET=pdf
WATCH=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -t|--target)
            TARGET="$2"
            shift
            shift
            ;;
        -d|--docker)
            DOCKER=true
            shift
            ;;
        -w|--watch)
            WATCH=true
            shift
            ;;
        -h|--help)
            help
            exit
            ;;
        *)
            # unknown option
            shift
            ;;
    esac
done

# When asked to run in docker and we are not already then move into the matrix.
if [ ! -f /.dockerenv ] && [ "$DOCKER" = true ]; then
    BUILD_PARAMETERS="${PARAMETERS}" docker-compose -p latex_build -f .docker/docker-compose.yml up
    exit
fi

if [ "$WATCH" = true ]; then
    fswatch src | while read -r changed_path; do build $TARGET true; done
else
    build $TARGET
fi
