#!/usr/bin/env bash

zsh_path="$(command -v zsh)"

if [[ ! -x $zsh_path ]]; then
  exit 2
fi

if [[ $SHELL == $zsh_path ]]; then
  exit 0
fi

if ! grep $zsh_path '/etc/shells' > /dev/null 2>&1; then
  echo $zsh_path | sudo tee -a /etc/shells > /dev/null

  if [[ $? == 0 ]]; then
    echo "Added $zsh_path to '/etc/shells'"
  else
    echo "Canceled the operation"
  fi
fi

echo "Changing the login shell into $zsh_path."
chsh -s $zsh_path

if [[ $? == 0 ]]; then
  echo "Changed the login shell to $zsh_path."
  export SHELL=$zsh_path
  exec $SHELL -l
fi

unset zsh_path
