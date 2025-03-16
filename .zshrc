[[ -n $TMUX ]] && export TERM="xterm-256color"
## menu-style
zstyle ':completion:*' menu select
autoload -Uz compinit && compinit
zstyle ':completion:*' special-dirs true
# case insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Tab completion colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# add new installed packages into completions
zstyle ':completion:*' rehash true
# Use better completion for the kill command
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;34'
#zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
# use completion cache
zstyle ':completion::complete:*' use-cache true


bindkey '^[[Z' reverse-menu-complete
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

setopt PROMPT_PERCENT
setopt PROMPT_SUBST

source ~/antigen.zsh
#auto suggestions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle git
antigen apply
export PATH=$PATH:/home/thomas/.local/bin
eval "$(oh-my-posh init zsh --config ~/.themes/lambdageneration.omp.json)"

alias cat=bat
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias diff='colordiff'





