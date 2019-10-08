# Contribute as a developer

In order to contribute to the project, you will need to fork the repository. When you have pushed your changes, you can create a
pull-request on [template](https://github.com/TexNAK/Science-Paper-Template).

## Project Structure for development

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
