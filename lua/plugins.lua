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

    require('plugins/nvim-treesitter'),
    require('plugins/lualine'),
    require('plugins/dracula'),
    require('plugins/nvim-tree'),
    require('plugins/telescope'),
    require('plugins/comment'),
    require('plugins/nvim-surround'),
    require('plugins/nvim-notify'),
    require('plugins/trouble'),
}, {}) -- opts 2nd arg
