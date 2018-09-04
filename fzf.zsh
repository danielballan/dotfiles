# Setup fzf
# ---------
if [[ ! "$PATH" == */home/dallan/.fzf/bin* ]]; then
  export PATH="$PATH:/home/dallan/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/dallan/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/dallan/.fzf/shell/key-bindings.zsh"

