return {
	"chrishrb/gx.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("gx").setup({})
	end,
}
