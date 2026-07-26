# shellcheck source=../../../common/lib/nvm.sh
. "$BASH_CONFIG_HOME/../common/lib/nvm.sh"

if ! command -v nvm > /dev/null 2>&1; then
  return
fi

# cf. https://github.com/nvm-sh/nvm#calling-nvm-use-automatically-in-a-directory-with-a-nvmrc-file

cd_after() {
  load_nvmrc
  printf "→ %s\n" "$PWD" && ls
}

load_nvmrc
