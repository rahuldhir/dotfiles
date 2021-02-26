local utils = require 'utils'

-- Leader
vim.g.mapleader = ' '

-- Map escape from terminal input to Normal mode
utils.tnoremap('<ESC>', [[<C-\><C-n>]])
utils.tnoremap('<C-[>', [[<C-\><C-n>]])

-- Copy/Paste from the system clipboard
utils.vnoremap('<C-i>', [["+y<CR>]])
utils.nnoremap('<C-o>', [["+p<CR>]])

-- File explorer
utils.nnoremap('<leader>ft', ':NvimTreeToggle<CR>')
utils.nnoremap('<Tab>', '<C-W>W')

-- Terminal
utils.nnoremap('<leader>\'', ':terminal<CR>A')

-- Omnifunc
utils.inoremap('<C-Space>', '<C-x><C-o>')

-- Disable highlights
utils.nnoremap('<leader>sc', ':noh<CR>')

-- Buffer maps
-- -----------
-- List all buffers
utils.nnoremap('<leader>ba', ':buffers<CR>')
utils.nnoremap('<leader>bn', ':enew<CR>')
utils.nnoremap('<C-l>',      ':bnext<CR>')
utils.nnoremap('<C-h>',      ':bprevious<CR>')
utils.nnoremap('<leader>bd', ':bp<BAR>sp<BAR>bn<BAR>bd<CR>')

-- Resize window panes, we can use those arrow keys
-- to help use resize windows - at least we give them some purpose
utils.nnoremap('<up>',    ':resize +2<CR>')
utils.nnoremap('<down>',  ':resize -2<CR>')
utils.nnoremap('<left>',  ':vertical resize -2<CR>')
utils.nnoremap('<right>', ':vertical resize +2<CR>')

-- Text maps
-- ---------
-- Move a line of text Alt+[j/k]
utils.nnoremap('<M-j>', [[mz:m+<CR>`z]])
utils.nnoremap('<M-k>', [[mz:m-2<CR>`z]])
utils.vnoremap('<M-j>', [[:m'>+<CR>`<my`>mzgv`yo`z]])
utils.vnoremap('<M-k>', [[:m'<-2<CR>`>my`<mzgv`yo`z]])

-- Reload file
utils.nnoremap('<leader>r', ':e!<CR>')

-- Reload config
utils.nnoremap('<leader>vs', '<cmd>ConfigReload<CR><cmd>noh<CR><cmd>EditorConfigReload<CR>')

-- Telesccpe
utils.nnoremap('<leader>ff', [[<cmd>lua require'plugins.config.telescope'.find_files()<CR>]])
utils.nnoremap('<leader>fg', [[<cmd>lua require'plugins.config.telescope'.live_grep()<CR>]])
utils.nnoremap('<leader>fb', [[<cmd>lua require'plugins.config.telescope'.buffers()<CR>]])
utils.nnoremap('<leader>fh', [[<cmd>lua require'plugins.config.telescope'.help_tags()<CR>]])

-- LSP
utils.nnoremap('<leader>lm', '<cmd>lua vim.lsp.diagnostic.code_action()<CR>')
utils.nnoremap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
utils.nnoremap('<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
utils.nnoremap('K', '<cmd>lua vim.lsp.buf.references()<CR>')
utils.nnoremap('<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>')
utils.nnoremap('<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>')
utils.nnoremap('<leader>le', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
utils.nnoremap('<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>')
