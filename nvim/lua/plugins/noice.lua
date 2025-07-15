return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline",
      opts = {},
      format = {
        cmdline = { pattern = "^:", icon = "⚡", lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
        lua = {
          pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
          icon = "",
          lang = "lua",
        },
        help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
        input = { view = "cmdline_input", icon = "󰥻 " },
      },
    },

    lsp = {
      hover = {
        enabled = true,
        silent = true,
        opts = {
          border = "rounded", -- ✅ Add border to LSP hover
        },
      },
      signature = {
        enabled = true,
        auto_open = {
          enabled = true,
          trigger = true,
          luasnip = true,
        },
        opts = {
          border = "rounded", -- ✅ Add border to signature help
        },
      },
      documentation = {
        view = "hover", -- or "popup"
        opts = {
          border = "rounded", -- ✅ Add border to documentation popup
        },
      },
    },
  },
}
