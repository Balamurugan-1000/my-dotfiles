require("config.lazy")
--
-- local builtin = require("telescope.builtin")
--
-- vim.keymap.set('n','<C-p>',builtin.find_files , {})

vim.g.clipboard = {
    name = "wl-clipboard",
    copy = {
        ["+"] = "wl-copy",
        ["*"] = "wl-copy",
    },
    paste = {
        ["+"] = "wl-paste",
        ["*"] = "wl-paste",
    },
    cache_enabled = true,
}

vim.opt.clipboard:append { "unnamedplus" }
