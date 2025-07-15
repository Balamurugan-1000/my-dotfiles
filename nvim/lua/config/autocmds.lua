-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- ~/.config/nvim/lua/config/autocmds.lua

vim.g.diagnostics_hover_enabled = false

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    if vim.g.diagnostics_hover_enabled and #vim.lsp.get_active_clients({ bufnr = 0 }) > 0 then
      vim.diagnostic.open_float(nil, {
        focusable = false,
        border = "rounded",
        scope = "cursor",
      })
    end
  end,
})

-- vim.cmd([[
--   autocmd CursorHold * lua vim.lsp.buf.document_highlight()
--   autocmd CursorMoved * lua vim.lsp.buf.clear_references()
-- ]])
