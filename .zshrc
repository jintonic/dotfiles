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

alias fh='find . -name '
alias ..='cd ..'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e '
alias md='mkdir -p'

alias df='df -h'
alias du='du -h'

alias en='emacs -nw'
alias vi='vim -X'

alias r='root -l'
alias rbq='root -b -q'

alias t='tmux -u'
alias tl='tmux -u new l'

# environment variables {{{1
export PATH=~/.local/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

[ -s "~/.rye/env" ] && \. "~/.rye/env" # Python

[ -s "~/geant4/11.3.0/bin/geant4.sh" ] && \. "~/geant4/11.3.0/bin/geant4.sh"

# functions {{{1
# https://github.com/gokcehan/lf/blob/master/etc/lfcd.sh
l() {
  lf -last-dir-path=$HOME/.local/share/lf/tmp "$@"
  cd "$(cat $HOME/.local/share/lf/tmp)"
}
c() { awk "BEGIN { pi=4.0*atan2(1.0,1.0); o=pi/180.0; print $* }" }

# auto completion {{{1
autoload -Uz compinit
compinit
# put cursor anywhere in a command and hit TAB to complete from there
setopt COMPLETE_IN_WORD

# Mac specific {{{1
if [[ `uname` == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export PATH=/usr/local/texlive/2024basic/bin/universal-darwin:$PATH
fi
