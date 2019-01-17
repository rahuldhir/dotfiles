" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'sebdah/vim-delve'
Plug 'fatih/vim-go'
let g:go_fmt_experimental = 1

" Initialize plugin system
call plug#end()

source ~/.vimrc
