# -------------------------------------------------------------------
# This file was originally generated by "Oh My Zsh"
# From https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template
#
# `source $ZSH/oh-my-zsh.sh` will be run, so see the following
# - https://github.com/ohmyzsh/ohmyzsh/blob/master/oh-my-zsh.sh
# - https://github.com/ohmyzsh/ohmyzsh/tree/master/lib
# for details of aliases, options, etc.
# These will be located at `$ZSH` directory.
# -------------------------------------------------------------------

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="git-info"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# cf. https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/history.zsh
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# cf. https://github.com/ohmyzsh/ohmyzsh#plugins
# cf. https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins-Overview
plugins=(
  laravel
  npm
  terraform
  # cf. https://github.com/zsh-users/zsh-syntax-highlighting
  zsh-syntax-highlighting
)

# cf. https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

source $ZSH/oh-my-zsh.sh

# User configuration

find "$HOME"/dotfiles/shell/zsh -name "*.zsh" | while read line; do
  source "$line"
done
