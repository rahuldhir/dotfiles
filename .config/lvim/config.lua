lvim.colorscheme = "gruvbox-material"
lvim.plugins = {{"sainnhe/gruvbox-material"}}

require("lvim.lsp.null-ls.formatters").setup({
	{ exe = "goimports", filetypes = { "go" } },
})

vim.o.cmdheight=0
