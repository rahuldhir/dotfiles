local utils = require 'utils'

-- Leader
vim.g.mapleader = ' '

-- Quick Quit
utils.nnoremap('qq', ':q<CR>')

-- Map escape from terminal input to Normal mode
utils.tnoremap('<ESC>', [[<C-\><C-n>]])
utils.tnoremap('<C-[>', [[<C-\><C-n>]])

-- Copy/Paste from the system clipboard
utils.vnoremap('<leader>y', [["+y<CR>]])
utils.nnoremap('<leader>p', [["+p<CR>]])

-- File explorer
utils.nnoremap('<leader>ft', ':NvimTreeToggle<CR>')
utils.nnoremap('<Tab>', '<C-W>W')

-- Terminal
utils.nnoremap('<leader>t', ':split | resize 20 | terminal<CR>A')
utils.nnoremap('<leader>T', ':vsplit | terminal<CR>A')

-- Which Key
utils.nnoremap('<leader>', ':WhichKeyVisual "<Space>"<CR>')

-- Omnifunc
utils.inoremap('<C-Space>', '<C-x><C-o>')

-- Disable highlights
utils.nnoremap('<leader>sc', ':noh<CR>')

-- Completion window navigation
utils.inoremapexpr('<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"')
utils.inoremapexpr('<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"')

-- Buffer maps
utils.nnoremap('<leader>ba', [[<cmd>lua require'plugins.config.telescope'.buffers()<CR>]])
utils.nnoremap('<leader>bc', ':enew<CR>')
utils.nnoremap('<leader>bd', ':bp<BAR>sp<BAR>bn<BAR>bd<CR>')
utils.nnoremap('<C-l>',      ':bnext<CR>')
utils.nnoremap('<C-h>',      ':bprevious<CR>')

-- Reload config
utils.nnoremap('<leader>r', '<cmd>ConfigReload<CR>')

-- Telescope
utils.nnoremap('<leader>ff', [[<cmd>lua require'plugins.config.telescope'.find_files()<CR>]])
utils.nnoremap('<leader>fg', [[<cmd>lua require'plugins.config.telescope'.live_grep()<CR>]])
utils.nnoremap('<leader>fb', [[<cmd>lua require'plugins.config.telescope'.buffers()<CR>]])
utils.nnoremap('<leader>fh', [[<cmd>lua require'plugins.config.telescope'.help_tags()<CR>]])

-- LSP
utils.nnoremap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
utils.nnoremap('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
utils.nnoremap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
utils.nnoremap('gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
utils.nnoremap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
