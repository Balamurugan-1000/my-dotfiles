local config = require("nvim-treesitter.configs")

config.setup({
    ensure_installed = { "java", "javascript", "html" },
    highlight = { enable = true },
    indent = { enable = true },
})



return {}
