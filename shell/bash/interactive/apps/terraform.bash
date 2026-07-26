if ! command -v terraform > /dev/null 2>&1; then
  return
fi

complete -C terraform terraform
