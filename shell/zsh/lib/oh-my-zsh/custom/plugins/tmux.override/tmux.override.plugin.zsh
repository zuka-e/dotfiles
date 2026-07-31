# shellcheck disable=SC2034

# cf. https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux
ZSH_TMUX_AUTOCONNECT=false

# Start tmux initially
# cf. https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux
if [[ -z "$VSCODE_INJECTION" ]] \
  && [[ "$TERM_PROGRAM" != "WarpTerminal" ]]; then
  ZSH_TMUX_AUTOSTART=true
fi
