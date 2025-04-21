return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        -- "MunifTanjim/nui.nvim",
        -- "rcarriga/nvim-notify"
    },
    config = function()
        require("noice").setup({
            cmdline = {
                view = "cmdline", -- you can try "cmdline_popup" too
                format = {
                    cmdline = { icon = " " },
                    search_down = { icon = " " },
                    search_up = { icon = " " },
                },
            },
            lsp = {
                progress = { enabled = true },
                signature = { enabled = true },
                hover = { enabled = true },
            },
            messages = {
                enabled = false,
            },
            presets = {
                bottom_search = false, -- use classic bottom cmdline for `/`
                command_palette = true,
                lsp_doc_border = true,
            },
        })
    end,
}
