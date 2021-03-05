vim.cmd 'packadd packer.nvim'
local packer = require 'packer'

packer.init {
  package_root = '~/.local/share/nvim/site/pack',
  compile_path = '~/.config/nvim/plugin/packer_compiled.vim'
}

packer.startup(function()
  use { 'wbthomason/packer.nvim', opt = true }

  -- Theme
  use {'npxbr/gruvbox.nvim', requires = {
    { 'rktjmp/lush.nvim' },
  }}

  -- File Explorer
  use { 'nvim-telescope/telescope.nvim', requires = {
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' }
  }}
  use { 'kyazdani42/nvim-tree.lua', requires = {
    { 'kyazdani42/nvim-web-devicons' }
  }}
  use { 'lewis6991/gitsigns.nvim', requires = {
    { 'nvim-lua/plenary.nvim' }
  }}

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'nvim-lua/lsp-status.nvim'

  -- Tree Sitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/completion-treesitter' }

  -- Other?
  use 'liuchengxu/vim-which-key'
  use 'SirVer/ultisnips'
  use 'Shougo/context_filetype.vim'
end)

-- Plugin Configs
local current_path = (...):gsub('%.init$', '')
require(current_path .. '.config.gitsigns')
require(current_path .. '.config.nvim-lspconfig')
require(current_path .. '.config.nvim-tree')
require(current_path .. '.config.telescope')
require(current_path .. '.config.treesitter')
