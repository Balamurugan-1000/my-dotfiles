return {
	"iamcco/markdown-preview.nvim",
	build = "cd app && yarn install",
	cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
	ft = { "markdown" },
	config = function() end,
}
