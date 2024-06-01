--
-- Keybinds
--
function keybind(mode, shortcut, cmd)
  vim.api.nvim_set_keymap(mode, shortcut, cmd, { noremap = true, silent = true })
end

-- Swap the 'go to mark' cursor/column keys.
keybind("n", "'", "`")
keybind("n", "`", "'")

keybind("n", "<Leader>s", "<cmd>w<cr>")
keybind("n", "<Leader>S", "<cmd>wa<cr>")
keybind("n", "<Leader>q", "<cmd>q<cr>")

keybind("n", "<C-t>", "<cmd>tabnew<cr>")
keybind("n", "<C-h>", "<cmd>tabprev<cr>")
keybind("n", "<C-l>", "<cmd>tabnext<cr>")

keybind("n", "<Leader>/", "<cmd>noh<cr>")

keybind("n", "<Leader>f", "<cmd>NvimTreeToggle<cr>")

keybind("n", "<Leader>t", "<cmd>Telescope find_files<cr>")
keybind("n", "<Leader>b", "<cmd>Telescope buffers<cr>")
keybind("n", "<Leader>c", "<cmd>Telescope commands<cr>")

-- fixes some terminal shit that I don't remember
keybind("t", "<Esc>", [[<C-\><C-n>]])


--
-- LSP keybinds
--
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    -- show errors in current buffer
    keybind("n", "<Leader>e", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")

    -- show symbols in current buffer
    keybind("n", "<Leader>g", "<cmd>Trouble symbols toggle<cr>")

    -- show references for symbol at cursor
    keybind("n", "<Leader>r", "<cmd>Trouble lsp_references toggle<cr>")

    -- find symbols at cursor
    keybind("n", "<Leader>d", "<cmd>Trouble lsp toggle<cr>")
  end,
})
