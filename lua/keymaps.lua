--
-- Keybinds
--
function keybind(mode, shortcut, cmd)
  vim.api.nvim_set_keymap(mode, shortcut, cmd, { noremap = true, silent = true })
end

-- Swap the 'go to mark' cursor/column keys.
keybind("n", "'", "`")
keybind("n", "`", "'")

keybind("n", "<Leader>s", ":w<CR>")
keybind("n", "<Leader>S", ":wa<CR>")
keybind("n", "<Leader>q", ":q<CR>")

keybind("n", "<C-t>", ":tabnew<CR>")
keybind("n", "<C-h>", ":tabprev<CR>")
keybind("n", "<C-l>", ":tabnext<CR>")

keybind("t", "<Esc>", [[<C-\><C-n>]])

keybind("n", "<Leader>/", ":noh<CR>")

keybind("n", "<Leader>f", ":NvimTreeToggle<CR>")
keybind("n", "<Leader>g", ":Outline<CR>")

keybind("n", "<Leader>t", ":Telescope find_files<CR>")
keybind("n", "<Leader>b", ":Telescope buffers<CR>")
keybind("n", "<Leader>c", ":Telescope commands<CR>")


--
-- LSP keybinds
--
vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set("n", "<Leader>h", vim.lsp.buf.hover, { buffer = args.buf })
  end,
})
