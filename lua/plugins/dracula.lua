return {
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
}
