local cwd="%{$fg[cyan]%}%~"
local time="%T"
local prompt="%{$fg[blue]%}❯"

ZSH_THEME_GIT_PROMPT_PREFIX="~ "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"

function git_prompt_info() {
  if [ $(git symbolic-ref HEAD 2> /dev/null) ]; then
	echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
	
  else
	 echo %w
  fi
}

PROMPT="${time} ${cwd} ${prompt} %{$reset_color%}"
RPROMPT='$(git_prompt_info)'

