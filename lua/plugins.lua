--
-- Plugins
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
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
  },
  rocks = { enabled = false }, -- no plugins need luarocks
})
