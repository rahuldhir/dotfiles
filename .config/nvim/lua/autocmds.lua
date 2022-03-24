-- Yank highlight
vim.cmd 'augroup yank_hl'
vim.cmd 'au!'
vim.cmd 'au TextYankPost * silent! lua vim.highlight.on_yank({ higroup = "Search", timeout = 500 })'
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

-- yaml 2 space indent
vim.cmd 'augroup lua_indent'
vim.cmd 'au!'
vim.cmd 'au FileType yaml setlocal tabstop=2'
vim.cmd 'augroup end'

-- completion in all buffers
vim.cmd 'augroup completion'
vim.cmd 'au!'
vim.cmd 'au BufEnter * :COQnow --shut-up'
vim.cmd 'augroup end'

-- goimports on save
vim.cmd 'augroup go_imports'
vim.cmd 'au!'
vim.cmd 'au BufWritePre *.go :silent! lua vim.lsp.buf.formatting()'
vim.cmd 'au BufWritePre *.go :silent! lua Goimports(5000)'
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

function Goimports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = {only = {"source.organizeImports"}}
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end
