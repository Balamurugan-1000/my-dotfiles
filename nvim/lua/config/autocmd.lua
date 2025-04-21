vim.api.nvim_create_autocmd("BufWritePre", {

    pattern = "*",

    callback = function()
        require("conform").format({ async = false, lsp_fallback = true })
    end,
})
--
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})
-- Toggle between relative and absolute line numbers based on mode
vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    command = "set relativenumber",
})

vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    command = "set norelativenumber",
})
-- Ensure netrw is loaded properly before Lazy.nvim and other plugins
vim.cmd("runtime! netrwPlugin")

return {}
