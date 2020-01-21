# Project metadata

The first markdown (`.md`) file in your `src/` folder should contain a metadata section describing your project. The content of this section has effects on the visual style, content and metadata of the resulting PDF. Here is the default example:

```yaml
---
    TFLNummer: 1
    title: Optimierung der Build-Dauer eines Web Application Bundler durch Anpassung der Konfiguration und dessen Auswirkung auf den Entwicklungsprozess

    author: Max Mustermann
    Zenturie: A22f
    Studiengang: Angewandte Informatik
    Matrikelnummer: 1337

    keywords: [keyword1, keyword2]
---
```

There is a plethora of options that change the way the build system operates. A few are listed below.

## Template specific fields

### TFLNummer

This is the counter which TFL this is. Mainly affects the title page.

### Zenturie

Self-explanatory, affects the title page.

### Studiengang

Self-explanatory, affects the title page.

### Matrikelnummer

Self-explanatory, affects the title page.

### Deckblatt

Can be either `true` or `false` to enable or disable the title page. Defaults to `true`.

## Additional metadata fields

There are way more fields than mentioned here which allow you for example to enable/disable the table of contents, list of figures/tables, include additional LaTeX packages or insert code, change the way the PDF is generated and more. Most of them are documented in the [pandoc documentation](https://pandoc.org/MANUAL.html#variables).
