return {
  'Mofiqul/dracula.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    local dracula = require "dracula"

    dracula.setup({
      transparent_bg = true,
    })
    vim.cmd.colorscheme 'dracula'
    -- vim.cmd.colorscheme 'dracula-soft'
  end
}
