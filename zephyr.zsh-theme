local cwd="%{$fg[cyan]%}%~"
local time="%T"
local prompt="%{$fg[blue]%}❯"

ZSH_THEME_GIT_PROMPT_PREFIX=" ~ "
ZSH_THEME_GIT_PROMPT_ADDED=" + "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX="%{$fg[cyan]%} >> "
ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX="%{$fg[red]%} << "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ¤ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} × "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} * "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ∇ "

function git_prompt_info() {
  if [ $(git symbolic-ref HEAD 2> /dev/null) ]; then
	echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
	
  else
	 echo %w
  fi
}

PROMPT="${time} ${cwd} ${prompt} %{$reset_color%}"
RPROMPT='$(git_prompt_info)'

