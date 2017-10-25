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
alias git=hub || git  # fall back if hub is not installed

function prune_remote {
    git checkout master
    git fetch origin
    git remote prune origin
    git branch -r --merged | grep origin | grep -v master | sed "s/origin\/\(.*\)/\1/" | xargs -n 1 git push origin --delete
    git remote prune origin
}
