--
-- Language Servers
--
local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup({})
lspconfig.gopls.setup({})
lspconfig.pyright.setup({})
lspconfig.ruby_ls.setup({})
