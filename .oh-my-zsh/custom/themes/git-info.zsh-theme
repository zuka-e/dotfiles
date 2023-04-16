if [[ -n "$SSH_CONNECTION" ]]; then
	prompt_time_color="cyan"
	prompt_username_color="green"
	prompt_hostname_color="magenta"
	prompt_path_color="yellow"
else
	prompt_time_color="magenta"
	prompt_username_color="cyan"
	prompt_hostname_color="yellow"
	prompt_path_color="green"
fi

# cf. https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/git.zsh (functions)
# `git_prompt_info()`
ZSH_THEME_GIT_PROMPT_PREFIX="%{%B$fg[red]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%B$fg[red]%})"
ZSH_THEME_GIT_PROMPT_DIRTY="" # "%{%B$fg[yellow]%} ●"
ZSH_THEME_GIT_PROMPT_CLEAN="" # "%{%B$fg[yellow]%} ✔"
# `git_commits_ahead()`, `git_commits_behind()`
ZSH_THEME_GIT_PROMPT_AHEAD=""
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX="%{%B$fg[green]%} ↑"
ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND=""
ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX="%{%B$fg[yellow]%} ↓"
ZSH_THEME_GIT_COMMITS_BEHIND_SUFFIX="%{$reset_color%}"
# `git_prompt_status()`
ZSH_THEME_GIT_PROMPT_STASHED="%{%B$fg[blue]%} ⚑"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{%B$fg[cyan]%} U"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{%B$fg[yellow]%} M"
ZSH_THEME_GIT_PROMPT_ADDED="%{%B$fg[green]%} A"
ZSH_THEME_GIT_PROMPT_DELETED="%{%B$fg[red]%} D"
ZSH_THEME_GIT_PROMPT_RENAMED="%{%B$fg[blue]%} R"

# Combines all Git prompt outputs.
function make_git_prompt() {
	echo "$(git_prompt_info)%{$reset_color%}$(git_commits_ahead)%{$reset_color%}$(git_commits_behind)%{$reset_color%}$(git_prompt_status)%{$reset_color%}$(git_remote_status)%{$reset_color%}"
}

# For details of special characters, see `man zshmisc`(SIMPLE PROMPT ESCAPES).
function make_prompt() {
	prompt_time="%{%B$fg[$prompt_time_color]%}%D{%Y/%m/%d(%a) %H:%M:%S}%{$reset_color%}"
	prompt_username="%{%B$fg[$prompt_username_color]%}%n%{$reset_color%}"
	prompt_hostname="%{%B$fg[$prompt_hostname_color]%}%M%{$reset_color%}"
	prompt_path="%{%B$fg[$prompt_path_color]%}%~%{$reset_color%}"

	echo "${prompt_time}"
	echo "${prompt_username}@${prompt_hostname}:${prompt_path} $(make_git_prompt)"
	echo "%# "
}

PROMPT='$(make_prompt)'

# Outputs the exit status if the previous command failed.
# For `?..`, see `man zshmisc`(CONDITIONAL SUBSTRINGS IN PROMPTS)
RPROMPT="%(?..%{%B$fg[red]%}%?%{$reset_color%})"
