for file in $(find ~/dotfiles/shell/common -name "*.sh" ! -name "path.*"); do
  source "$file"
done

for file in $(find ~/dotfiles/shell/bash/libs -name "*.bash"); do
  source "$file"
done

for file in $(
  find ~/dotfiles/shell/bash \
    ! -path "$HOME/dotfiles/shell/bash/libs/*" \
    -name "*.bash" \
    ! -name "path.*"
); do
  source "$file"
done
