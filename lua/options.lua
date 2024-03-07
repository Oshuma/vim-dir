--
-- Vim options
--
vim.g.mapleader = ","

vim.opt.incsearch = false
vim.opt.mouse = c
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmatch = true
vim.opt.title = true
vim.opt.wrap = false

-- Disable netrw, so it doesn't fuck with nvim-tree
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
