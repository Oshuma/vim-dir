local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
}, {}) -- opts 2nd arg


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

vim.opt.statusline = "%F%m%r%h%w [FORMAT=%{&ff}] [TYPE=%Y] [POS=%04l,%04v][%p%%] [LINES=%L]"


--
-- Keybinds
--
function keybind(mode, shortcut, cmd)
  vim.api.nvim_set_keymap(mode, shortcut, cmd, { noremap = true, silent = true })
end

-- Swap the 'go to mark' cursor/column keys.
keybind("n", "'", "`")
keybind("n", "`", "'")

keybind("n", "<Leader>s", ":w<CR>")
keybind("n", "<Leader>S", ":wa<CR>")

keybind("n", "<Leader>t", ":Telescope find_files<CR>")
