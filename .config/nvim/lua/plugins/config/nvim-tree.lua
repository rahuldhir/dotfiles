-- refresh tree to avoid empty buffer when lazy loading
require'nvim-tree.events'.on_nvim_tree_ready(function ()
  vim.cmd("NvimTreeRefresh")
end)

local function get_lua_cb(cb_name)
  return string.format(":lua require'nvim-tree'.on_keypress('%s')<CR>", cb_name)
end

-- https://github.com/kyazdani42/nvim-tree.lua/blob/905afba20900caea1e6f0f541c2ed7302de9f598/lua/nvim-tree/config.lua#L61-L85
vim.g.nvim_tree_width = 40
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_width_allow_resize = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_bindings = {
  ["<Tab>"] = "<C-W>W",
  ["."] = "H",
  ["l"] = ":lua require'nvim-tree'.on_keypress('edit')<CR>",
  ["h"] = ":lua require'nvim-tree'.on_keypress('close_node')<CR>",
}
