vim.cmd 'command! Config edit $MYVIMRC'
vim.cmd [[command! ConfigReload lua require'utils'.reload_config()]]

-- sticky shift
vim.cmd 'command! -nargs=* W w'
vim.cmd 'command! -nargs=* Wq wq'
vim.cmd 'command! -nargs=* Q q'
vim.cmd 'command! -nargs=* Qa qa'
vim.cmd 'command! -nargs=* QA qa'
