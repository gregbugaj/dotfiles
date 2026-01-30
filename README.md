# dotfiles
This repository contains a collection of configuration files (dotfiles) to set up and customize your development environment. It includes configurations for various tools and applications such as Neovim, Tmux, Alacritty, Starship, and more. These dotfiles are designed to enhance productivity and streamline your workflow by providing a consistent and efficient setup across different systems.


## Features
- **Neovim Configuration**: Custom key mappings, plugins, and settings for an optimized coding experience.
- **Tmux Configuration**: Enhanced terminal multiplexing with custom key bindings and plugins.
- **Alacritty Configuration**: A fast, cross-platform terminal emulator with a customized appearance.
- **Starship Prompt**: A minimal, blazing-fast, and customizable prompt for any shell.
- **Git Configuration**: Aliases and settings to improve your Git workflow.
- **Bash and Zsh Configurations**: Custom aliases, environment variables, and functions for a more efficient shell experience.

## Getting Started

1. **Clone the Repository**: Clone this repository to your local machine.
    ```shell
    git clone https://github.com/gregbugaj/dotfiles.git
    cd dotfiles
    ```

2. **Make the Setup Script Executable**: Ensure the setup script has execute permissions.
    ```shell
    chmod +x setup.sh
    ```

3. **Run the Setup Script**: Execute the setup script to install and configure all necessary tools and applications.
    ```shell
    ./setup.sh
    ```

The setup script will automatically create symbolic links for the configuration files, install required packages, and set up your environment according to the configurations defined in this repository. 

Make sure to update the submodules and install the necessary dependencies as described.

## Table of Contents
- [Setup Starship](#setup-starship)
- [Setup ZSH](#setup-zsh)
- [Install Auto Suggestions](#install-zsh-auto-suggestions)
- [Install ZSH Syntax Highlighting](#install-zsh-syntax-highlighting)
- [Install Packages](#install-packages)
- [Install Fonts](#install-fonts)
- [References](#references)
 


## [Setup Starship](https://starship.rs/)

This is an optional package if you want to beautify your terminal. Else you can also use any other BASH/ZSH themes(modify `setup.sh` to disable check)

### Install starship

> You cannot install starship in ZSH shell at the time of writing this. You can switch to bash.

```bash
curl -sS https://starship.rs/install.sh | sh
```

## Setup ZSH

This will guide you through to setup zsh suggestions and zsh syntax highlight.


### Setup the config in ZSH file

```bash
echo "eval \"\$(starship init zsh)\"" >> ${ZSOTDIR:-$HOME}/.zshrc
```


## [Install ZSH Auto Suggestions](https://github.com/zsh-users/)

1. Clone the repository

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
```

> _You can change the path to anything you want. Here we use `~/.zsh/zsh-autosuggestions`_

2. Add the invoke script to ZSH config

```bash
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZSOTDIR:-$HOME}/.zshrc
```

## [Install ZSH Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/)

1. Clone the repository

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
```

2. Add the invoke script to ZSH config

```bash
echo "source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```

## Install packages

Update submodules

```shell
git submodule update --init --recursive
```

Neovim - N
```shell
sudo apt-get install neovim
```

Tmux - Terminal Multiplexer
```shell
sudo apt-get install tmux
```

JQ - JSON Processor
```shell
sudo apt-get install jq
```

FZF - Fuzzy Finder
```shell
sudo apt-get install fzf
```

Ripgrep - Rg
```shell
sudo apt-get install ripgrep
```

Bat - Cat clone with wings
```shell
sudo apt-get install bat
```

MC - Midnight Commander
```shell
sudo apt-get install mc
```

BTOP - Resource Monitor
```shell
sudo apt-get install btop
```

TLDR
```shell
sudo apt-get install tldr
```

EZA - LS replacement

```shell
sudo apt-get install exaeza
```

JC - JSON CLI Processor
```shell
sudo apt-get install jc
```

zoxide - Directory Jump
```shell
sudo apt-get install zoxide
```

lazygit - Git GUI 
```shell
LAZYGIT_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep '"tag_name"' | cut -d '"' -f 4)
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION#v}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

```

github cli
```shell
sudo apt-get install gh
```

Install extensions for copilot

* https://github.com/github/gh-copilot
* https://docs.github.com/en/copilot/managing-copilot/configure-personal-settings/configuring-github-copilot-in-the-cli#setting-up-aliases


## Install following fonts

Nerd Fonts - JetBrains Mono 


# References

- [Nerd Fonts](https://www.nerdfonts.com/)
- [Neovim](https://neovim.io/)
- [awesome-cli-apps ](https://github.com/agarrharr/awesome-cli-apps#tmux)