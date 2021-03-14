local version = string.match(vim.api.nvim_exec('version', true), 'NVIM (.*)\nBuild')
vim.g.startify_custom_header = "startify#pad(['Neovim " .. version .. "'])"
