if [[ -t 0 ]]; then
  echo -e "\033[1;31m$(date '+Login Time : %Y/%m/%d (%a) | %H:%M (%S)')\033[0m"
fi

source ~/dotfiles/shell/bash/path.bash

exported_files=(~/dotfiles/shell/bash/exports/.{env-vars})
for file in ${exported_files[@]}; do
  [[ -r "$file" ]] && source "$file"
done

[[ -r ~/.bashrc ]] && source ~/.bashrc
