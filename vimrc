" basic config
execute pathogen#infect()
syntax on
filetype plugin indent on

" spell check
set spellfile=~/.vim/spell/en.utf-8.add
set spelllang=en

" All of this is from http://stackoverflow.com/a/12587335/1221924
set autoindent " always set autoindenting on"
set smartindent " use smart indent if there is no indent file"
set tabstop=4 " <tab> inserts 4 spaces"
set softtabstop=4 " <BS> over an autoindent deletes 4 spaces."
set smarttab " Handle tabs more intelligently"
set expandtab " Use spaces, not tabs, for autoindent/tab key."
set shiftwidth=4 " an indent level is 4 spaces wide."
set shiftround " rounds indent to a multiple of shiftwidth"

" color scheme from https://github.com/endel/vim-github-colorscheme
colorscheme github

" pydiction config
let g:pydiction_location = '/home/user/.vim/bundle/pydiction/complete-dict'

" autowrap markdown files
" https://robots.thoughtbot.com/wrap-existing-text-at-80-characters-in-vim
au BufRead,BufNewFile *.md setlocal textwidth=80

" keep the status bar even if there is only one pane
set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

:set textwidth=79
:set colorcolumn=+1

" fugitive options
:set diffopt+=vertical
