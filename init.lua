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
    'nvim-treesitter/nvim-treesitter',
    'fatih/vim-go',
    'nvim-tree/nvim-web-devicons',
    {
      'Mofiqul/dracula.nvim',
      lazy = false,
      priority = 1000,
      config = function()
        local dracula = require "dracula"

        dracula.setup({
          transparent = true,
          plugins = {
            ["nvim-treesitter"] = true,
            ["nvim-lspconfig"] = true,
            ["nvim-tree.lua"] = true,
            ["lazy.nvim"] = true,
            ["telescope.nvim"] = true,
          },
        })
        vim.cmd.colorscheme 'dracula'
        -- vim.cmd.colorscheme 'dracula-soft'
      end
    },
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("nvim-tree").setup({
          hijack_cursor = true,
          reload_on_bufenter = true,
          actions = {
            open_file = {
              quit_on_open = true,
            },
          },
          diagnostics = {
            enable = true,
            show_on_dirs = true,
          },
        })
      end,
    },
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
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
    {
      'numToStr/Comment.nvim',
      lazy = false,
    },
    {
      "rest-nvim/rest.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("rest-nvim").setup({
          --- Get the same options from Packer setup
        })
      end
    },
}, {}) -- opts 2nd arg

require('Comment').setup()
require('nvim-treesitter.configs').setup({
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "go", "ruby", "html", "http", "json", "python" },
})


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

-- Disable netrw, so it doesn't fuck with nvim-tree
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1


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
keybind("n", "<Leader>q", ":q<CR>")

keybind("n", "<C-t>", ":tabnew<CR>")
keybind("n", "<C-h>", ":tabprev<CR>")
keybind("n", "<C-l>", ":tabnext<CR>")

keybind("t", "<Esc>", [[<C-\><C-n>]])

keybind("n", "<Leader>t", ":Telescope find_files<CR>")
keybind("n", "<Leader>f", ":NvimTreeToggle<CR>")
keybind("n", "<Leader>g", ":Outline<CR>")

keybind("n", "<Leader>r", "<Plug>RestNvim")

--
-- Language Servers
--
local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup({})
lspconfig.gopls.setup({})
lspconfig.pyright.setup({})

vim.keymap.set("n", "<Leader>h", vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
