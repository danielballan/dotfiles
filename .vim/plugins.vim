" Inspired by https://github.com/klauer/dotfiles/

let bundle_path=config_path . "/plugged"
call plug#begin(bundle_path)
call plug#begin()

" Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}

Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'

" Toggle comment/uncommenting code with motion 'gc'.
Plug 'tpope/vim-commentary'

" Change/yank/delete surrounding parens/brackets/quotes/tags
" with motion 'cs' (change surroundings), 'ys' (yank), 'ds' (delete).
Plug 'tpope/vim-surround'

" unimpaired - mappings for [ and ]
"              such as buffer, args, quickfix, loc, tags (b, a, q, l, t)
Plug 'tpope/vim-unimpaired'

" Display code context.
Plug 'wellle/context.vim'

" -- git
"
" git wrapper fugitive
Plug 'tpope/vim-fugitive'

" enable Gbrowse
Plug 'tpope/vim-rhubarb'

" Signs for added/changed/removed lines
Plug 'lewis6991/gitsigns.nvim'

" colors
Plug 'NLKNguyen/papercolor-theme'

" Execute Python snippets in Markdown
Plug 'dbridges/vim-markdown-runner'

" linters and fixers
Plug 'dense-analysis/ale'

Plug 'sbdchd/neoformat'

" AI?!
" Plug 'madox2/vim-ai'

call plug#end()
