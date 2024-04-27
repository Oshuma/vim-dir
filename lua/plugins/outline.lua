return {
  "hedyhli/outline.nvim",
  config = function()
    require("outline").setup({
      outline_window = {
        position = 'left',
        auto_close = true,
      }
    })
  end,
}
