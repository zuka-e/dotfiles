#!/usr/bin/env bash

sudo apt-get update && sudo apt-get full-upgrade -y \
  && sudo apt-get install -y \
    bat \
    curl \
    fd-find \
    git \
    htop \
    nmap \
    openssh-server \
    procps \
    psmisc \
    rename \
    ripgrep \
    rsync \
    tmux \
    tree \
    vim \
    wget \
    zsh \
  && sudo apt-get -y autoremove \
  && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# cf. https://doc.rust-lang.org/cargo/getting-started/installation.html
curl https://sh.rustup.rs -sSf | sh

if [[ -d "$HOME/.cargo" ]]; then
  . "$HOME/.cargo/env"

  # cf. https://github.com/eza-community/eza/blob/main/INSTALL.md
  cargo install eza
fi
