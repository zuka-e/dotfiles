#!/usr/bin/env bash

# Determine if it's Mac.
function is_mac() {
  [[ "$(uname)" == "Darwin" ]]
}

# Determine if using Apple silicon processor.
function has_apple_silicon() {
  is_mac && [[ "$(uname -m)" == "arm64" ]]
}
