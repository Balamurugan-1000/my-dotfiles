return {
	"stevearc/dressing.nvim",
	event = "VeryLazy",
	opts = {
		input = {
			enabled = true,
			border = "rounded", -- 👑 Fancy border
		},
		select = {
			enabled = true,
			backend = { "telescope", "builtin" }, -- fallback if no telescope
		},
	},
}
