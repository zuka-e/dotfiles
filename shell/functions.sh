#!/usr/bin/env bash

# Determine if it's Mac.
function is_mac() {
  [[ "$(uname)" == "Darwin" ]]
}

# Determine if it's Linux.
function is_linux() {
  [[ "$(uname)" == "Linux" ]]
}

# Determine if using Apple silicon processor.
function has_apple_silicon() {
  is_mac && [[ "$(uname -m)" == "arm64" ]]
}

# Determine if the current shell is interactive.
function is_interactive_shell() {
  [[ $- == *i* ]]
}

# Determine if the current shell is login one.
function is_login_shell() {
  [[ "$SHLVL" == 1 ]]
}
