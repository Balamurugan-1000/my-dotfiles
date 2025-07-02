-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")'
--

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.html", "*.jinja", "*.djhtml" },
  callback = function()
    vim.lsp.buf.format()
  end,
})
-- Terminal Mode: Map <Esc> to Normal Mode
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
  end,
})
