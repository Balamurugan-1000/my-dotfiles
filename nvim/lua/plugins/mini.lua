return {
	"echasnovski/mini.nvim",
	version = "*", -- always latest stable
	config = function()
		require("mini.pairs").setup() -- Auto-pairs
		require("mini.comment").setup() -- Commenting
		require("mini.surround").setup() -- Surround edit
		require("mini.cursorword").setup() -- Word highlighting
		require("mini.statusline").setup() -- Minimal statusline (optional)
		-- Add more modules as needed 😎
	end,
}
