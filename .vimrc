" allow backspacing over everything in insert mode
" let mapleader="\<Space>"               " prefix when using <leader> in map

set background=dark
set foldlevel=99
set foldmethod=indent
set guioptions=cmgtTr
set history=500                        " keep x lines of command line history
set novb                               " ** visual bell, no beeping! **
set belloff=all
set number                             " line numbering
set numberwidth=5
set ruler                              " show the cursor position all the time
set showcmd                            " display incomplete commands
set smartindent                        " smartindent when starting new line
set undofile
set undolevels=10000
set undoreload=20000
set wrap

if has('nvim')
    let g:config_path=$HOME . "/.config/nvim"
else
    let g:config_path=$HOME . "/.vim"
endif

" Use system Python, bypassing any currently-activated virtual environment.
let g:python3_host_prog = "/usr/bin/python"

" This defines SourceConfig, which we can use from here forward
" to source additional config files.
execute "source " . g:config_path . "/functions.vim"

call SourceConfig('plugins.vim')
call SourceConfig('static.vim')

filetype plugin indent on
syntax on

" Ctrl+p for file search.
nnoremap <c-p>     :exe 'Files ' . FzfFindRoot()<CR>
nnoremap <c-s-P>   :Files .<CR>
" Ctrl+h for file search sorted by recent or open buffers
nnoremap <c-h>     :History<CR>

" Carriage return is now colon
nnoremap <CR> :
vnoremap <CR> :

" Don't use Ex mode, use Q for formatting
map Q gq

nnoremap <Leader>G :BCommits<CR>
nnoremap <Leader>H :Helptags<CR>
nnoremap <Leader>T :BTags<CR>
nnoremap <Leader>b :Buffers<CR>

" vim-sideways moves through argments list and similar
nnoremap <Leader>h :SidewaysLeft<CR>
nnoremap <Leader>l :SidewaysRight<CR>

" Use \r to execute Markdown codeblock. \R inserts the output in the document.
autocmd FileType markdown nnoremap <buffer> <Leader>r :MarkdownRunner<CR>
autocmd FileType markdown nnoremap <buffer> <Leader>R :MarkdownRunnerInsert<CR>

" Use \f to run fixers.
autocmd FileType python map <buffer> <Leader>f :ALEFix<CR>

colorscheme PaperColor

set spell

let g:vim_ai_token_file_path = '~/.config/openai.token'
