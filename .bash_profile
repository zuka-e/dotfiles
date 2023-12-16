#!/usr/bin/env bash

if [[ -t 0 ]]; then
  echo -e "\033[1;31m$(date '+Login Time : %Y/%m/%d (%a) | %H:%M (%S)')\033[0m"
fi

source ~/dotfiles/shell/bash/path.bash

[[ -r ~/.bashrc ]] && source ~/.bashrc
