# Project structure

Now that you have installed all the necessary tools we should have a look on the structure of the project!
This is how your freshly created project will look like:

```javascript
.
├── LICENSE // License of your project
├── README.md // Short description of your project
├── build.cmd // Build script for Windows
├── build.sh // Build script for Linux
├── docs // The documentation you are currently reading
└── src // Project content
    ├── 01_introduction.md
    ├── 02_conclusion.md
    ├── 90_appendix.md
    ├── bibliography.yaml // List of sources
    └── glossary.tex // Glossary entries
```

## Project information

The `README.md` and `LICENSE` files currently contain the information for the template. Replace these with a short description of your project (in case you publish your repository) and the license you'd like your project to be published with.

## Build system

Since this template supports multiple operating systems there are multiple `build.*` files, one for each operating system. Consult the [how to build the project](authoring/building.md) section on how to use these to generate a PDF file.

## Documentation

The `docs` directory contains the files of this documentation. It will be removed from the template download at a later date so consider this unimportant.

## Source files

All the important files rest in the `src` directory. This is where the magic happens. It contains all your [text files](authoring/markdown.md) (`*.md`), the [bibliography](authoring/bibliography.md) (`bibliography.yaml`) and [glossary entries](authoring/glossary.md) (`glossary.tex`). The first of the text files additionally contains your [project metadata](authoring/metadata.md).

You may add any additional files and directories containing images, referenced files and the like to this folder in any way you like. Note that when building all `.md` files in this directory are concatenated in lexicographical order and then parsed. This allows you to split your document into as many files as you like and is the reason we prefixed all the example files with numbers to preserve the correct order. Note though that currently `*.md` files in subfolders are being ignored (subject to change)!
