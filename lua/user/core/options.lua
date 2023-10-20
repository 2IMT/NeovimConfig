vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.wrap = false
vim.opt.history = 1000
vim.opt.termguicolors = true
vim.opt.mouse = nil
vim.opt.cursorline = true
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages," ..
                             "winsize,winpos,terminal,localoptions"
vim.opt.laststatus = 3

vim.api.nvim_set_option("clipboard", "unnamedplus")
