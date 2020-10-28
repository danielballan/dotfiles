# Setup fzf
# ---------
if [[ ! "$PATH" == */home/dallan/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/dallan/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/dallan/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/dallan/.fzf/shell/key-bindings.bash"
