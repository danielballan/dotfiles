# DON'T MODIFY THIS FILE
# Place new config in a separate file within ~/.bashrc.d/

# Source all files in ~/.bashrc.d/
for i in ~/.bashrc.d/* ; do
    if [ -r "$i" ]; then
        source $i
    fi
done

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/home/dallan/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/dallan/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
