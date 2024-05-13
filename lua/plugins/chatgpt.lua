-- Check for BW_SESSION environment variable.
local function checkBWSession()
  local bwSession = os.getenv("BW_SESSION")
  if bwSession == nil then
    require("notify")("BW_SESSION environment variable is not set. Bitwarden CLI may not work properly.", "error")
  end
end

return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  config = function()
    checkBWSession()

    require("chatgpt").setup({
      api_key_cmd = 'bw get notes NVIM_OPENAPI_KEY',
      openai_params = {
        model = "gpt-4-turbo-preview",
      },
      openai_edit_params = {
        model = "gpt-4-turbo-preview",
      },
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim"
  }
}
