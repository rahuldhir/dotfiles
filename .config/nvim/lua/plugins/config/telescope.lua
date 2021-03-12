local telescope = require 'telescope'
local telescope_builtin = require 'telescope.builtin'
local telescope_actions = require 'telescope.actions'
local M = {}

telescope.setup {
  defaults = {
    layout_strategy = 'flex',
    use_less = false,
    mappings = {
      i = {
        ['<C-k>'] = telescope_actions.move_selection_previous,
        ['<C-j>'] = telescope_actions.move_selection_next
      }
    }
  }
}
telescope.load_extension('fzy_native')
telescope.load_extension('gh')
telescope.load_extension('packer')
telescope.load_extension('project')

function M.live_grep()
  telescope_builtin.live_grep {}
end

function M.buffers()
  telescope_builtin.buffers {}
end

return M
