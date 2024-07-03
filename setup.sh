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

  # git
  ln -fs $dir/git/gitconfig ~/.gitconfig

  # tmux
  ln -fs $dir/tmux/tmux.conf ~/.tmux.conf

  # neovim
  ln -fs $dir/nvim-config ~/.config/nvim

  # ensure that luarocks is installed
  if ! command -v luarocks &> /dev/null; then
    echo "luarocks not found, please install it"
    exit 1
  fi
  

  trap - EXIT
}

main "$@"
