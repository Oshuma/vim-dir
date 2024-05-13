-- Hide fold level numbers. Stolen from Reddit; fixed by JarvisGPT
-- FIXME: Change relative number when folds are closed.
local function get_fold(lnum)
  if vim.fn.foldlevel(lnum) <= vim.fn.foldlevel(lnum - 1) then
    return ' '
  end
  local fcs = vim.opt.fillchars:get()
  local fold_sym = vim.fn.foldclosed(lnum) == -1 and fcs.foldopen or fcs.foldclose
  return fold_sym
end

return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async"
  },
  config = function()
    -- treesitter
    -- require('ufo').setup({
    --     provider_selector = function(bufnr, filetype, buftype)
    --         return {'treesitter', 'indent'}
    --     end
    -- })

    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

    _G.get_statuscol = function()
      local current_line = vim.v.lnum
      local cursor_line = vim.fn.line('.')
      local relative_number = current_line - cursor_line
      if current_line == cursor_line then
        relative_number = cursor_line -- Display the absolute number on the current line
      elseif relative_number < 0 then
        relative_number = -relative_number -- Convert negative relative numbers to positive for lines above the cursor
      end
      return "%s" .. relative_number .. " " .. get_fold(current_line) .. " "
    end

    vim.o.statuscolumn = "%!v:lua.get_statuscol()"

    -- LSP
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }
    local language_servers = require("lspconfig").util.available_servers()
    for _, ls in ipairs(language_servers) do
      require('lspconfig')[ls].setup({
        capabilities = capabilities
      })
    end

    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = (' 󰁂 %d '):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, {chunkText, hlGroup})
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, {suffix, 'MoreMsg'})
      return newVirtText
    end

    require('ufo').setup({
      fold_virt_text_handler = handler
    })
  end
}
