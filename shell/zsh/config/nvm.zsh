autoload -U add-zsh-hook

# When the directory is changed, load the `.nvmrc`
add-zsh-hook chpwd load_nvmrc
