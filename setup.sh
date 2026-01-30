#!/usr/bin/env bash

# set -o errexit, exit when a command fails
# add || true to commands that you allow to fail
set -e

# set -o nounset, exit when script tries to use undeclared variables
set -u

# exit status of the last command that threw a non-zero exit code is returned
set -o pipefail

# set -o xtrace, trace what gets executed
[[ "${TRACE:-}" ]] && set -x

main () {
  dir=$(pwd)

  # Ensure curl is installed
  if ! command -v curl &> /dev/null; then
    echo "curl is not installed."
    read -p "Do you want to install curl using apt-get? (y/n): " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
      echo "Installing curl..."
      sudo apt-get update
      sudo apt-get install -y curl
    else
      echo "curl is required to install nvm. Exiting."
      exit 1
    fi
  fi


  # Setup and check for nvm
  export NVM_DIR="$HOME/.nvm"

  # Source nvm if it exists
  if [ -s "$NVM_DIR/nvm.sh" ]; then
    echo "NVM_DIR exists, sourcing nvm..."
    source "$NVM_DIR/nvm.sh"
  fi

  # Check if nvm is available
  if ! command -v nvm &> /dev/null; then
    echo "nvm not found."
    read -p "Do you want to install nvm from the official source? (y/n): " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
      echo "Installing nvm..."
      curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

      # Source again to make it available in the current shell
      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

      # Confirm installation
      if command -v nvm &> /dev/null; then
        echo "nvm successfully installed. Version: $(nvm --version)"
      else
        echo "nvm installation failed. Please check your setup."
        exit 1
      fi
    else
      echo "nvm is required. Exiting."
      exit 1
    fi
  else
    echo "nvm is already installed. Version: $(nvm --version)"
  fi


  # git
  ln -fs $dir/git/gitconfig ~/.gitconfig

  # tmux

  ln -fs $dir/tmux/tmux.conf ~/.tmux.conf

  # check if tmux is installed
  if ! command -v tmux &> /dev/null; then
    echo "tmux not found."
    read -p "Do you want to install tmux using apt-get? (y/n): " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
      echo "Installing tmux..."
      sudo apt-get update
      sudo apt-get install -y tmux
    else
      echo "tmux is required. Exiting."
      exit 1
    fi
  fi

  # check if tmux tpm is installed
  if [ ! -d ~/.tmux/plugins/tpm ]; then
    echo "tpm not found, installing it"
    mkdir -p ~/.tmux/plugins
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi
    


  # neovim
  ln -fs $dir/nvim-config ~/.config/nvim

  # check if neovim is installed
  if ! command -v nvim &> /dev/null; then
    echo "Neovim (nvim) not found."
    read -p "Do you want to install Neovim using apt-get? (y/n): " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
      echo "Installing Neovim..."
      sudo apt-get update
      sudo apt-get install -y neovim
    else
      echo "Neovim is required. Exiting."
      exit 1
    fi
  fi


  # ensure that luarocks is installed
  if ! command -v luarocks &> /dev/null; then
    echo "luarocks not found."
    read -p "Do you want to install luarocks? (y/n): " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
      # Example installation steps for luarocks (adjust based on system)
      echo "Installing luarocks..."
      if command -v apt-get &> /dev/null; then
        sudo apt-get update
        sudo apt-get install -y luarocks
      elif command -v brew &> /dev/null; then
        brew install luarocks
      else
        echo "Package manager not recognized. Please install luarocks manually."
        exit 1
      fi
    else
      echo "luarocks is required. Exiting."
      exit 1
    fi
  fi

  
  # check if starship is installed
  if ! command -v starship &> /dev/null; then
    echo "Starship not found."
    read -p "Do you want to install Starship? (y/n): " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
      echo "Installing Starship..."
      if command -v curl &> /dev/null; then
        curl -sS https://starship.rs/install.sh | sh
      else
        echo "curl is required to install Starship. Please install curl and try again."
        exit 1
      fi
    else
      echo "Starship is recommended for this script. Exiting."
      exit 1
    fi
  fi


    ln -fs $dir/starship/starship.toml ~/.config/starship.toml
    
    # alacritty

    mkdir -p ~/.config/alacritty
    ln -fs $dir/alacritty/.config/alacritty.toml ~/.config/alacritty/alacritty.toml

  trap - EXIT
}

main "$@"
