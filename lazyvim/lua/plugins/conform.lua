return {
  "stevearc/conform.nvim",
  opts = {
    -- Enable format-on-save for all supported filetypes
    -- format_on_save = function(bufnr)
    --   local ignore_ft = { "sql", "xml" } -- optionally skip some
    --   return not vim.tbl_contains(ignore_ft, vim.bo[bufnr].filetype)
    -- end,

    -- Map filetypes to formatters
    formatters_by_ft = {
      -- Web/Django
      html = { "djlint" },
      htmldjango = { "djlint" },

      -- Python
      python = { "isort", "black" },

      -- JS/TS
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },

      -- CSS and friends
      css = { "prettier" },
      scss = { "prettier" },
      less = { "prettier" },

      -- JSON, YAML
      json = { "prettier" },
      yaml = { "prettier" },

      -- Markdown
      markdown = { "prettier" },

      -- Lua
      lua = { "stylua" },

      -- Shell
      sh = { "shfmt" },
      bash = { "shfmt" },

      -- Go
      go = { "gofmt" },

      -- Fallback for all others (if needed)
      ["*"] = {},
    },

    -- Custom formatter definitions
    formatters = {
      djlint = {
        command = "djlint",
        args = { "--profile=django", "-" },
        stdin = true,
      },
    },
  },
}
