return {
  -- One Dark Pro (Atom-like theme)
  { "olimorris/onedarkpro.nvim" },

  -- Nightfly (dark, blue-tinted)
  { "bluz71/vim-nightfly-colors" },

  -- Gruvbox (popular warm-toned retro theme)
  { "ellisonleao/gruvbox.nvim" },
  { "morhetz/gruvbox" }, -- legacy variant

  -- Dracula (dark with vibrant highlights)
  { "Mofiqul/dracula.nvim" },

  -- Kanagawa (Japanese ink-inspired, elegant)
  { "rebelot/kanagawa.nvim" },

  -- PaperColor (light and dark variants, clean contrast)
  { "NLKNguyen/papercolor-theme" },

  -- OneDark classic
  { "joshdick/onedark.vim" },

  -- Apprentice (low-contrast dark theme)
  { "romainl/Apprentice" },

  -- 🌹 Rose Pine (with transparency config)
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "auto",
        dark_variant = "main",
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = true,
          migrations = true,
        },

        styles = {
          bold = true,
          italic = true,
          transparency = true, -- ✅ Enable transparency
        },

        highlight_groups = {
          Normal = { bg = "none" },
          NormalNC = { bg = "none" },
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          VertSplit = { bg = "none" },
          SignColumn = { bg = "none" },
          StatusLine = { bg = "none" },
          EndOfBuffer = { bg = "none" },
        },
      })

      vim.cmd("colorscheme rose-pine") -- or rose-pine-main / moon / dawn
    end,
  },

  -- 🎨 Bonus Recommended Themes
  -- Catppuccin (soft pastel tone, highly customizable)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  -- Tokyo Night (popular for dark-themed UIs)
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon", -- or "night", "storm", "day"
      light_style = "day",
      transparent = true, -- ✅ enable full transparency
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "transparent", -- ✅ make sidebars transparent
        floats = "transparent", -- ✅ make floating windows transparent
      },
      day_brightness = 0.3,
      dim_inactive = false,
      lualine_bold = false,

      on_colors = function(colors) end,

      on_highlights = function(hl, c)
        hl.Normal = { bg = "NONE" }
        hl.NormalNC = { bg = "NONE" }
        hl.NormalFloat = { bg = "NONE" }
        hl.FloatBorder = { bg = "NONE" }
        hl.SignColumn = { bg = "NONE" }
        hl.StatusLine = { bg = "NONE" }
        hl.VertSplit = { bg = "NONE" }
        hl.EndOfBuffer = { bg = "NONE" }
      end,

      plugins = {
        all = true,
        auto = true,
      },
    },
  },

  -- Nord (cool arctic palette)
  { "shaunsingh/nord.nvim" },
}
