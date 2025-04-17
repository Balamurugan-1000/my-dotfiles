return {
	"f-person/git-blame.nvim",
	config = function()
		require("gitblame").setup({
			enabled = true, -- Enable git blame by default
			message_template = "<author> • <date> • <summary>",
			date_format = "%Y-%m-%d",
			delay = 200, -- Delay before showing blame
		})
	end,
}
