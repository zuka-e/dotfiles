if ! command -v poetry > /dev/null 2>&1; then
  return
fi

# cf. https://python-poetry.org/docs/#bash
poetry completions bash >> "$HOME/.bash_completion"
