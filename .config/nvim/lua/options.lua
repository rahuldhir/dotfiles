vim.cmd 'filetype plugin indent on'

-- Display
vim.cmd 'syntax on'
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.cmd 'colorscheme gruvbox'

-- Completion options
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.shortmess = vim.o.shortmess .. 'c'

-- Search options
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrapscan = true

-- Indent options
vim.o.tabstop = 4
vim.o.shiftwidth = 0
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true

-- Line options
vim.o.showmatch = true
-- vim.o.showbreak = '+++'
vim.o.textwidth = 120
vim.o.scrolloff = 5
vim.wo.linebreak = true
-- vim.wo.colorcolumn = '120'

-- No backups or swapfiles needed
vim.o.dir = os.getenv('HOME') .. '/.cache/nvim'
vim.o.backup = true
vim.o.backupdir = os.getenv('HOME') .. '/.cache/nvim'
vim.o.undofile = true
vim.o.undodir = os.getenv('HOME') .. '/.cache/nvim'
vim.o.undolevels = 1000
vim.o.history = 1000

-- Lazy redraw
vim.o.lazyredraw = true

-- Buffers/Tabs/Windows
vim.o.hidden = true

-- update time to 300ms
vim.o.updatetime = 300

-- Set spelling
vim.o.spell = false

-- For git
vim.wo.signcolumn = 'yes'

-- Mouse support
vim.o.mouse = 'a'

-- backspace behaviour
vim.o.backspace = 'indent,eol,start'

-- Status line
vim.o.showmode = false
vim.o.laststatus = 2
vim.o.statusline = require 'statusline'.get_statusline()

-- Tab line
vim.o.showtabline = 2
vim.o.tabline = require 'tabline'.get_tabline()

-- Auto reload file if changed outside vim, or just :e!
vim.o.autoread = true

-- Invisible chars list
vim.wo.list = true
vim.o.listchars = [[tab:| ,trail:·]]

-- Omnifunc
vim.o.omnifunc = 'v:lua.vim.lsp.omnifunc'
