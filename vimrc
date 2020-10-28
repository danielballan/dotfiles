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

set background=dark
colorscheme solarized8
let g:solarized_diffmode = "bold"

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

" from http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/

" short-cut for accessing parent tree in Gedit context
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
" auto-clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
" add git branch to status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


set rtp+=~/.fzf

fun! s:fzf_find_root()
    let s:top_marker_directories = ['.git', '.hg', 'configure']
    for marker_dir in s:top_marker_directories
        let path = finddir(marker_dir, expand("%:p:h").";")
        if path != ''
            return fnamemodify(substitute(path, marker_dir, "", ""), ":p:h")
        endif
    endfor
    return path
endfun

" fzf functionality like ctrl-p
nnoremap <c-p> :exe 'Files ' . <SID>fzf_find_root()<CR>
" show fzf list of tags
nnoremap <Leader>t :Tags<CR>
" show fzf list of tags in the buffer
nnoremap <Leader>T :BTags<CR>
" show fzf list of files in git repo
nnoremap <Leader>o :GitFiles<CR>
" show git commits in fzf window
nnoremap <Leader>g :Commits<CR>
" show git commits for current buffer in fzf window
nnoremap <Leader>G :BCommits<CR>
" colorscheme list
nnoremap <Leader>C :Colors<CR>
" help tags
nnoremap <Leader>H :Helptags<CR>
imap <C-[> <Esc>
