return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			local status, ibl = pcall(require, "ibl")
			if not status then
				print("Failed to load indent-blankline")
				return
			end

			ibl.setup({
				indent = { char = "┋" },
				scope = {
					enabled = true,
					show_start = true,
					show_end = true,
					highlight = "Function",
				},
				whitespace = { remove_blankline_trail = false },
				exclude = { filetypes = { "help", "dashboard", "NvimTree", "lazy" } },
			})
		end,
	},
}
