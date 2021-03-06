# Do not add conda to PATH by default because it can cause problems.
# Use this function instead.
function condame {
    echo Adding conda to \$PATH....
    export PATH=~/miniconda3/bin:$PATH
    source activate py38
}

# GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
source ~/.bash-git-prompt/prompt-colors.sh
GIT_PROMPT_START="_LAST_COMMAND_INDICATOR_ ${White}\u@\h ${Yellow}\w${ResetColor}"
source ~/.bash-git-prompt/gitprompt.sh

# git auto-completion
# https://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks#Auto-Completion
source ~/.git-completion.bash

# aliases
alias ll='ls -alF'

# Use GitHub's extension of the git CLI if it is installed.
if [ `which hub` ]
then
    alias git=hub
fi

function prune_remote {
    git checkout master
    git fetch danielballan
    git remote prune danielballan
    git branch -r --merged | grep danielballan | grep -v master | sed "s/danielballan\/\(.*\)/\1/" | xargs -n 1 git push danielballan --delete
    git remote prune danielballan
}

# To install fzf:
# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# ~/.fzf/install
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Check what is using the OSX webcam.
function whosgotthecamera {
    lsof | grep -i VDC
}

export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
