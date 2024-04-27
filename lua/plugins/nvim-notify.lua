return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      timeout = 1000,
      render = "compact",
      stages = "static",
    })
  end
}
