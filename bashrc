# Do not add conda to PATH by default because it can cause problems.
# Use this function instead.
function condame {
    echo Adding conda to \$PATH....
    export PATH=~/miniconda3/bin:$PATH
    source activate dd
}
# GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
source ~/.bash-git-prompt/gitprompt.sh

# aliases
alias ll='ls -alF'
