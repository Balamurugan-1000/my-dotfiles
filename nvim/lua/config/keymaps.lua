local map = vim.keymap.set

map("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = "save the file" })

----------------------------------------------------
---TELESCOPE
-----------------------------------------------------
local builtin = require("telescope.builtin")

-- Utility to get git root or fallback to cwd
local function get_project_root()
    local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    if vim.v.shell_error == 0 then
        return git_root
    else
        return vim.loop.cwd() -- fallback to nvim's current working directory
    end
end

-- Ctrl+P and <leader>ff => search from project root (not just cwd or file dir)
map("n", "<C-p>", function()
    builtin.find_files({ cwd = get_project_root(), hidden = true })
end, { desc = "Find files from project root" })

map("n", "<leader>ff", function()
    builtin.find_files({ cwd = get_project_root(), hidden = true })
end, { desc = "Find files from project root" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
--------------------------------------------- Enhanced clipboard yanking
map("n", "<leader>y", '"+y', { desc = "Yank line to clipboard" })
map("v", "<leader>y", '"+y', { desc = "Yank selection to clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Yank to end of line to clipboard" })

-- Bonus: Paste from system clipboard
map("n", "<leader>p", '"+p', { desc = "Paste from clipboard after cursor" })
map("n", "<leader>P", '"+P', { desc = "Paste from clipboard before cursor" })
map("x", "<leader>p", '"_d"+p', { desc = "Replace selection with clipboard" })

map("n", "<leader>yy", '"+yy', { noremap = true, silent = true, desc = "Yank line to clipboard" })
-----------

------------------------------------------------------

map("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })
local keymap = vim.api.nvim_set_keymap -- Using 'keymap' instead of 'vim.keymap.set'
local opts = { noremap = true, silent = true }

-- 📝 LSP Keymaps

-- 🔄 Switch Buffers
map("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)   -- Next buffer
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts) -- Previous buffer

-- 🔢 Jump to Specific Buffers (1-9)
map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opts)
map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opts)
map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opts)
map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opts)
map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opts)
map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opts)
map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opts)
map("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opts)
map("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", opts)

-- ❌ Close Buffers
map("n", "<leader>bc", ":bdelete!<CR>", opts)              -- Close current buffer
map("n", "<leader>bo", ":BufferLineCloseOthers<CR>", opts) -- Close others
map("n", "<leader>bp", ":BufferLinePickClose<CR>", opts)   -- Pick & close

-- 🔄 Reordering Buffers
map("n", "<leader><S-Right>", ":BufferLineMoveNext<CR>", opts) -- Move Right
map("n", "<leader><S-Left>", ":BufferLineMovePrev<CR>", opts)  -- Move Left

map("n", "<leader>;", "Alpha<CR>", opts)

-- 🚀 Pick Buffer (Fuzzy Select)
map("n", "<leader>bb", ":BufferLinePick<CR>", opts) -- Choose buffer

map("n", "<C-a>", "ggVG", { desc = "Select entire buffer" })
---NEOTREE
---
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlights" })

vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

-- Go to definition (replaces vim.lsp.buf.definition)
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)

-- Go to declaration (replaces vim.lsp.buf.declaration)
vim.keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts) -- Peek instead of jump

-- Go to implementation (replaces vim.lsp.buf.implementation)
vim.keymap.set("n", "gi", "<cmd>Lspsaga finder imp<CR>", opts)

-- Find references (replaces vim.lsp.buf.references)
vim.keymap.set("n", "gr", "<cmd>Lspsaga finder ref<CR>", opts)

-- Rename symbol (replaces vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)

-- Code action (replaces vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
vim.keymap.set("v", "<leader>ca", "<cmd>Lspsaga range_code_action<CR>", opts)

-- Diagnostics navigation (replaces vim.diagnostic.goto_prev/next)
vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

-- Show diagnostics (replaces vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

-- Format file (using LSP formatting)
vim.keymap.set("n", "<leader>fl", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)

-- Additional Lspsaga features (bonus!)
vim.keymap.set("n", "<leader>ol", "<cmd>Lspsaga outline<CR>", opts)        -- Show code outline
vim.keymap.set("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>", opts) -- Incoming call hierarchy
vim.keymap.set("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>", opts) -- Outgoing call hierarchy
map("n", "<C-Down>", "<Plug>(VM-Add-Cursor-Down)", opts)                   -- Add cursor in next line
map("n", "<C-Up>", "<Plug>(VM-Add-Cursor-Up)", opts)                       -- Add cursor in previous line
map("n", "<leader>mm", "<Plug>(VM-Select-All)", opts)                      -- Select all occurrences
map("n", "<leader>ms", "<Plug>(VM-Start-Regex-Search)", opts)              -- Start regex search
map("n", "<leader>md", "<Plug>(VM-Remove-Cursor)", opts)                   -- Remove last cursor
-- Clear all notifications
vim.keymap.set("n", "<leader>nc", function()
    require("noice").dismiss({ silent = true, pending = true })
end, { desc = "🧹 Clear Noice Notifications" })

-- View Noice notification history
vim.keymap.set("n", "<leader>nh", function()
    require("noice").cmd("history")
end, { desc = "📜 Noice Notification History" })

local Terminal = require("toggleterm.terminal").Terminal

local term1 = Terminal:new({ count = 1, direction = "float", hidden = true })
local term2 = Terminal:new({ count = 2, direction = "float", hidden = true })
local term3 = Terminal:new({ count = 3, direction = "float", hidden = true })
local term4 = Terminal:new({ count = 4, direction = "float", hidden = true })
local term5 = Terminal:new({ count = 5, direction = "float", hidden = true })

function _G.toggle_term1() term1:toggle() end

function _G.toggle_term2() term2:toggle() end

function _G.toggle_term3() term3:toggle() end

function _G.toggle_term4() term4:toggle() end

function _G.toggle_term5() term5:toggle() end

-- Normal mode mappings
vim.api.nvim_set_keymap("n", "<A-1>", "<cmd>lua toggle_term1()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-2>", "<cmd>lua toggle_term2()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-3>", "<cmd>lua toggle_term3()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-4>", "<cmd>lua toggle_term4()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-5>", "<cmd>lua toggle_term5()<CR>", { noremap = true, silent = true })

-- Terminal mode mappings
vim.api.nvim_set_keymap("t", "<A-1>", "<cmd>lua toggle_term1()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<A-2>", "<cmd>lua toggle_term2()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<A-3>", "<cmd>lua toggle_term3()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<A-4>", "<cmd>lua toggle_term4()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<A-5>", "<cmd>lua toggle_term5()<CR>", { noremap = true, silent = true })

-- Optional: exit terminal to normal mode with <Esc>
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
return {}
