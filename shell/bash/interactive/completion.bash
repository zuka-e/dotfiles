# `bash-completion@2` formula (https://github.com/scop/bash-completion)

if [[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]]; then
  # shellcheck source=/dev/null
  . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
fi
