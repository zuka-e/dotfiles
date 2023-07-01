#!/usr/bin/env bash

source ~/dotfiles/shell/functions.sh

# Define `LS_COLORS`
if is_linux; then
  eval "$(dircolors ./.colorrc)";
elif is_mac; then
  export LSCOLORS="GxfxcxdxBxegedabagacad";
fi
