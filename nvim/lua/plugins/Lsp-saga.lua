return {
    "nvimdev/lspsaga.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter", -- Enhanced rendering and parsing
        "nvim-tree/nvim-web-devicons",     -- Icons for UI elements
    },
    config = function()
        require("lspsaga").setup({
            -- UI Customization (modern and sleek)
            ui = {
                theme = "round",           -- Rounded borders for a polished look
                border = "rounded",
                winblend = 10,             -- Slight transparency
                colors = {
                    normal_bg = "#1e1e2e", -- Darker background for contrast
                    title_bg = "#89b4fa",  -- Light blue for titles
                },
            },

            -- Lightbulb (Code Action Indicator)
            lightbulb = {
                enable = true,
                sign = true,         -- Show in sign column
                virtual_text = true, -- Show inline hint
                debounce = 150,      -- Reduce flickering
            },

            -- Hover Documentation (IntelliJ-like)
            hover = {
                max_width = 0.8,
                max_height = 0.6,
                open_link = "gx", -- Open links with gx
            },

            -- Symbol in Winbar (Breadcrumbs)
            symbol_in_winbar = {
                enable = true,
                separator = " › ",
                hide_keyword = true, -- Cleaner display
                show_file = true,    -- Include filename
                folder_level = 1,    -- Show one level of folder context
                color_mode = true,   -- Use colors for symbols
            },

            -- Finder (References, Definitions, etc.)
            finder = {
                max_height = 0.6,
                keys = {
                    shuttle = "[w",       -- Switch between finder windows
                    toggle_or_open = "o", -- Toggle or open result
                    vsplit = "s",         -- Open in vertical split
                    split = "i",          -- Open in horizontal split
                    quit = "q",
                },
            },

            -- Code Action
            code_action = {
                num_shortcut = true,     -- Numbered shortcuts (e.g., <1>, <2>)
                show_server_name = true, -- Show LSP server providing the action
                extend_gitsigns = true,  -- Integrate with gitsigns if available
                keys = {
                    quit = "q",
                    exec = "<CR>",
                },
            },

            -- Diagnostics
            diagnostic = {
                show_code_action = true,
                show_source = true,       -- Show diagnostic source
                jump_num_shortcut = true, -- Use numbers to jump
                keys = {
                    exec_action = "o",
                    quit = "q",
                    go_action = "g",
                },
            },

            -- Rename
            rename = {
                in_select = true,  -- Pre-select name for editing
                auto_save = false, -- Don’t auto-save after rename
                keys = {
                    quit = "<C-c>",
                    exec = "<CR>",
                    select = "x",
                },
            },

            -- Outline (Code Structure)
            outline = {
                win_position = "right",
                win_width = 40,
                auto_preview = true, -- Preview on hover
                detail = true,       -- Show detailed info
                keys = {
                    toggle_or_jump = "o",
                    quit = "q",
                },
            },

            -- Call Hierarchy
            callhierarchy = {
                show_detail = true,
                keys = {
                    edit = "e",
                    vsplit = "s",
                    split = "i",
                    toggle_or_req = "o",
                    quit = "q",
                },
            },
        })
    end,
}
