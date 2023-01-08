# export LANG="en_US.UTF-8"
# export LC_CTYPE=en.US.UTF-8

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin:/home/linuxbrew/.linuxbrew/bin"
alias ic="ibmcloud"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


source /Users/mg699v/.config/broot/launcher/bash/br

source /Users/garyguo/.config/broot/launcher/bash/br
