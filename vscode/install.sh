#!/usr/bin/env bash

#------------------------------------------------
# Create symbolic links for settings
#------------------------------------------------

tmp_dir="$HOME/dotfiles/.tmp"
setting_filenames=({keybindings.json,settings.json})

for filename in ${setting_filenames[@]}; do
  src="$HOME/dotfiles/vscode/$filename"
  target="$HOME/Library/Application Support/Code/User/$filename"

  [[ -L "$target" ]] && continue

  [[ -e "$target" ]] && \mv -fv "$target" "$tmp_dir"

  ln -sfv "$src" "$target"
done;

setting_dirnames=({snippets,})

for dirname in ${setting_dirnames[@]}; do
  setting_path="$HOME/Library/Application Support/Code/User"
  src="$HOME/dotfiles/vscode/$dirname"
  target="$setting_path/$dirname"

  [[ -L "$target" ]] && continue

  [[ -e "$target" ]] && \mv -fv "$target" "$tmp_dir"

  ln -sfv "$src" "$setting_path"
done;

#------------------------------------------------
# Extension installation and removal
#------------------------------------------------

echo
echo "Started extension installation and removal processes."

current_file="$TMPDIR/vscode/extensions"
updated_file="$HOME/dotfiles/vscode/extensions"

if [[ ! -f "$updated_file" ]];then
  echo "\"$updated_file\" doesn't exist."
  return 2
fi

echo "Loading installed extensions..."
[[ -e $(dirname $current_file) ]] || \mkdir $(dirname $current_file)
code --list-extensions >| "$current_file"

# Remove comments, dup, and blank lines, and sort a file.
function format_file {
  sed -E -e "s/#.*//" -e "/^\s*$/d" "${1}" | sort | uniq
}

function diff_extensions {
  # `<()`: Process Substitution
  diff -u \
    --ignore-blank-lines \
    --ignore-space-change \
    <(format_file "$current_file") \
    <(format_file "$updated_file")
}

# Extensions to be added.
added_extensions=$(diff_extensions | \egrep "^\+\w+" | sed -E "s/^\+//")
# Extensions to be removed.
removed_extensions=$(diff_extensions | \egrep "^\-\w+" | sed -E "s/^\-//")

if [[ ! -z $removed_extensions ]]; then
  echo -e "\n\033[31mThe following extensions will be removed.\033[0m"
  echo "==========================================="
  echo "$removed_extensions"
  echo "==========================================="
fi

if [[ ! -z $added_extensions ]]; then
  echo -e "\n\033[32mThe following extensions will be installed.\033[0m"
  echo "==========================================="
  echo "$added_extensions"
  echo "==========================================="
fi

if [[ -z $added_extensions && -z $removed_extensions ]]; then
  echo "Already up-to-date."
else
  echo
  while true; do
    read -p "Are you sure to continue? (y/N) " input
    case $input in
      y|yes)
        [[ ! -z $removed_extensions ]] && echo "$removed_extensions" |
          while read line; do
            echo code --uninstall-extension "${line}"
          done
        [[ ! -z $added_extensions ]] && echo "$added_extensions" |
          while read line; do
            echo code --install-extension "${line}"
          done
        break;;
      N|no|No|"")
        echo "Canceled."
        break;;
      *)
        echo "Please answer with y or N.";;
    esac
  done
fi
