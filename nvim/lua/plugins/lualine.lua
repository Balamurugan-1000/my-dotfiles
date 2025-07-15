return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  lazy = true,
  opts = {
    options = {
      theme = "tokyonight",
      globalstatus = true,
      icons_enabled = true,
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = { "alpha", "dashboard", "starter", "neo-tree" },
      },
    },
    sections = {
      -- Leftmost: Mode with round box
      lualine_a = {
        {
          "mode",
          separator = { left = "", right = "" },
          right_padding = 1,
        },
      },
      -- Git branch and diff
      lualine_b = {
        { "branch", icon = "", separator = { left = "", right = "" } },
        {
          "diff",
          symbols = { added = " ", modified = " ", removed = " " },
          source = nil,

          separator = { left = "", right = "" },
        },
      },
      -- Current file path with icon + status
      lualine_c = {},
      -- LSP diagnostics
      lualine_x = {
        {
          "diagnostics",
          symbols = { error = " ", warn = " ", info = " ", hint = " " },
          always_visible = true,
        },
      },
      -- Optional: encoding and format (minimal)
      lualine_y = {
        -- { "encoding", fmt = string.upper },
        -- { "fileformat", icons_enabled = false },
      },
      -- Line + column, styled
      lualine_z = {
        -- {
        --   "location",
        --   separator = { left = "", right = "" },
        --   left_padding = 1,
        -- },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        {
          "filename",
          path = 1,
          symbols = { modified = " ●", readonly = " 🔒", unnamed = "[No Name]" },
        },
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
  },
}
