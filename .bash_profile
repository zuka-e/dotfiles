if [[ -t 0 ]]; then
  echo -e "\033[1;31m$(date '+Login Time : %Y/%m/%d (%a) | %H:%M (%S)')\033[0m"
fi

exported_files=(~/dotfiles/shell/.{env-vars,path})
for file in ${exported_files[@]}; do
  [[ -r "$file" ]] && source "$file";
done

if [[ -r ~/.bashrc ]]; then
  source ~/.bashrc;
fi

if [[ -r ~/.bash_login ]]; then
  source ~/.bash_login;
fi
