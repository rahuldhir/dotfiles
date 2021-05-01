local nvim_lsp = require('lspconfig')

-- map buffer local keybindings when the language server attaches
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Set some keybinds conditional on server capabilities
  local opts = { noremap=true, silent=true }
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    vim.api.nvim_exec([[
      augroup lsp_format_on_save
        autocmd! BufWrite <buffer> lua vim.lsp.buf.formatting()
      augroup END
    ]], false)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end
end

local servers = {
  "bashls",
  "gopls",
  "graphql",
  "jsonls",
  "pyls",
  "sumneko_lua",
  "terraformls",
  "tsserver",
  "vuels",
  "yamlls",
}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

nvim_lsp.yamlls.setup{
  settings = {
    yaml = {
      schemas = { kubernetes = "globPattern" },
    }
  }
}
