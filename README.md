# How to write scientific papers - the simple way

## Getting started

### Obtaining a copy of the project

First of all you need to obtain a copy of the template. You can either do this by **clicking the Fork button** on the top right, which creates a copy of this project in your GitHub account, or **press the big green download button** on the right, which we highly discourage since it makes merging of changes into the original template rather impossible.

### Making it your own

Now you may start editing the placeholders at the top of the `src/01_introduction.md` file to include your own personal details. You can then start writing your paper.

### IDE Setup

#### Visual Studio Code

The recommended IDE is VSCode (although any other Markdown editor works as well). To use it you may install the two plugins `Markdown+Math` and `markdownlint` (consult the VSCode documentation on how to do so). The built in shortcut for building (`Ctrl+Shift+B` by default) is supported.

### Continous integration

To automatically typeset your document whenever you push changes on the `master` branch you can use CI. For it to be able to create GitHub releases you have to:

1. Enter your [API token](https://docs.travis-ci.com/user/deployment/releases/#authenticating-with-an-oauth-token) in the `travis.yml` file and update the `deploy.on.repo` key to your repository.
1. Enable CI on your repository at [TravisCI](https://travis-ci.org)

## Writing a document

TODO Explain the following:

- Common metadata attributes
- Citation
- References (sections, images, ...)
- Inline LaTeX and importing packages

## Build

### Prerequisite

The build can be executed in one of two environments. Native or within [Docker](https://www.docker.com/products/docker-desktop). The latter abstracts all the hassles of installing LaTeX away and is the recommended way to typeset the document.

#### Docker

Install [Docker](https://www.docker.com/products/docker-desktop) and use the commands described in the next section.

#### Native

On Linux and macOS it is possible to run the build bare-bones without using Docker. To do so you have to install the following tools:

- pandoc
- pandoc-citeproc
- pandoc-crossref
- texlive _(everything out of you need from it)_

You can then omit the `--docker` flag on the commandline.

### Running the build

#### Windows

Double click the `build.cmd` file in the project directory. It opens a window with the log output from the typesetter. It will stay open after the build finished. You can close it by pressing _any key_.

_NOTE: Windows builds are untested and the build script for Windows needs some love. Feel free to contribute._

#### macOS & Linux

Open a terminal and run the following command in the project directory:

```bash
./build.sh --docker
```

You can watch the source files for changes and automatically rebuild by appending the `--watch` flag. For more details on this and typesetting to different formats (e.g. HTML for publishing online or plaintext for running it through [languagetool.org](https://languagetool.org/)) append the `--help` flag.

## Project structure

### Document

Source files that get included in the final document are contained in the `src/` directory. Prior to building all Markdown files get concatenated in alphabetical order. By using a numerical prefix (as shown below) you can determine the order of your content in the final document.

Literature sources are listed in `bibliography.yaml` and can be referenced as described in the second section. Glossary entries are defined in `glossary.tex` and their use is described in the FAQ.

```bash
src
├── 01_introduction.md
├── 02_conclusion.md
├── 90_appendix.md
├── bibliography.yaml
└── glossary.tex
```

### Template

Everything template related is placed in hidden subfolders excluding the build scripts. Generally there should be no need to touch these files. In case you do, please consider creating a pull request on the [template](https://github.com/TexNAK/Science-Paper-Template) if the changes could potentially be of use for others.

```javascript
.
├── README.md
├── build.cmd   // Windows build script
├── build.sh    // Linux/macOS build script
├── .gitignore  // Files excluded from version control
├── .travis.yml // Continous integration config
├── .vscode     // Visual Studio Code configuration
│   └── tasks.json
├── .build      // Flags for running pandoc (by output type)
│   ├── FlagsEPUB.txt
│   ├── FlagsGeneral.txt
│   ├── FlagsHTML.txt
│   ├── FlagsPDF.txt
│   └── FlagsPlaintext.txt
├── .template         // Document template
│   ├── ieee.csl      // Citation style
│   ├── logo.png      // Nordakademie branding
│   ├── metadata.yml  // Default metadata
│   ├── pandoc        // Pandoc filters
│   │   ├── date.lua  // Current date generator
│   │   └── gls.lua   // Glossary shortcuts
│   ├── tex           // LaTeX template
│   │   ├── layout.tex    // General layout (e.g. linespace)
│   │   ├── packages.tex  // Packages used in the template
│   │   ├── theme.tex     // Theme variables
│   │   └── template.tex  // Template code
│   └── html          // HTML template and styles
│       ├── layout.css
│       └── template.phtml
└── .docker
    ├── Dockerfile          // Docker image
    └── docker-compose.yml  // Container instantiation config
```

## FAQ

### Q: What citation style is being used?

This template is utilizing the IEEE citation style, which, according to some individuals, is permitted for most papers.

### Q: How can I remove the title page?

If you are not a fan of our custom designed, anonymized title page you can remove it by including `Deckblatt: false` in the metadata section of your first source file.

### Q: Where is the list of tables/figures?

You can enable them by adding `lot: true` and `lof: true` respectively in the metadata section.

### Q: What about glossary entries?

Glossary entries are defined in `src/glossary.tex` and you can use them [according to this documentation](https://github.com/tomncooper/pandoc-gls/blob/ed659c7b50baab9ce7c8eab15285fe9602f914f7/ReadMe.md#pandoc-gls)

## Feedback

In case of any issues with the template or feature requests do not hesitate to create an entry on the [issue tracker of the template](https://github.com/TexNAK/Science-Paper-Template/issues).

TODO explain the following:

- Template change pull
- Push template changes

## References

For typesetting documents [Pandoc](https://pandoc.org) is used. A complete reference for Markdown can be found [here](https://rmarkdown.rstudio.com/authoring_pandoc_markdown.html%23raw-tex).
