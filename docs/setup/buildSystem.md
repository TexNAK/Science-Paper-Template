# Build system setup

You write your paper in Markdown which is an easy, declarative language to author documents. More on that topic in the section [Authoring with Markdown](authoring/markdown). This safes you from all the hassle normally found when working with LaTeX. To produce the clean PDF output you are used to with LaTeX however you need to run a build (much like  you would with LaTeX). This can either be done by installing all the necessary tooling locally (complexity depends on your operating system) or setting up Docker, which encapsules all the tools in a simple container and prevents any human mistakes during setup of the build environment.

## Docker

1. Install Docker
2. If it complains about virtualization being disabled
  - Enable it by following [this guide's](https://outline.com/HHnuyt) section `How to enable Intel VT-x in UEFI?`
3. Open the project in your IDE
4. Press `Ctrl+Shift+B`

## Manual

The following components are required for the build system:

- pandoc
- pandoc-citeproc
- pandoc-crossref
- texlive

Consult your operating system specific instructions on how to install these components.

### macOS (brew)

To install the dependencies on macOS using brew, run the following commands:

```bash
brew install pandoc pandoc-citeproc pandoc-crossref
brew cask install mactex
```
