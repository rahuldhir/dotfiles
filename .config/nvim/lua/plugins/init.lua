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

  -- Tab Bar
  use {'romgrk/barbar.nvim', requires = {
    { 'kyazdani42/nvim-web-devicons' },
  }}

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/lsp-status.nvim'
  use 'nvim-lua/completion-nvim'

  -- Tree Sitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/completion-treesitter' }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', requires = {
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzy-native.nvim' },
    { 'nvim-telescope/telescope-github.nvim' },
    { 'nvim-telescope/telescope-packer.nvim' },
    { 'nvim-telescope/telescope-project.nvim' },
  }}

  -- File Explorer
  use { 'kyazdani42/nvim-tree.lua', requires = {
    { 'kyazdani42/nvim-web-devicons' },
  }}
  use { 'lewis6991/gitsigns.nvim', requires = {
    { 'nvim-lua/plenary.nvim' },
  }}
end)

-- Plugin Configs
local current_path = (...):gsub('%.init$', '')
require(current_path .. '.config.gitsigns')
require(current_path .. '.config.nvim-lspconfig')
require(current_path .. '.config.nvim-tree')
require(current_path .. '.config.telescope')
require(current_path .. '.config.treesitter')
