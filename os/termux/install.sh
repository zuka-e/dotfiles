#!/usr/bin/env bash

pkg update && pkg upgrade -y \
  && pkg install -y \
    bat \
    curl \
    eza \
    fd \
    git \
    htop \
    nmap \
    openssh \
    procps \
    psmisc \
    renameutils \
    ripgrep \
    rsync \
    tmux \
    tree \
    vim \
    wget \
    zsh \
  && apt -y autoremove \
  && rm -rf "$PREFIX"/var/lib/apt/lists/* "$PREFIX"/tmp/*
