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
PROMPT='%F{cyan}[%y, return:%?, history:%h, level:%L, job:%j] %F{yellow}%D %t ${vcs_info_msg_0_}
%F{green}%n@%m:%F{blue}%~ %# %F{50}'

# alias {{{1
alias la='ls -A'
alias ll='ls -lh'
alias vi='vim -X'

# vim: fdm=marker:fen:fdl=0
