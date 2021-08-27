# Dotfiles

`.bash_profile`や`.vimrc`などの設定ファイル (dotfiles) を管理します。

## 利用手順

```bash
 git clone https://github.com/zuka-e/dotfiles.git
 source dotfiles/install.sh
```

### 処理の流れ

1. `install.sh`が`.bash_profile`を実行  
1. `.bash_profile`が`.env-vars`, `path`, `.bashrc`, `.bash_login`を実行
1. `.bashrc`が各種スクリプト (`.aliases`, `.git-prompt.sh` etc) を実行

`install.sh`はホームディレクトリに各シンボリックリンク (`.bash_profile`など) を作成します。**ただし既にファイルが存在する場合は上書きされます。**

```bash :install.sh
# Make symlinks
(cd ~/dotfiles/; # Inside '()', a Sub-shell works
linked_files=(.{bash_profile,bashrc,gitconfig,inputrc,tmux.conf,vimrc})
for file in ${linked_files[@]}; do
  # Opts: s:symlink f:forced v:verbose
  # If you confirm before it has executed, replace '-f' with '-i'
  ln -sfv ~/dotfiles/"${file}" ~/"${file}";
done;)
source ~/.bash_profile
```
