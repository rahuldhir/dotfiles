lvim.colorscheme = "gruvbox-material"
lvim.format_on_save = true

lvim.builtin.alpha.dashboard.section.header.val = function() return "\"Vim\"" end
lvim.builtin.alpha.dashboard.section.footer.val = function() return "" end
lvim.builtin.project.patterns = { ".git" }

require("lvim.lsp.null-ls.formatters").setup({ { exe = "goimports", filetypes = { "go" } } })
require("lvim.lsp.null-ls.linters").setup({ { command = "golangci-lint", filetypes = { "go" } } })
require("lspconfig").gopls.setup({
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end
})

vim.o.cmdheight = 0
vim.o.laststatus = 3
vim.o.termguicolors = false

-- Copilot plugins are defined below:
lvim.plugins = {
  { "sainnhe/gruvbox-material" },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      -- add any opts here
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua",      -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
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
