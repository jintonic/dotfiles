# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

stty -ixon # disable C-q C-s

# don't put duplicate lines or lines starting with space in the history,
# and erase already existing duplicated lines
HISTCONTROL=ignoreboth:erasedups
HISTIGNORE="[ ]*:&:l[lsa]:[bf]g:exit"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar # not work in old bash

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# color prompt
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
else
  color_prompt=
fi

# Define colors
red="\[\e[0;31m\]"
RED="\[\e[1;31m\]"
green="\[\e[0;32m\]"
GREEN="\[\e[1;32m\]"
yellow="\[\e[0;33m\]"
YELLOW="\[\e[1;33m\]"
blue="\[\e[0;34m\]"
BLUE="\[\e[1;34m\]"
magenta="\[\e[0;35m\]"
MAGENTA="\[\e[1;35m\]"
cyan="\[\e[0;36m\]"
CYAN="\[\e[1;36m\]"
PLAIN="\[\e[0m\]"

# http://github.com/joepvd/tty-solarized
if [ "$TERM" = "linux" ]; then
  echo -en "\e]PB657b83" # S_base00
  echo -en "\e]PA586e75" # S_base01
  echo -en "\e]P0073642" # S_base02
  echo -en "\e]P62aa198" # S_cyan
  echo -en "\e]P8002b36" # S_base03
  echo -en "\e]P2859900" # S_green
  echo -en "\e]P5d33682" # S_magenta
  echo -en "\e]P1dc322f" # S_red
  echo -en "\e]PC839496" # S_base0
  echo -en "\e]PE93a1a1" # S_base1
  echo -en "\e]P9cb4b16" # S_orange
  echo -en "\e]P7eee8d5" # S_base2
  echo -en "\e]P4268bd2" # S_blue
  echo -en "\e]P3b58900" # S_yellow
  echo -en "\e]PFfdf6e3" # S_base3
  echo -en "\e]PD6c71c4" # S_violet
  clear # against bg artifacts
fi

# enable color support of ls and also add handy aliases
export CLICOLOR=1 # enable colorful output of ls in Mac
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep -i --color=auto'
fi

# some more ls aliases
alias ll='ls -AlFh'
alias la='ls -Ah'

alias fh='find . -name '
alias ..='cd ..'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e '
alias md='mkdir -p'

alias df='df -h'
alias du='du -h'

alias mdp='TERM=xterm-256color mdp'
alias ev='emacs -nw'
alias vi='vim -X'

alias r='root -l'
alias rbq='root -b -q'

alias news='newsbeuter -q'

alias t='tmux -u'
alias tl='t new l'

export GS_OPTIONS="-dSAFER -dBATCH -dNOPAUSE -sDEVICE=pdfwrite"
export WWW_HOME=~/.w3m/bookmark.html

# https://www.gnu.org/software/gettext/manual/html_node/Locale-Environment-Variables.html
export LANG="en_US.UTF-8"

export TEXMFHOME=~/.texmf
export TERMINFO=~/.terminfo

if [[ `uname` != "Darwin" ]]; then export LD_LIBRARY_PATH=$HOME/lib; fi

export PKG_CONFIG_PATH=~/lib/pkgconfig
export MANPATH=~/man:~/share/man:$MANPATH

export PAGER='less -r'

# nice line drawing in putty 
# (https://superuser.com/questions/278286/making-256-color-and-line-drawing-characters-both-work-in-putty)
export NCURSES_NO_UTF8_ACS=1

# https://github.com/hpcng/singularity/issues/643
# uncomment the following line if you really want a container to load this file
#export APPTAINER_SHELL="/bin/bash"
# https://groups.google.com/a/lbl.gov/g/singularity/c/-lzLyY2VLKs
export APPTAINER_BINDPATH="/run:/run"
# configs above this block will be available in singularity containers
if [ X"$APPTAINER_NAME" != X ]; then return; fi

export EDITOR=vim
# https://github.com/gokcehan/lf/blob/master/etc/lfcd.sh
l() {
  lf -last-dir-path=${HOME}/.local/share/lf/tmp "$@"
  cd "$(cat "${HOME}/.local/share/lf/tmp")"
}

if [ "$color_prompt" = yes ]; then
  PS1="${green}\u@\h:${blue}\w\n${magenta}[\!]${PLAIN} "
else
  PS1='\u@\h:\w\n[\!] '
fi
unset color_prompt

if [ -f $HOME/.bash_local ]; then source $HOME/.bash_local; fi

