" ALE linters + fixers
let g:ale_linters = {
\   'python': ['flake8'],
\   'sh': ['shellcheck'],
\}

let g:ale_fixers = {
\   'python': ['black'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
