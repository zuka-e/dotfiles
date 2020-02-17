# 設定用ファイル同期スクリプト
- .bash_profileや.vimrc等の、"."で始まる設定ファイルを簡単に同期、実行します。
- macOSの他、LinuxやAndroid(git,sshが利用できるもの)でも実行可能です。
  - 検証環境(bash)
    - macOS Catalina
    - ubuntu bionic64 (virtualbox)
    - Android 8 (Termux)

## 利用法

```Shell
 git clone https://  
 source dotfiles/setup.sh
```

### 上記コマンド(source dotfiles/setup.sh)の実行の流れ
`setup.sh  
-> .bash_profile  
-> { path, functions, aliases, env-vars, git-prompt.sh, git-completion.bash }`

- 実行結果

```Shell
$ source dotfiles/setup.sh
'/home/vagrant/.aliases' -> '/home/vagrant/dotfiles/.aliases'
'/home/vagrant/.bash_history' -> '/home/vagrant/dotfiles/.bash_history'
'/home/vagrant/.bash_profile' -> '/home/vagrant/dotfiles/.bash_profile'
'/home/vagrant/.colorrc' -> '/home/vagrant/dotfiles/.colorrc'
'/home/vagrant/.env-vars' -> '/home/vagrant/dotfiles/.env-vars'
'/home/vagrant/.functions' -> '/home/vagrant/dotfiles/.functions'
'/home/vagrant/.git-completion.bash' -> '/home/vagrant/dotfiles/.git-completion.bash'
'/home/vagrant/.git-prompt.sh' -> '/home/vagrant/dotfiles/.git-prompt.sh'
'/home/vagrant/.gitconfig' -> '/home/vagrant/dotfiles/.gitconfig'
'/home/vagrant/.path' -> '/home/vagrant/dotfiles/.path'
'/home/vagrant/.vimrc' -> '/home/vagrant/dotfiles/.vimrc'
'/home/vagrant/.path' has executed!
'/home/vagrant/.functions' has executed!
'/home/vagrant/.aliases' has executed!
'/home/vagrant/.env-vars' has executed!
'/home/vagrant/.git-prompt.sh' has executed!
'/home/vagrant/.git-completion.bash' has executed!
Hello!! [$(whoami)]
Login Time : 0000/00/00 (Mon) | 00:00 (00)
```

### setup.sh
- dotfileディレクトリ内の、"."から始まるファイルのシンボリックリンクを、ホームディレクトリに作成し、  
  その後、bash_profileを実行します。

```Shell:setup.sh
# dotfiles/setup.sh
(cd ~/dotfiles/; # サブシェルで実行(実行後ディレクトリ移動しない)
for file in .??*; do # '.'から始まるファイルを取得
  [ ${file} = ".git" ] && continue # リンクを貼るファイルから除く
  [ ${file} = ".DS_Store" ] && continue
  ln -sfv ~/dotfiles/"${file}" ~/"${file}"; # シンボリックリンクを作成(-f:同名ファイルを上書き)
done;)
source ~/.bash_profile
```

### .bash_profile
- execute_files(変数)にファイル名を代入し、それらを実行します。  

```Shell
# dotfiles/.bash_profile
execute_files=(~/.{path,functions,aliases,env-vars,git-prompt.sh,git-completion.bash})
for file in ${execute_files[@]}; do # 読込ファイルを配列で取得
  [ -r "$file" ] && source "$file"; # ファイルが読込可能なら実行
  if [ $? = 0 ]; then
    echo "'$file'" 'has executed!';
  else
    echo "'$file'" 'has NOT executed.';
  fi;
done
```

### .bash_profileで読み込まれるファイル
これらのファイルは分けなくても実行可能ですが、読みやすくするためそれぞれのファイルを作成しています。
- .path: 
  - パス設定用 (例: export PATH="~/.pyenv/bin:$PATH")  
- .functions:  
  - 関数定義用 (例: function mkdircd() { \mkdir $@ && cd $_; })  
- .aliases:  
  - エイリアス設定用 (例: alias ls="ls -aG")  
- .env-vars: 
  - 環境変数設定用 (例: export LANG=en_US.UTF-8)  
- .git-prompt.sh: 
  - プロンプトにGitブランチ等を表示させるスクリプト (以下URLから取得したもの)  
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
- .git-completion.bash: 
  - Gitコマンドの補完用スクリプト (以下URLから取得したもの) 
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
  
  
 ## その他
 
 ### macos ディレクトリ
 - setup.sh
   - mac本体の設定 (例: Finderで隠しファイルを表示する)
 - brew.sh
   - brew install のリスト
 - brew_cask.sh
   - brew cask install のリスト
 
 ### vscode ディレクトリ
 - setup.sh
   - VSCode のsettings.json にシンボリックリンク作成
 - settings.json
   - VSCode の設定用ファイル
 
