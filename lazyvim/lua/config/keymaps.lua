-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--


local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>;", ":lua Snacks.dashboard() <CR>", opts)

map("n", "<C-a>", "ggVG", { desc = "Select entire buffer" })
map("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlights" })

map("n", "<leader>w", ":w<CR>", opts)
map("n", "<C-w>", ":bd<CR>", { desc = "Close buffer", noremap = true, silent = true })

map("n", "<leader>c", '"+y', { desc = "Copy to Clipboard" })

map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)

local is_block = true

vim.keymap.set("n", "<leader>cb", function()
  if is_block then
    vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
    print "󰅖 Cursor: I-Beam Mode"
  else
    vim.opt.guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20"
    print "󰛢 Cursor: BLOCK Mode"
  end
  is_block = not is_block
end, { desc = "Toggle Cursor Style" })

map("n", "<C-Down>", "<Plug>(VM-Add-Cursor-Down)", opts) -- Add cursor in next line
map("n", "<C-Up>", "<Plug>(VM-Add-Cursor-Up)", opts)     -- Add cursor in previous line


-- Next buffer (Tab)
map("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)

-- Previous buffer (Shift+Tab)
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)

map("n", "<C-p>", ":Telescope find_files<CR>", opts)
map("n", "<leader><leader>", "<nop>", opts)
