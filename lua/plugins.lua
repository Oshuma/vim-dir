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

-- TODO: This endless hash shit is getting stupid; extract it out.
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
      "rcarriga/nvim-notify",
      config = function()
        require("notify").setup({
          timeout = 1000,
          render = "compact",
          stages = "static",
        })
      end
    },
    {
      "folke/noice.nvim",
      event = "VeryLazy",
      dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
      },
      config = function()
        require("noice").setup({
          lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
              ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
              ["vim.lsp.util.stylize_markdown"] = true,
              -- ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
            },
          },
          presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = false, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false, -- add a border to hover docs and signature help
          },
          -- messages = {
          --   enabled = false,
          -- },
        })
      end
    },
    {
      "jackMort/ChatGPT.nvim",
      event = "VeryLazy",
      config = function()
        require("chatgpt").setup({
          api_key_cmd = 'bw get notes NVIM_OPENAPI_KEY',
        })
      end,
      dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim",
        "nvim-telescope/telescope.nvim"
      }
    },
}, {}) -- opts 2nd arg

-- Check for BW_SESSION environment variable.
local function checkBWSession()
  local bwSession = os.getenv("BW_SESSION")
  if bwSession == nil then
    require("notify")("BW_SESSION environment variable is not set. Bitwarden CLI may not work properly.", "error")
  end
end
checkBWSession()
