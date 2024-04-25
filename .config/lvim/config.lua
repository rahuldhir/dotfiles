lvim.colorscheme = "gruvbox-material"
lvim.format_on_save = true

lvim.builtin.alpha.dashboard.section.header.val = function() return "\"Vim\"" end
lvim.builtin.alpha.dashboard.section.footer.val = function() return "" end
lvim.builtin.project.patterns = { ".git" }

require("lvim.lsp.null-ls.formatters").setup({ { exe = "goimports", filetypes = { "go" } } })
require("lvim.lsp.null-ls.linters").setup({ { command = "golangci-lint", filetypes = { "go" } } })

vim.o.cmdheight = 0

-- Copilot plugins are defined below:
lvim.plugins = {
  { "sainnhe/gruvbox-material" },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<c-l>",
            next = "<c-j>",
            prev = "<c-k>",
            dismiss = "<c-h>",
          },
        },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup({
        suggestion = { enabled = true },
        panel = { enabled = true },
      })
    end
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function() require('symbols-outline').setup() end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      popupmenu = { enabled = false },
      notify = { enabled = false }
    },
    dependencies = { "MunifTanjim/nui.nvim" }
  },
  { "apple/pkl-neovim" }
}

-- Below config is required to prevent copilot overriding Tab with a suggestion
-- when you're just trying to indent!
local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end
local on_tab = vim.schedule_wrap(function(fallback)
  local cmp = require("cmp")
  if cmp.visible() and has_words_before() then
    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
  else
    fallback()
  end
end)
lvim.builtin.cmp.mapping["<Tab>"] = on_tab
