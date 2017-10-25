# Do not add conda to PATH by default because it can cause problems.
# Use this function instead.
function condame {
    echo Adding conda to \$PATH....
    export PATH=~/miniconda3/bin:$PATH
    source activate dd
}

# GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
source ~/.bash-git-prompt/gitprompt.sh

# git auto-completion
# https://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks#Auto-Completion
source ~/.git-completion.bash

# aliases
alias ll='ls -alF'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
