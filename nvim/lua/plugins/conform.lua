-- plugins/conform.lua
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      htmldjango = { "djlint" },
      html = { "djlint" },
    },
    formatters = {
      djlint = {
        prepend_args = { "--indent", "2" },
      },
    },
  },
}
