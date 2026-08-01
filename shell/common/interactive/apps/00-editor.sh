# Text editor (e.g. `git commit --amend`)
if command -v nvim > /dev/null 2>&1; then
  EDITOR=nvim
elif command -v vim > /dev/null 2>&1; then
  EDITOR=vim
fi

# GUI Editor (e.g. `git commit --amend`)
if command -v code > /dev/null 2>&1; then
  VISUAL='code --wait'
fi

export EDITOR VISUAL
