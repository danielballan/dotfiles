# DON'T MODIFY THIS FILE
# Place new config in a separate file within ~/.bashrc.d/

# Import global definitions.
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# Source all files in ~/.bashrc.d/
for i in $(ls ~/.bashrc.d/ | sort); do
    if [ -r ~/.bashrc.d/"$i" ]; then
        source ~/.bashrc.d/"$i"
    fi
done
