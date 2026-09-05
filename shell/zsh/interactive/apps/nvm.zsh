# cf. https://github.com/nvm-sh/nvm#calling-nvm-use-automatically-in-a-directory-with-a-nvmrc-file

# shellcheck source=../../../common/lib/nvm.sh
. "$ZSH_CONFIG_HOME/../common/lib/nvm.sh"

if ! command -v nvm > /dev/null 2>&1; then
  return
fi

autoload -U add-zsh-hook

# When CHanging PWD, load the `.nvmrc`.
add-zsh-hook chpwd load_nvmrc

load_nvmrc
