# Dotfiles

`.bash_profile`や`.vimrc`などの設定ファイル (dotfiles) を管理します。

## 利用手順

```bash
git clone https://github.com/zuka-e/dotfiles.git
cd dotfiles && ./install.sh && exec "$SHELL" -l
```

### 処理の流れ

1. `install.sh`が`.bash_profile`を実行
1. `.bash_profile`が`.env-vars`, `path`, `.bashrc`, `.bash_login`を実行
1. `.bashrc`が各種スクリプト (`.aliases`, `.git-prompt.sh` etc) を実行

`install.sh`はホームディレクトリに各シンボリックリンク (`.bash_profile`など) を作成します。  
**※既にファイルが存在する場合は上書き** (バックアップを`.tmp`に作成)  
