# shellcheck source=../../../common/lib/nvm.sh
. "$ZSH_CONFIG_HOME/../common/lib/nvm.sh"

autoload -U add-zsh-hook

# When the directory is changed, load the `.nvmrc`
add-zsh-hook chpwd load_nvmrc

load_nvmrc
