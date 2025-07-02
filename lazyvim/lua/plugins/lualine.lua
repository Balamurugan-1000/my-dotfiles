return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy", -- or "InsertEnter", "BufWinEnter"
    opts = function(_, opts)
      -- Insert a new component to show current command line input
      table.insert(opts.sections.lualine_c, 1, {
        function()
          local mode = vim.fn.mode()
          if mode == "c" then
            return ":" .. vim.fn.getcmdline()
          end
          return ""
        end,
        cond = function()
          return vim.fn.mode() == "c"
        end,
      })
    end,
  },
}
