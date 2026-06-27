# ----------------------------
# History
# ----------------------------

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS

# ----------------------------
# Completion
# ----------------------------

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ----------------------------
# Better navigation
# ----------------------------

eval "$(zoxide init zsh)"

# ----------------------------
# FZF
# ----------------------------

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# ----------------------------
# Aliases
# ----------------------------

alias ls='eza --icons'
alias ll='eza -lah --icons'
alias la='eza -a --icons'
alias lt='eza --tree --level=2'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias mkdir='mkdir -pv'

alias ports='ss -tuln'

alias weather='curl wttr.in'

alias myip='curl ifconfig.me'

alias cat='bat'
alias grep='rg'

alias cls='clear'
alias update='sudo pacman -Syu'

# ----------------------------
# Plugins
# ----------------------------

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ----------------------------
# Starship
# ----------------------------

eval "$(starship init zsh)"


















































