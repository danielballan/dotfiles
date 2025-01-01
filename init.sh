# TODO Check that curl and git are installed, at a system level.
# mkdir -p ~/Repos/personal
# TODO Make this idempotent.
# git clone https://github.com/danielballan/dotfiles ~/Repos/personal/dotfiles
# curl -fsSL https://pixi.sh/install.sh | bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c 'PlugInstall | quitall'
