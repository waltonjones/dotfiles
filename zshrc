# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="walton"

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=7

# Uncomment to disable the confirmation prompt for auto-updates
DISABLE_UPDATE_PROMPT="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Customize to your needs...
export PATH=/usr/local/bin:$HOME/anaconda/bin:$HOME/envs/py2/bin:/usr/local/sbin:/usr/bin:$HOME/bin:/usr/sbin:/sbin:/opt/X11/bin:$HOME/bin:$HOME/scripts:$HOME/node_modules/less/bin:$PATH

alias v='f -e vim'; # quick opening files with vim
export EDITOR='subl -w'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias ..='cd ..'; 
alias ...='cd ../../'; 
alias ....='cd ../../../'; 
alias .....='cd ../../../../';
autoload -U compinit && compinit;
eval "$(fasd --init posix-alias zsh-hook)"
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
