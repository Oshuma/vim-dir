--
-- Language Servers
--
local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup({})
lspconfig.gopls.setup({})
lspconfig.pyright.setup({})
lspconfig.ruby_ls.setup({})

vim.keymap.set("n", "<Leader>h", vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
