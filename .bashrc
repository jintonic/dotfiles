# ~/.bashrc: executed for non-login shells.
umask 022

# If not running interactively, just export PATH
PATH=.:$HOME/bin:/usr/sbin:$PATH
[ -z "$PS1" ] && return

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

if [ "$color_prompt" = yes ]; then
  PS1="${green}\u@\h:${blue}\w\n${magenta}[\!]${PLAIN} "
else
  PS1='\u@\h:\w\n[\!] '
fi
unset color_prompt

# set screen titles automatically
case "$TERM" in
  screen)
    PROMPT_COMMAND='echo -n -e "\033k\033\\"'
    ;;
  *)
    ;;
esac

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

alias sb='screen -X hardstatus alwayslastline "%{= Bk}%H | %-w%{= kB}%n*%t %{-}%+w %= %M %d %D %C %A"'
alias sd='screen -D -RR'
alias sl='screen -list'
alias sw='screen -wipe'
alias sn='screen -X deflogin off'
alias ss='screen -X source ~/.screenrc'
# https://x.cygwin.com/docs/ug/using-remote-apps.html#using-remote-apps-ssh
if [ The${OS} = TheWindows_NT ]; then export DISPLAY=:0.0; fi
# refresh display setting for old screen session
if [ ${#STY} -gt 0 ] && [ ${#SSH_TTY} -gt 0 ]; then
  export DISPLAY=`cat ~/.display`
else
  echo $DISPLAY > ~/.display
fi
# https://superuser.com/questions/1195962/cannot-make-directory-var-run-screen-permission-denied
export SCREENDIR=$HOME/.screen

alias mdp='TERM=xterm-256color mdp'
alias ev='emacs -nw'
alias vi='vim -X'

alias r='root -l'
alias rbq='root -b -q'

alias news='newsbeuter -q'

export GS_OPTIONS="-dSAFER -dBATCH -dNOPAUSE -sDEVICE=pdfwrite"
export WWW_HOME=~/.w3m/bookmark.html

export LC_ALL="en_US.UTF-8"

export TEXMFHOME=~/.texmf
export TERMINFO=~/.terminfo

if [[ `uname` != "Darwin" ]]; then
  export LD_LIBRARY_PATH=$HOME/lib;
else
  export DYLD_LIBRARY_PATH=$HOME/lib;
fi

export PKG_CONFIG_PATH=~/lib/pkgconfig
export MANPATH=~/man:~/share/man:$MANPATH

export EDITOR=vim
export PAGER='less -r'

# https://wiki.vifm.info/index.php/How_to_set_shell_working_directory_after_leaving_Vifm
v() {
  local dst="$(command vifm . --choose-dir -)"
  if [ -d "$dst" ]; then cd "$dst"; fi
}
# https://github.com/dylanaraps/fff
f() {
  fff "$@"
  cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}
# https://github.com/gokcehan/lf/blob/master/etc/lfcd.sh
l() {
  lf -last-dir-path=$HOME/.local/share/lf/tmp "$@"
  cd "$(cat $HOME/.local/share/lf/tmp)"
}

# nice line drawing in putty 
# (https://superuser.com/questions/278286/making-256-color-and-line-drawing-characters-both-work-in-putty)
export NCURSES_NO_UTF8_ACS=1

# https://github.com/hpcng/singularity/issues/643
# configs above this block will be available in singularity containers
export APPTAINER_SHELL="/bin/bash"
# https://groups.google.com/a/lbl.gov/g/singularity/c/-lzLyY2VLKs
export APPTAINER_BINDPATH="/run:/run"
if [ X"$APPTAINER_NAME" != X ]; then return; fi

if [ -f $HOME/.bash_local ]; then source $HOME/.bash_local; fi

