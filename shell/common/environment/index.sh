_own_dir="$SHELL_CONFIG_HOME/common/environment"

# shellcheck source=./00-base.sh
. "$_own_dir/00-base.sh"
# shellcheck source=./10-locale.sh
. "$_own_dir/10-locale.sh"
# shellcheck source=./20-runtime.sh
. "$_own_dir/20-runtime.sh"
# shellcheck source=./30-path.sh
. "$_own_dir/30-path.sh"
# shellcheck source=./50-apps.sh
. "$_own_dir/50-apps.sh"

if [[ -f "$_own_dir/90-local.sh" ]]; then
  # shellcheck source=/dev/null
  . "$_own_dir/90-local.sh"
fi

unset _own_dir
