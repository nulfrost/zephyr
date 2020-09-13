local symbol="%F{blue}☌%f"
local cwd='%F{green}%1~%f'
local newline=$'\n'
local date='%T'


ZSH_THEME_GIT_PROMPT_ADDED=" +"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}∅"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔"
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX="%{$fg[cyan]%}»"
ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX="%{$fg[red]%}«"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}?"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}×"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}*"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%}∇"


function git_prompt_info() {
  if [ $(git symbolic-ref HEAD 2> /dev/null) ]; then
	  echo "on %F{cyan}[$(current_branch)]%f $(parse_git_dirty)%f"
  fi
}

PROMPT='${cwd} $(git_prompt_info) ${newline}${symbol} '
RPROMPT='%F{cyan}[${date}]'

