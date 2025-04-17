-- ~/.config/nvim/lua/plugins/alpha.lua
return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- For file icons
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Cool ASCII header (cyberpunk-inspired)
		dashboard.section.header.val = {
			" ",
			" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			" ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			" ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			" ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			" ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			" ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			" ",
			"       >>> NEOVIM: CYBER TERMINAL v0.1 <<<       ",
			" ",
		}
		dashboard.section.header.opts.hl = "Function" -- Highlight group for the header

		-- Buttons with icons and descriptions
		dashboard.section.buttons.val = {
			dashboard.button("n", "✨ New File", ":ene <BAR> startinsert<CR>", { desc = "Create a new file" }),
			dashboard.button("f", "🔍 Find File", ":Telescope find_files<CR>", { desc = "Search for files" }),
			dashboard.button("r", "📜 Recent Files", ":Telescope oldfiles<CR>", { desc = "Open recent files" }),
			dashboard.button("g", "⚡ Live Grep", ":Telescope live_grep<CR>", { desc = "Search text in project" }),
			dashboard.button(
				"c",
				"🛠️ Config",
				":Telescope find_files cwd=~/.config/nvim<CR>",
				{ desc = "Browse Neovim config" }
			),
			dashboard.button("l", "📦 Lazy", ":Lazy<CR>", { desc = "Manage plugins" }),
			dashboard.button("q", "🚪 Quit", ":qa<CR>", { desc = "Exit Neovim" }),
		}
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "Keyword" -- Highlight for button text
			button.opts.hl_shortcut = "Number" -- Highlight for shortcut keys
			button.opts.width = 50 -- Uniform width for alignment
		end

		-- Dynamic footer with startup stats
		local function footer()
			local stats = require("lazy").stats() -- Corrected from "lazyTTY" to "lazy"
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
			return "⚡ Loaded " .. stats.count .. " plugins in " .. ms .. "ms"
		end
		dashboard.section.footer.val = footer()
		dashboard.section.footer.opts.hl = "Comment"

		-- Layout adjustments
		dashboard.opts.layout = {
			{ type = "padding", val = 4 },
			dashboard.section.header,
			{ type = "padding", val = 2 },
			dashboard.section.buttons,
			{ type = "padding", val = 1 },
			dashboard.section.footer,
		}

		-- Only show Alpha when no arguments are passed
		alpha.setup(dashboard.opts)

		-- Autocommand to lazy-load Alpha only on empty buffer
		-- Show Alpha screen if no files are passed and the buffer is empty
		vim.api.nvim_create_autocmd("VimEnter", {
			pattern = "*",
			callback = function()
				if vim.fn.argc() == 0 and vim.fn.line2byte("$") == -1 then
					require("alpha").start() -- Start the Alpha dashboard
				end
			end,
		})

		-- Disable folding in Alpha buffer
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "alpha",
			callback = function()
				vim.opt_local.foldenable = false -- Disable folding on the alpha buffer
			end,
		})
	end,
}
