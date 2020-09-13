local symbol="%F{blue}☌%f"
local cwd='%F{green}%1~%f'
local newline=$'\n'
local time='%T'

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats 'on branch %F{cyan}%b'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%{%F{green}%B%}●%{%b%f%}'
zstyle ':vcs_info:*' unstagedstr '%{%F{red}%B%}●%{%b%f%}'

setopt PROMPT_SUBST

+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+='T'
    fi
}

PROMPT='${cwd} ${vcs_info_msg_0_} ${newline}${symbol} '
RPROMPT='%F{cyan}[${time}]'

