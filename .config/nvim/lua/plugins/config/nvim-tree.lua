-- https://github.com/kyazdani42/nvim-tree.lua/blob/905afba20900caea1e6f0f541c2ed7302de9f598/lua/nvim-tree/config.lua#L61-L85
vim.g.nvim_tree_width = 40
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_width_allow_resize = 1
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_bindings = {
  ["p"] = "<Tab>",
  ["<Tab>"] = "<C-W>W",
  ["h"] = "<BS>",
  ["."] = "H",
}
