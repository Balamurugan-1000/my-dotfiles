vim.g.autoformat = true
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.o.list = false
vim.opt.listchars = {}
vim.opt.guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20"

if vim.loader then
  vim.loader.enable()
end
vim.opt.foldenable = false
