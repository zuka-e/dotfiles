if [[ -t 0 ]]; then
  echo -e "\033[1;31mHello!! ["$(whoami)"]
"$(date '+Login Time : %Y/%m/%d (%a) | %H:%M (%S)')"\033[0m"
fi

exports_files=(~/dotfiles/.{env-vars,path})
for file in ${exports_files[@]}; do
  [[ -r "$file" ]] && source "$file"; # True if file exists and is readable.
done

if [[ -r ~/.bashrc ]]; then
  source ~/.bashrc;
fi

if [[ -r ~/.bash_login ]]; then
  source ~/.bash_login;
fi
