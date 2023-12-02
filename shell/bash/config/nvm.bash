# cf. https://github.com/nvm-sh/nvm
# cf. https://github.com/Homebrew/homebrew-core/blob/HEAD/Formula/n/nvm.rb
# cf. (Zsh) https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nvm (completion of versions is insufficient)

export NVM_DIR=~/.nvm

brew_nvm_path=$(brew --prefix nvm)

# This loads nvm
[ -s "$brew_nvm_path/nvm.sh" ] && \. "$brew_nvm_path/nvm.sh"

[ -s "$brew_nvm_path/etc/bash_completion.d/nvm" ] && \. "$brew_nvm_path/etc/bash_completion.d/nvm"
