local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local dashboard_visible = false
map("n", "<Tab>", function() require("astrocore.buffer").nav(vim.v.count1) end, opts) -- Next buffer
map("n", "<S-Tab>", function() require("astrocore.buffer").nav(-vim.v.count1) end, opts) -- Previous buffer
map("n", "<leader>;", ":lua Snacks.dashboard() <CR>", opts)

map("n", "<C-a>", "ggVG", { desc = "Select entire buffer" })
map("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlights" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })

vim.keymap.set("n", "<leader>;", function()
  if dashboard_visible then
    vim.cmd "bd" -- or `:close` or `:bd!` depending on your use case
    dashboard_visible = false
  else
    Snacks.dashboard()
    dashboard_visible = true
  end
end, { desc = "Toggle Snacks Dashboard" })

map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)

map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
vim.keymap.set("n", "<Leader>bd", ":bd<CR>", { desc = "Close current buffer" })

map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- 🌈 Toggle between block and I-beam
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
map("n", "<C-Up>", "<Plug>(VM-Add-Cursor-Up)", opts) -- Add cursor in previous line
map("n", "<leader>mm", "<Plug>(VM-Select-All)", opts) -- Select all occurrences
map("n", "<leader>ms", "<Plug>(VM-Start-Regex-Search)", opts) -- Start regex search
map("n", "<leader>md", "<Plug>(VM-Remove-Cursor)", opts) -- Remove last cursor


return {}
