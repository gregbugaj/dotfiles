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

  # source nvm directly if the NVM_DIR exists
  if [ -d "$NVM_DIR" ]; then
    echo "NVM_DIR exists, sourcing nvm directly"
    source "$NVM_DIR/nvm.sh"
  fi
  nvm --version

  if ! command -v nvm &> /dev/null; then
    echo "nvm not found, please install it from https://github.com/nvm-sh/nvm"
    exit 1
  fi

  # git
  ln -fs $dir/git/gitconfig ~/.gitconfig

  # tmux
  # check if tmux tpm is installed
  if [ ! -d ~/.tmux/plugins/tpm ]; then
    echo "tpm not found, installing it"
    mkdir -p ~/.tmux/plugins
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi
    
    
  ln -fs $dir/tmux/tmux.conf ~/.tmux.conf

  # neovim
  ln -fs $dir/nvim-config ~/.config/nvim

  # ensure that luarocks is installed
  if ! command -v luarocks &> /dev/null; then
    echo "luarocks not found, please install it"
    exit 1
  fi
  
  # check if starship is installed
    if ! command -v starship &> /dev/null; then
        echo "starship not found, please install it"
    fi

    ln -fs $dir/starship/starship.toml ~/.config/starship.toml
    
    # alacritty

    mkdir -p ~/.config/alacritty
    ln -fs $dir/alacritty/.config/alacritty.toml ~/.config/alacritty/alacritty.toml

  trap - EXIT
}

main "$@"
