return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup({
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = { "go", "ruby", "html", "http", "json", "python", "markdown", "markdown_inline" },
    })
  end
}
