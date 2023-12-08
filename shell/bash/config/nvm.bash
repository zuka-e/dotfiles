# cf. https://github.com/nvm-sh/nvm
# cf. https://github.com/Homebrew/homebrew-core/blob/HEAD/Formula/n/nvm.rb
# cf. (Zsh) https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nvm (completion of versions is insufficient)

export NVM_DIR=~/.nvm

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if type brew > /dev/null 2>&1; then
  nvm_path=$(brew --prefix nvm)

  [ -s "$nvm_path/etc/bash_completion.d/nvm" ] && \. "$nvm_path/etc/bash_completion.d/nvm"

  unset nvm_path
fi
