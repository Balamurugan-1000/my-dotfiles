-- ~/.config/nvim/lua/plugins/none-ls.lua

return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = vim.list_extend(opts.sources or {}, {
      nls.builtins.formatting.djlint.with({
        extra_args = { "--profile=django" }, -- Use Django mode
      }),
    })
  end,
}
