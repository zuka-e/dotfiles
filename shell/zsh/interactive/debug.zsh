# shellcheck disable=SC2034

if [[ "${DEBUG-}" != true ]]; then
  return
fi

# Print execution time statistics for commands slower than x seconds.
REPORTTIME=1

# Run `zprof` to measure the performance.
zmodload zsh/zprof
