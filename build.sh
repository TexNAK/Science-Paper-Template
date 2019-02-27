#!/bin/sh
watch() {
    fswatch src | xargs -L 1 ./build.sh build
}

build() {
    pandoc src/main.md  \
        --number-sections \
        -F pandoc-crossref \
        -F pandoc-citeproc \
        --bibliography=src/bibliography.yaml \
        --csl tex/ieee.csl \
        -o out/main.pdf
}

spellcheck() {
    pandoc src/main.md \
        -F pandoc-crossref \
        -F pandoc-citeproc \
        --bibliography=src/bibliography.yaml \
        --csl tex/ieee.csl \
        -t plain \
        -o out/main.txt
}

help() {
    cat << EOF
Markdown typesetting tool.

    usage:
        build.sh [--docker][--help] command

    parameters:
        --docker        run inside docker container.
        --help          print this.

    commands:
        build           typeset src/main.md -> out/main.pdf
        spellcheck      typeset src/main.md -> out/main.txt
        watch           watch src and execute build on file change.

    examples:
        build.sh watch
        build.sh --docker build

    Report bugs to: https://github.com/TexNAK/TFL-Template/issues
EOF
}

mkdir -p out
case $1 in
    --help) help;;
    --docker) BUILD_PARAMETERS="${@:2}" docker-compose -p latex_build -f .docker/docker-compose.yml up;;
    build) build;;
    watch) watch;;
    spellcheck) spellcheck;;
esac
