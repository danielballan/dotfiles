# DON'T MODIFY THIS FILE
# Place new config in a separate file within ~/.bashrc.d/

# Import global definitions.
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# Source all files in ~/.bashrc.d/
for i in ~/.bashrc.d/* ; do
    if [ -r "$i" ]; then
        source $i
    fi
done
