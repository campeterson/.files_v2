# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:$HOME/anaconda3/bin"

# Java11 first
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

# Add GraalVM
export PATH=/Library/Java/JavaVirtualMachines/graalvm-ce-java11-21.0.0.2/Contents/Home/bin:$PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/graalvm-ce-java11-21.0.0.2/Contents/Home

# Ad jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Vim iced
export PATH=$PATH:~/.vim/plugged/vim-iced/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Google Cloud CLI
# The next line enables shell command completion for gcloud.
if [ -f '$HOME/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/bin/google-cloud-sdk/completion.zsh.inc'; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/bin/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/bin/google-cloud-sdk/path.zsh.inc'; fi

# Initialize direnv https://direnv.net/
eval "$(direnv hook zsh)"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="random"
#ZSH_THEME="v2"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# https://github.com/ohmyzsh/ohmyzsh/wiki/Customization
ZSH_CUSTOM=~/.zsh_custom

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew git lein osx pip redis-cli tmux vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Custom aliases
alias bu="brew upgrade && brew cleanup"
alias er="espanso restart"
alias gs="git status"
alias ga="git add -p"
alias gps="git push"
alias gpl="git pull --rebase"
alias gprs="git pull --recurse-submodules"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias ll="ls -lah"
alias ta="tmux attach"
alias tn="tmux new-session"
alias tmata="tn -s brew -d && tn -s espanso -c ~/.files_v2/espanso/ -d && tn -s beeline -c ~/projects/Beehive/beehive-src -d && tn -s airdex-authority -c ~/projects/AirDEX/Authority/airdex-authority -d && tn -s airdex-data -c ~/projects/AirDEX/Data/airdex-data -d && tn -s AuthorityData -c ~/projects/AirDEX/airdex-authority-government-data -d && echo 'Tmux sessions created' && ta"

# Direnv - https://direnv.net/
eval "$(direnv hook zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/campeterson/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/campeterson/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/campeterson/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/campeterson/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export LOCAL_OP=true

# Doing this because of a bug: https://github.com/conda/conda/issues/9392
conda deactivate

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
