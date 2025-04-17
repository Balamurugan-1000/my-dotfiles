return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			javascript = { "eslint" },
			typescript = { "eslint" },
			go = { "golangci-lint" },
			python = { "pylint" },
			markdown = { "markdownlint" },
			sh = { "shellcheck" },
		}
	end,
}
