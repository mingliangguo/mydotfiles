# set term color
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="afowler"
#

# The following two lines are only required by certain themes, e.g. pure or pygmalion
# prompt_context () { }
# DEFAULT_USER="gary"

# unset nomatch otherwise rake task can not take parameters
unsetopt nomatch

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode colorize github vagrant mvn gradle autojump node npm yarn pip python ruby rvm tmux zsh-syntax-highlighting zsh-autosuggestions ssh-agent)

zstyle :omz:plugins:ssh-agent identities id_rsa

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# enable gradle auto-completion.
# zstyle ':completion:*' use-cache on
#
# # Default is `"/(build|integTest|out)/"`
# export GRADLE_COMPLETION_EXCLUDE_PATTERN="/(build|integTest|samples|smokeTest|testFixtures|templates|out|features)/"
# # Essentially turn off checking for changed scripts
# export GRADLE_COMPLETION_EXCLUDE_PATTERN="gradle"

# fpath=(/Users/gary/.zsh/gradle-completion $fpath)

[ -f '/home/linuxbrew/.linuxbrew/bin/brew' ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.myprofile ] && source ~/.myprofile

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

