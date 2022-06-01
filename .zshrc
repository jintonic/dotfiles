# vim: fdm=marker:fen:fdl=0
# prompt {{{1
# https://salferrarello.com/zsh-git-status-prompt
autoload -Uz vcs_info add-zsh-hook
# run vcs_info function before the prompt is displayed
add-zsh-hook precmd vcs_info

# enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+' 
zstyle ':vcs_info:git:*' formats '%F{magenta}(%b%u%c)'

# enable substitution in prompt
setopt prompt_subst
PROMPT='%F{cyan}cmd %h returned %? @%t on %D
%F{yellow}%j background %(2j.jobs.job) in %y [shell level: %L]
%F{green}%n@%m:%F{blue}%~ ${vcs_info_msg_0_}
%F{red}%N %# %F{50}'

# alias {{{1
alias ls='ls --color'
alias la='ls -A'
alias ll='ls -AlFh'

alias df='df -h'
alias du='du -h'

alias en='emacs -nw'
alias vi='vim -X'

alias r='root -l'
alias rbq='root -b -q'

alias sb='screen -X hardstatus alwayslastline "%{= Bk}%H | %-w%{= kB}%n*%t %{-}%+w %= %M %d %D %C %A"'
alias sd='screen -D -RR'
alias sl='screen -list'
alias sw='screen -wipe'
alias sn='screen -X deflogin off'
alias ss='screen -X source ~/.screenrc'

# environment variables {{{1
# https://superuser.com/questions/1195962/
export SCREENDIR=~/.screen

export PATH=~/bin:$PATH

# functions {{{1
# vifm {{{2
# https://wiki.vifm.info/index.php/How_to_set_shell_working_directory_after_leaving_Vifm
l() {
  local dst="$(command vifm . --choose-dir -)"
  if [ -z "$dst" ]; then
    echo 'Directory picking cancelled/failed'
    return 1
  fi
  cd "$dst"
}

# auto completion {{{1
autoload -Uz compinit
compinit
# Geant4 {{{1
if [[ `uname` == "Darwin" ]]; then
  pushd /usr/local/bin > /dev/null; source geant4.sh; popd > /dev/null
fi
