return {
  "folke/trouble.nvim",
  config = function()
    require("trouble").setup({
      -- auto_jump = true, -- move to item if there's only one
      focus = true, -- focus on open
      keys = {
        -- swap defaults
        ["<cr>"] = "jump_close",
        o = "jump",
      },
      modes = {
        symbols = {
          desc = "symbols in buffer",
          mode = "lsp_document_symbols",
          focus = true,
          win = { position = "left" },
        },

        -- fancy errors float
        -- diagnostics = {
        --   win = {
        --     type = "float",
        --     relative = "editor",
        --     border = "rounded",
        --     title = "Errors",
        --     title_pos = "center",
        --     size = { width = 0.5, height = 0.5 },
        --     zindex = 200,
        --   },
        -- },

        -- more mode configs
        -- lsp_references = {},
        -- lsp = {},
      },
    })
  end
}
