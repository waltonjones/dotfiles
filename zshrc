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

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# Customize to your needs...
export PATH=/usr/local/bin:$HOME/anaconda/bin:$HOME/envs/py2/bin:/usr/local/sbin:/usr/bin:$HOME/bin:/usr/sbin:/sbin:/opt/X11/bin:$HOME/bin:$HOME/scripts:$HOME/node_modules/less/bin:/usr/local/share/$PATH

# determines what type of archive you have (based on fiie extension) and
# executes the correct incantation to unarchive it.

# determines what type of archive you have (based on fiie extension) and
# executes the correct incantation to unarchive it.

function extract () {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)  tar -jxvf $1                       ;;
            *.tar.gz)   tar -zxvf $1                       ;;
            *.bz2)      bunzip2 $1                         ;;
            *.dmg)      hdiuti1 mount $1                   ;;
            *.gz)       gunzip $1                          ;;
            *.tar)      tar -xvf $1                        ;;
            *.tbz2)     tar -jxvf $1                       ;;
            *.tgz)      tar -zxvf $1                       ;;
            *.zip)      unzip $1                           ;;
            *.ZIP)      unzip $1                           ;;
            *.pax)      cat $1 | pax -r                    ;;
            *.pax.Z)    uncompress $1 --stdout | pax -r    ;;
            *.Z)        uncompress $1                      ;;
            *)          echo "'$1' cannot be extracted/mounted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

export PATH="$(brew --prefix josegonzalez/php/php55)/bin:$PATH"

alias v='f -e vim'; # quick opening files with vim
export EDITOR="subl -w";
alias edit="subl -w";
alias t=trash;
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim';
alias ..='cd ..'; 
alias ...='cd ../../'; 
alias ....='cd ../../../'; 
alias .....='cd ../../../../';
autoload -U compinit && compinit;
eval "$(fasd --init posix-alias zsh-hook)"
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
