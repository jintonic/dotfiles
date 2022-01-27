autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git

zstyle ':vcs_info:git:*' formats '%F{magenta}(%b)'
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

# enable substitution in prompt
setopt prompt_subst
NEWLINE=$'\n'
PROMPT='%F{blue}%n@%m:%~ ${vcs_info_msg_0_} [%?] ${NEWLINE}%F{50}'

