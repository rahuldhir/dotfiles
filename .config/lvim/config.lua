lvim.colorscheme = "gruvbox-material"
lvim.plugins = { { "sainnhe/gruvbox-material" } }
lvim.format_on_save = true

require("lvim.lsp.null-ls.formatters").setup({
  { exe = "goimports", filetypes = { "go" } },
})

require("lvim.lsp.null-ls.linters").setup({
  { command = "golangci-lint", filetypes = { "go" } },
})

vim.o.cmdheight = 0
