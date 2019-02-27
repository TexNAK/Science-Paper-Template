#!/bin/sh

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

mkdir -p out
case $1 in
    build) build;;
    spellcheck) spellcheck;;
esac
