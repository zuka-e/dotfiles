# Dotfiles ( 設定ファイル )
- .bash_profileや.vimrc等の、"."で始まる設定ファイル(dotfiles)を簡単に同期します。
- macOSの他、LinuxやAndroidでも動作を確認

## 検証環境 (bash)
- macOS Catalina
- ubuntu bionic64 (virtualbox)
- Raspberry Pi 4B (raspbian)
- Android 8 (Termux)

## 利用法

```Shell
 git clone https://github.com/zuka-e/dotfiles.git  
 source dotfiles/setup.sh
```

### 上記コマンド (source dotfiles/setup.sh) の実行の流れ
1. `setup.sh`が`.bash_profile`を実行  
1. `.bash_profile`が`.bashrc`を実行  
1. `.bashrc`が各種スクリプトを実行  
1. `.path`,`.aliases`,`.env-vars`,`.git-prompt.sh`,`.git-completion.bash`が適用される  

### setup.sh
下記のシンボリックリンクを、ホームディレクトリに作成し、`.bash_profile`を実行します。  
`.bash_profile`,`.bashrc`,`.gitconfig`,`.inputrc`,`.vimrc`  
**注意! 既存のファイルを上書きしてしまいます。**

```Shell:setup.sh
# dotfiles/setup.sh
(cd ~/dotfiles/; # サブシェルで実行(実行後ディレクトリ移動しない)
linked_files=(.{bash_profile,bashrc,gitconfig,inputrc,vimrc})
for file in ${linked_files[@]}; do # 配列からファイルを取得
  # Opts(ln): s:symlink f:forced v:verbose
  # If you confirm before it has executed, replace '-f' with '-i'
  ln -sfv ~/dotfiles/"${file}" ~/"${file}"; # シンボリックリンクを作成(-f:同名ファイルを上書き)
done;)
source ~/.bash_profile
```

### .bash_profile
`.bashrc`を読み込みます。
```Shell:.bash_profile
if [[ -r .bashrc ]]; then
  source .bashrc;
fi
```

### .bashrc
変数`execute_files`にファイル名を代入し、それらを実行します。  

```Shell:.bashrc
# dotfiles/.bashrc
execute_files=(~/dotfiles/.{path,aliases,env-vars,git-prompt.sh,git-completion.bash})
for file in ${execute_files[@]}; do # 読込ファイルを配列で取得
  [ -r "$file" ] && source "$file"; # ファイルが読込可能なら実行
done
```

### .bashrcで読み込まれるファイル
- `.path`: パスを設定する (例: export PATH="~/.pyenv/bin:$PATH")  
- `.aliases`: エイリアスを設定する (例: alias ls="ls -aG")  
- `.env-vars`: 環境変数を設定する (例: export LANG=en_US.UTF-8)  
- `.git-prompt.sh`: プロンプトにGitブランチ等を表示させる (以下URLから取得)  
https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
- `.git-completion.bash`: Gitコマンドを補完する (以下URLから取得)  
https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
  
  
 ## その他 (拡張子がshのファイルはsourceで実行)
 
 ### macos ディレクトリ
 - `setup.sh`
   - mac本体の設定 (例: Finderで隠しファイルを表示する)
 - `brew.sh`
   - brew install のリスト
 - `brew_cask.sh`
   - brew cask install のリスト
 
 ### vscode ディレクトリ
 - `setup.sh`
   - VSCode のsettings.json にシンボリックリンク作成
 - `settings.json`
   - VSCode の設定用ファイル
 
