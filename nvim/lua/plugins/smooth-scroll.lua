return {
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	},
	{
		"dstein64/nvim-scrollview",
		config = function()
			require("scrollview").setup()
		end,
	},
}
