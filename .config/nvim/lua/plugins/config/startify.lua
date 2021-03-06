vim.g.startify_change_to_vcs_root = true

-- Display build version in header
local version = string.match(vim.api.nvim_exec('version', true), 'NVIM (.*)\nBuild')
vim.g.startify_custom_header = "startify#pad(['Neovim " .. version .. "'])"

vim.g.startify_lists = {
    { type = 'dir',       header = {'   MRU '..vim.fn.getcwd()} },
    { type = 'files',     header = {'   MRU'} },
    { type = 'bookmarks', header = {'   Bookmarks'}      },
    { type = 'sessions',  header = {'   Sessions'}       },
    { type = 'commands',  header = {'   Commands'}       },
}

vim.g.startify_bookmarks = {
    '~/.config/',
}
