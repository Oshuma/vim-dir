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
    'fatih/vim-go',
    'nvim-tree/nvim-web-devicons',
    {
      'nvim-treesitter/nvim-treesitter',
      config = function()
        require('nvim-treesitter.configs').setup({
          -- A list of parser names, or "all" (the five listed parsers should always be installed)
          ensure_installed = { "go", "ruby", "html", "http", "json", "python" },
        })
      end
    },
    {
      'nvim-lualine/lualine.nvim',
      config = function()
        require('lualine').setup()
      end
    },
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
      config = function()
        require('Comment').setup()
      end
    },
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
        })
      end
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
