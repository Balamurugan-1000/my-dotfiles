vim.opt.tabstop = 4 -- Number of spaces for a tab
vim.opt.shiftwidth = 4 -- Indentation amount for > and <
vim.opt.softtabstop = 4 -- Backspace treats tab as 4 spaces
vim.opt.expandtab = true -- Convert tabs to spaces
-- Enable signcolumn to prevent text shifting when adding symbols
vim.wo.signcolumn = "yes" -- Always show the sign column

-- Optionally, if you want extra space in front of the line numbers
vim.wo.numberwidth = 4 -- Adjust the width to add more space

-- Auto-indent & Smart indent
vim.opt.smartindent = true -- Enable smart indentation
vim.opt.autoindent = true -- Copy indent from the previous line
vim.opt.termguicolors = true
-- Disable line wrapping (optional)
vim.opt.wrap = false
-- Enable absolute line numbers
vim.wo.number = true -- This enables normal mode line numbers

-- Enable relative line numbers
vim.wo.relativenumber = true -- This enables relative line numbers

-- Disable Netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_netrwScriptPlugin = 1 -- <-- Ensure this is included too!
-- vim.g.mkdp_auto_start = 1
return {}
