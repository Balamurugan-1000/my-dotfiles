return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Utility functions
		"nvim-tree/nvim-web-devicons", -- File icons (not required but recommended)
		"MunifTanjim/nui.nvim", -- UI components
	},
	lazy = false, -- Neo-tree loads immediately (no lazy loading)

	opts = {
		-- Filesystem options
		filesystem = {
			filtered_items = {
				visible = true, -- Always show filtered items
				hide_dotfiles = false, -- Do not hide dotfiles (e.g., .git, .env)
				hide_gitignored = false, -- Show .gitignored files
			},
		},

		-- You can add more configuration options here if needed, for example:
	},
}
