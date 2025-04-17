return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			options = {
				themable = true, -- Allow theme overrides
				mode = "buffers", -- "tabs" for tab-based UI
				numbers = "ordinal", -- Shows buffer numbers
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				middle_mouse_command = nil,

				-- 🔥 Icons & Aesthetic Separators
				buffer_close_icon = "󰅖",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				separator_style = "slant", -- "thick", "thin", "padded_slant", "slant"
				always_show_bufferline = true,
				enforce_regular_tabs = false,

				-- 🔔 LSP & Diagnostic Indicators
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = (level:match("error") and " ") or " "
					return " " .. icon .. count
				end,

				-- ✨ Hover Effects
				hover = {
					enabled = true,
					delay = 150,
					reveal = { "close" },
				},

				-- 🌈 Highlights (Make it aesthetic!)
				highlights = {
					fill = { fg = "#a9b1d6", bg = "#1a1b26" },
					background = { fg = "#7aa2f7", bg = "#1a1b26" },
					buffer_selected = { fg = "#c0caf5", bg = "#24283b", bold = true, italic = false },
					separator = { fg = "#3b4261", bg = "#1a1b26" },
					separator_selected = { fg = "#3b4261", bg = "#24283b" },
					modified = { fg = "#e0af68", bg = "#1a1b26" },
					modified_selected = { fg = "#e0af68", bg = "#24283b" },
				},
			},
		})
	end,
}
