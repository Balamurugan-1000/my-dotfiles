-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- 🔁 Restart LSP and reload buffer
map("n", "<leader>lR", function()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  for _, client in ipairs(clients) do
    vim.lsp.buf_detach_client(0, client.id)
  end
  vim.cmd("edit")
  vim.defer_fn(function()
    vim.cmd("LspRestart")
  end, 100)
end, vim.tbl_extend("force", opts, { desc = "LSP Restart + Reload Buffer" }))

-- 🔃 Refresh diagnostics and open quickfix
map("n", "<leader>lD", function()
  vim.diagnostic.reset()
  vim.diagnostic.setqflist()
  vim.cmd("copen")
end, vim.tbl_extend("force", opts, { desc = "Refresh Diagnostics + Show Quickfix" }))

-- 🌳 Reattach Treesitter highlight
map("n", "<leader>lt", function()
  vim.cmd("TSBufDisable highlight")
  vim.cmd("TSBufEnable highlight")
end, vim.tbl_extend("force", opts, { desc = "Reattach Treesitter Highlight" }))

-- 🧼 Clear LSP diagnostics and highlights
map("n", "<leader>lc", function()
  vim.diagnostic.reset()
  vim.lsp.buf.clear_references()
end, vim.tbl_extend("force", opts, { desc = "Clear Diagnostics + Highlights" }))

map("n", "<leader>;", ":lua Snacks.dashboard() <CR>", opts)
map("n", "<C-a>", "ggVG", { desc = "Select entire buffer" })
map("n", "<C-u>", "<C-u>zz", { desc = "Select entire buffer" })
map("n", "<C-d>", "<C-d>zz", { desc = "Select entire buffer" })
map("n", "<leader>xh", ":nohlsearch<CR>", { desc = "Clear search highlights", noremap = true, silent = true })

-- map("n", "<C-w>", ":bd<CR>", { desc = "Close buffer", noremap = true, silent = true })
map("i", "jj", "<ESC>", { desc = "To normal mode", noremap = true, silent = true })

map("n", "<C-Down>", "<Plug>(VM-Add-Cursor-Down)", opts)
map("n", "<C-Up>", "<Plug>(VM-Add-Cursor-Up)", opts)
map("n", "<C-d>", "<Plug>(VM-Find-Under)", opts)
map("v", "<C-d>", "<Plug>(VM-Find-Subword-Under)", opts)
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)

map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)
map("n", "<C-p>", ":Telescope find_files<CR>", opts)
map("n", "<leader><leader>", "<nop>", opts)

local is_block = true

vim.keymap.set("n", "<leader>cb", function()
  if is_block then
    vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
    print("󰅖 Cursor: I-Beam Mode")
  else
    vim.opt.guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20"
    print("󰛢 Cursor: BLOCK Mode")
  end
  is_block = not is_block
end, { desc = "Toggle Cursor Style" })

vim.keymap.set("n", "<leader>uj", function()
  vim.g.diagnostics_hover_enabled = not vim.g.diagnostics_hover_enabled
  local msg = vim.g.diagnostics_hover_enabled and "Enabled" or "Disabled"
  vim.notify("Diagnostics hover: " .. msg, vim.log.levels.INFO, { title = "LSP Hover" })
end, { desc = "Toggle diagnostics hover on cursor" })

-- Lspsaga Keymaps
local saga = require("lspsaga")

-- Hover Doc
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Documentation" })

-- Rename
map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Rename Symbol" })

-- Peek definition (opens in floating window)
map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })

-- Go to definition (in-place)
map("n", "gD", "<cmd>Lspsaga goto_definition<CR>", { desc = "Go to Definition" })

-- Finder (references/definitions/implementations)
map("n", "<leader>sf", "<cmd>Lspsaga finder<CR>", { desc = "LSP Finder" })

-- Outline
map("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { desc = "Toggle Outline" })

-- Call hierarchy (incoming/outgoing calls)
map("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>", { desc = "Incoming Calls" })
map("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>", { desc = "Outgoing Calls" })

-- Diagnostics
map("n", "<leader>cd", "<cmd>Lspsaga show_buf_diagnostics<CR>", { desc = "Buffer Diagnostics" })
map("n", "<leader>wd", "<cmd>Lspsaga show_workspace_diagnostics<CR>", { desc = "Workspace Diagnostics" })
map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Previous Diagnostic" })
map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next Diagnostic" })

-- Code action
map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })

-- Terminal toggle (if using Lspsaga term)
map("n", "<leader>tt", "<cmd>Lspsaga term_toggle<CR>", { desc = "Toggle Terminal" })

--  Jump to errors

map("n", "[e", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Previous Error" })

map("n", "]e", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Next Error" })

-- Track closed buffer before deleting
local bufremove = require("mini.bufremove")
local buffer_history = require("util.buffer_history")

vim.keymap.set("n", "<leader>bd", function()
  buffer_history.on_buf_delete(0)
  bufremove.delete(0, false)
end, { desc = "Delete Buffer" })

vim.keymap.set("n", "<leader>bu", function()
  require("util.buffer_history").reopen_last_buffer()
end, { desc = "Reopen Last Closed Buffer" })

-- Don't yank with x, c, C, s, S, d, D
local keys = { "x", "c", "C", "s", "S" }

for _, key in ipairs(keys) do
  vim.keymap.set("n", key, '"_' .. key, { noremap = true, silent = true })
end

-- Also for visual mode
for _, key in ipairs({ "x", "d", "c" }) do
  vim.keymap.set("v", key, '"_' .. key, { noremap = true, silent = true })
end

vim.keymap.set("n", "<leader>vg", ":VimBeGood<CR>", { desc = "🕹️ Vim Practice Game" })
vim.keymap.set("n", "<leader>se", ":e ~/scratch.txt <CR>", { desc = "Open a persisant buffer." })

vim.keymap.set("n", "<leader>lR", function()
  vim.lsp.stop_client(vim.lsp.get_active_clients(), true)
  vim.cmd("edit")
end, { desc = "LSP Restart (force clean)" })
