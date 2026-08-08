#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=../../shell/common/lib/log.sh
. "$DOTFILES_PATH/shell/common/lib/log.sh"
# shellcheck source=../../shell/common/lib/prompt.sh
. "$DOTFILES_PATH/shell/common/lib/prompt.sh"
# shellcheck source=../../shell/common/lib/string.sh
. "$DOTFILES_PATH/shell/common/lib/string.sh"

editors=()
cmds=()

if command -v code > /dev/null 2>&1; then
  editors+=("VS Code")
  cmds+=("code")
fi
if command -v agy-ide > /dev/null 2>&1; then
  editors+=("Antigravity IDE")
  cmds+=("agy-ide")
fi

if [[ "${#editors[@]}" -eq 0 ]]; then
  print_info 'No compatible editors (code, cursor, agy-ide) found.'
  exit 0
fi

for i in "${!editors[@]}"; do
  editor="${editors[i]}"
  cmd="${cmds[i]}"

  [[ "$i" -gt 0 ]] && print_default
  print_default '==========================================='
  print_bold "Checking extensions for $editor..."
  print_default '==========================================='

  requirement_file="$DOTFILES_PATH/vscode/apps/$cmd/extensions.txt"

  if [[ ! -f "$requirement_file" ]]; then
    print_error "$requirement_file doesn't exist."
    exit 2
  fi

  current_file="$TMPDIR/${editor}_extensions.txt"
  "$cmd" --list-extensions > "$current_file"

  installed="$(cat "$current_file" | normalize_list)"
  required="$(cat "$requirement_file" | normalize_list)"

  adding="$(comm -13 <(printf '%s\n' "$installed") <(printf '%s\n' "$required"))"
  removing="$(comm -23 <(printf '%s\n' "$installed") <(printf '%s\n' "$required"))"

  if [[ -n $adding ]]; then
    print_bold_green 'The following will be added.'
    print_default '==========================================='
    print_bold_green "$adding"
    print_default '==========================================='
  fi

  if [[ -n "$removing" ]]; then
    print_bold_red 'The following will be removed.'
    print_default '==========================================='
    print_bold_red "$removing"
    print_default '==========================================='
  fi

  if [[ ! -n "$adding" && ! -n "$removing" ]]; then
    print_info "All extensions are already up-to-date for $editor."
    continue
  fi

  if ! confirm 'Do you want to continue?'; then
    continue
  fi

  for ext in ${removing:-}; do
    "$cmd" --uninstall-extension "$ext"
  done

  for ext in ${adding:-}; do
    "$cmd" --install-extension "$ext"
  done
done
