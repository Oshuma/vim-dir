return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false, -- the main branch doesn't support lazy-loading
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    -- Replaces `ensure_installed`
    ts.install({
      "go", "ruby", "python", "bash",
      "lua", "vim", "vimdoc",
      "html", "http", "json",
      "markdown", "markdown_inline"
    })

    -- Replaces `highlight = { enable = true }` and `indent = { enable = true }`
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        if pcall(vim.treesitter.start, args.buf) then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          -- optional treesitter folding:
          -- vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
          -- vim.wo[0][0].foldmethod = "expr"
        end
      end,
    })
  end,
}
