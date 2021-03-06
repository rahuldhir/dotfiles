local tree_cb = require'nvim-tree.config'.nvim_tree_callback

-- https://github.com/kyazdani42/nvim-tree.lua/blob/905afba20900caea1e6f0f541c2ed7302de9f598/lua/nvim-tree/config.lua#L61-L85
vim.g.nvim_tree_width = 40
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_width_allow_resize = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_bindings = {
  { key = "<Tab>", cb = "<C-W>W", },
  { key = ".",     cb = tree_cb("toggle_dotfiles"), },
  { key = "l",     cb = tree_cb("edit"), },
  { key = "h",     cb = tree_cb("close_node"), },
}
