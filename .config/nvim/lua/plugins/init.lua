vim.cmd 'packadd packer.nvim'
local packer = require 'packer'

packer.init {
  package_root = '~/.local/share/nvim/site/pack',
  compile_path = '~/.config/nvim/plugin/packer_compiled.vim'
}

packer.startup(function()
  use { 'wbthomason/packer.nvim', opt = true }

  -- Theme
  use 'morhetz/gruvbox'

  -- Editor
  use 'SirVer/ultisnips'
  use 'Shougo/context_filetype.vim'

  -- Go
  use 'fatih/vim-go'

  -- File Explorer
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use { 'lewis6991/gitsigns.nvim', requires = {
    { 'nvim-lua/plenary.nvim' }
  }}

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'nvim-lua/lsp-status.nvim'
  use { 'nvim-telescope/telescope.nvim', requires = {
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' }
  }}

  -- Tree Sitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)

-- Plugin Configs
local current_path = (...):gsub('%.init$', '')
require(current_path .. '.config.nvim-tree')
require(current_path .. '.config.treesitter')
require(current_path .. '.config.telescope')
require(current_path .. '.config.gitsigns')
