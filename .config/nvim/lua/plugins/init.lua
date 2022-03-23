local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

local packer = require 'packer'

packer.startup {
  function(use)
    use { 'wbthomason/packer.nvim'}

    -- Theme
    use { 'npxbr/gruvbox.nvim', requires = {
        { 'rktjmp/lush.nvim' },
      },
    }
    use { 'mhinz/vim-startify' }

    -- Tab Line
    use { 'romgrk/barbar.nvim', requires = {
        { 'kyazdani42/nvim-web-devicons' },
      },
    }

    -- LSP
    use { 'neovim/nvim-lspconfig' }
    use { 'nvim-lua/lsp-status.nvim' }
    use { 'nvim-lua/completion-nvim' }

    -- Tree Sitter
    use { 'nvim-treesitter/completion-treesitter' }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }
    use { 'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      ensure_installed = 'all',
      highlight = {enable = true, disable = {}},
      indent = {enable = true},
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gnn',
          node_incremental = 'grn',
          scope_incremental = 'grc',
          node_decremental = 'grm',
        },
      },
    }

    -- Telescope
    use { 'nvim-telescope/telescope.nvim', requires = {
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzy-native.nvim' },
        { 'nvim-telescope/telescope-github.nvim' },
        { 'nvim-telescope/telescope-project.nvim' },
      },
    }

    -- File Explorer
    use { 'kyazdani42/nvim-tree.lua', requires = {
        { 'kyazdani42/nvim-web-devicons' },
      },
    }
    use { 'lewis6991/gitsigns.nvim', requires = {
        { 'nvim-lua/plenary.nvim' },
      },
    }

    use { 'godlygeek/tabular' }
  end,
  config = {
    package_root = '~/.local/share/nvim/site/pack',
    compile_path = '~/.config/nvim/plugin/packer_compiled.vim'
  }
}

-- Plugin Configs
local current_path = (...):gsub('%.init$', '')
require(current_path .. '.config.gitsigns')
require(current_path .. '.config.nvim-lspconfig')
require(current_path .. '.config.nvim-tree')
require(current_path .. '.config.startify')
require(current_path .. '.config.telescope')
