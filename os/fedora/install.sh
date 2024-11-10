#!/usr/bin/env bash

dnf check-update

sudo dnf upgrade --refresh -y && sudo dnf install epel-release -y \
  && sudo dnf install -y --allowerasing \
    bat \
    curl \
    eza \
    fd-find \
    git \
    htop \
    nmap \
    openssh-server \
    prename \
    procps \
    psmisc \
    ripgrep \
    rsync \
    tmux \
    tree \
    util-linux-user \
    vim \
    wget \
    zsh \
  && sudo dnf autoremove -y \
  && sudo rm -rf /var/cache/dnf/* /tmp/* /var/tmp/*
