-- Yank highlight
vim.cmd 'augroup yank_hl'
vim.cmd 'au!'
vim.cmd 'au TextYankPost * silent! lua vim.highlight.on_yank({ higroup = "Search", timeout = 500 })'
vim.cmd 'augroup end'

-- Statusline/Tabline highlights
vim.cmd 'augroup statusline_tabline_hl'
vim.cmd 'au!'
vim.cmd 'au ColorScheme * lua require"statusline".set_highlights()'
vim.cmd 'au ColorScheme * lua require"tabline".set_highlights()'
vim.cmd 'augroup end'

-- Statusline
vim.cmd 'augroup statusline_local'
vim.cmd 'au!'
vim.cmd 'au WinEnter * lua require"statusline".setlocal_active_statusline()'
vim.cmd 'au WinLeave * lua require"statusline".setlocal_inactive_statusline()'
vim.cmd 'augroup end'

 -- Enable invisible chars
vim.cmd 'augroup disable_char_list'
vim.cmd 'au!'
vim.cmd 'au FileType help setlocal nolist'
vim.cmd 'au FileType TelescopePrompt setlocal nolist'
vim.cmd 'augroup end'

-- lua 2 space indent
vim.cmd 'augroup lua_indent'
vim.cmd 'au!'
vim.cmd 'au FileType lua setlocal tabstop=2'
vim.cmd 'augroup end'

-- completion in all buffers
vim.cmd 'augroup completion'
vim.cmd 'au!'
vim.cmd 'au BufEnter * lua require"completion".on_attach()'
vim.cmd 'augroup end'

-- goimports on save
vim.cmd 'augroup go_imports'
vim.cmd 'au!'
vim.cmd 'au BufWritePre *.go lua goimports(5000)'
vim.cmd 'augroup end'

-- really exit terminal on <C-d>
vim.cmd 'augroup really_exit_terminal'
vim.cmd 'au!'
vim.cmd 'au TermClose * call feedkeys("i")'
vim.cmd 'augroup end'

--- Auto-reload files
vim.cmd 'augroup autoread'
vim.cmd 'au!'
vim.cmd 'au FocusGained,BufEnter,CursorHold,CursorHoldI * checktime'
vim.cmd 'au FileChangedShellPost * echohl InfoMsg | echo "File changed on disk. Buffer reloaded." | echohl None'
vim.cmd 'augroup end'

function goimports(timeoutms)
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, "t", true } }

  local params = vim.lsp.util.make_range_params()
  params.context = context

  -- See the implementation of the textDocument/codeAction callback
  -- (lua/vim/lsp/handler.lua) for how to do this properly.
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  if not result or next(result) == nil then return end
  local actions = result[1].result
  if not actions then return end
  local action = actions[1]

  -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
  -- is a CodeAction, it can have either an edit, a command or both. Edits
  -- should be executed first.
  if action.edit or type(action.command) == "table" then
    if action.edit then
      vim.lsp.util.apply_workspace_edit(action.edit)
    end
    if type(action.command) == "table" then
      vim.lsp.buf.execute_command(action.command)
    end
  else
    vim.lsp.buf.execute_command(action)
  end
end
