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


--
-- Folding
--
vim.o.foldcolumn = '0' -- '0' disables fold column
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
