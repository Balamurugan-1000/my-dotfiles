vim.api.nvim_set_hl(0, "SnacksHeader", { fg = "#FF0000" }) -- Red color
local opt = vim.opt

-- 🧠 Tab & Indentation
opt.expandtab = true -- use spaces instead of tabs
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for >> <<
opt.smartindent = true -- auto smart indenting
opt.autoindent = true -- maintain indent from previous line

-- 🔍 Search
opt.ignorecase = true -- ignore case when searching...
opt.smartcase = true -- ...unless there's a capital letter
opt.incsearch = true -- live search preview
opt.hlsearch = false -- don’t highlight matches after search

-- 📦 Better File Behavior
opt.clipboard = "unnamedplus" -- use system clipboard 😎
opt.undofile = true -- persistent undo across sessions
opt.swapfile = false -- no swap files
opt.backup = false -- no backup files

-- 🧭 Navigation
opt.scrolloff = 8 -- keep cursor 8 lines from screen edge
opt.sidescrolloff = 8 -- same but horizontal
opt.splitbelow = true -- open horizontal splits below
opt.splitright = true -- open vertical splits to the right

-- ⌛ Performance
opt.updatetime = 250 -- faster completion & diagnostics
opt.timeoutlen = 400 -- shorter timeout for mapped sequences

-- 🧙 Folding (if you're into that)
opt.foldmethod = "indent" -- fold based on indent
opt.foldlevel = 99 -- open all folds by default
opt.guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20"
vim.o.ignorecase = true
vim.o.smartcase = true

return {}
