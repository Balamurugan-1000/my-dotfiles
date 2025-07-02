return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    cmdline = {
      view = "cmdline", -- use the bottom view (not popup)
      format = {
        cmdline = {
          icon = "🛠️ ",
          lang = "vim",
        },
      },
    },

    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    routes = {
      -- Suppress "Registered .* with pyright"
      {
        filter = {
          event = "notify",
          find = "Registered '.-' with pyright LSP",
        },
        opts = { skip = true },
      },
      -- Suppress command feedback like "X lines, Y bytes"
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
          },
        },
        view = "mini",
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>sn",  "", desc = "+noice"},
    { "<S-Enter>",   function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
    { "<leader>snl", function() require("noice").cmd("last") end,    desc = "Noice Last Message" },
    { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
    { "<leader>sna", function() require("noice").cmd("all") end,     desc = "Noice All" },
    { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
    { "<leader>snt", function() require("noice").cmd("pick") end,    desc = "Noice Picker" },
    {
      "<C-f>",
      function()
        if not require("noice.lsp").scroll(4) then return "<C-f>" end
      end,
      mode = { "i", "n", "s" }, expr = true, silent = true, desc = "Scroll Forward"
    },
    {
      "<C-b>",
      function()
        if not require("noice.lsp").scroll(-4) then return "<C-b>" end
      end,
      mode = { "i", "n", "s" }, expr = true, silent = true, desc = "Scroll Backward"
    },
  },
  config = function(_, opts)
    if vim.o.filetype == "lazy" then
      vim.cmd([[messages clear]])
    end
    require("noice").setup(opts)
  end,
}
