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
utils.inoremap('<Tab>', 'vim.fn.pumvisible() ? "<C-n>" : "<Tab>"')
utils.inoremap('<S-Tab>', 'vim.fn.pumvisible() ? "<C-p>" : "<S-Tab>"')

-- Buffer maps
utils.nnoremap('<leader>ba', [[<cmd>lua require'plugins.config.telescope'.buffers()<CR>]])
utils.nnoremap('<leader>bc', ':enew<CR>')
utils.nnoremap('<leader>bd', ':bp<BAR>sp<BAR>bn<BAR>bd<CR>')
utils.nnoremap('<C-l>',      ':bnext<CR>')
utils.nnoremap('<C-h>',      ':bprevious<CR>')

-- Reload config
utils.nnoremap('<leader>r', '<cmd>ConfigReload<CR>')

-- Telescope
utils.nnoremap('<leader>ff', [[<cmd>lua require'telescope.builtin'.find_files()<CR>]])
utils.nnoremap('<leader>fg', [[<cmd>lua require'plugins.config.telescope'.live_grep()<CR>]])
utils.nnoremap('<leader>fb', [[<cmd>lua require'plugins.config.telescope'.buffers()<CR>]])
utils.nnoremap('<leader>fh', [[<cmd>lua require'plugins.config.telescope'.help_tags()<CR>]])

-- LSP
utils.nnoremap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
utils.nnoremap('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
utils.nnoremap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
utils.nnoremap('gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
utils.nnoremap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
utils.nnoremap('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
utils.nnoremap('<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
utils.nnoremap('<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
utils.nnoremap('<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
utils.nnoremap('<leader>D', '<cmd>lua vim.lsp.buf.declaration()<CR>')
utils.nnoremap('<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
utils.nnoremap('<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
utils.nnoremap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
utils.nnoremap('[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
utils.nnoremap(']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
