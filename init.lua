--
-- Plugins
--
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
    'neovim/nvim-lspconfig',
    {
      'nvim-telescope/telescope.nvim',
        dependencies = {
          'nvim-lua/plenary.nvim'
        },
    },
    {
      "hedyhli/outline.nvim",
      config = function()
        require("outline").setup({
          outline_window = {
            position = 'left',
            auto_close = true,
          }
        })
      end,
    },
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
keybind("n", "<Leader>g", ":Outline<CR>")


--
-- Language Servers
--
local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup({})

vim.keymap.set("n", "<Leader>h", vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
