#!/usr/bin/env bash

if [[ ! -e "$HOME/.bash_completion" ]]; then
  mkdir "$HOME/.bash_completion"
fi

# cf. https://python-poetry.org/docs/#bash
if type poetry > /dev/null 2>&1; then
  poetry completions bash >> "$HOME/.bash_completion"
fi
