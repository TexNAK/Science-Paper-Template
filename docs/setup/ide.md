# Setting up your workspace

In theory you can use any old text editor to write your next award winning science paper. However we strongly recommend using an editor that aids you in the process through Syntax Highlighting, Autocompletion, Shortcuts for building your project and various other tools. The IDE recommended by the original authors of the template is [VSCode](https://code.visualstudio.com). Configuration files for it are provided with the template<sup>1</sup>.

## Visual Studio Code

Below you can find a set of instructions for installing and setting up VSCode.

### Installation

#### Manual download

On all major platforms you can install VSCode by downloading the latest installer from the [Microsoft website](https://code.visualstudio.com) and executing it.

#### Package managers

Some platforms include a package manager which is the preferred way to install software. Below is a non-exhaustive list of platform commands.

##### macOS (brew)

If you have [brew](https://brew.sh) installed you can get VSCode by executing the following command in a Terminal:

```bash
brew cask install visual-studio-code
```

##### Linux (snap)

```bash
sudo snap install --classic code
```

For more information on how to install Visual Studio Code on your specific Linux distribution, check out [https://code.visualstudio.com/docs/setup/linux](https://code.visualstudio.com/docs/setup/linux).

### Extensions

The template includes a set of Editor Extensions that provide improved editing capabilities for the template. When you open the project the first time Visual Studio Code will show a notification in the bottom right that asks about installing recommended Extensions. It is recommended that you use this feature and install all.

### Keyboard shortcuts

In addition to the usual shortcuts additional keybindings have been implemented:

| Keybinding | Description               |
|------------|---------------------------|
| Ctrl + B   | Build the current project |

### Markdown Preview

You can get a preview of your current document side by side with your source code to quickly preview the layout. Note though that the preview does not represent the final visuals of the generated PDF but can be used for general layout concerns. Advanced features like Bibliography, inline LaTeX and References will currently not work in this preview mode.

To open the preview window press the icon in the top right of the editor that has two panes with a loupe on it.

<small>1</small> <sub>If you intend to use another editor with this template please consider contributing the configuration files so others can benefit from them in the future!</sub>
