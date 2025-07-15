return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional icons
    "nvim-treesitter/nvim-treesitter", -- for better syntax support
  },
  config = function()
    require("lspsaga").setup({
      ui = {
        border = "rounded",
        devicon = true,
        title = true,
        expand = "",
        collapse = "",
        code_action = "💡",
        actionfix = "",
        lines = { "┗", "┣", "┃", "━", "┏" },
      },
      symbol_in_winbar = {
        enable = true,
        separator = " ",
        ignore_patterns = {},
        hide_keyword = true,
        show_file = true,
        folder_level = 1,
      },
      code_action = {
        num_shortcut = true,
        show_server_name = true,
        extend_gitsigns = false,
        keys = {
          quit = "q",
          exec = "<CR>",
        },
      },
      lightbulb = {
        enable = false, -- 🔥 disables the lightbulb near line numbers
        sign = false,
        enable_in_insert = false,
        virtual_text = false,
      },
      finder = {
        max_height = 0.6,
        keys = {
          jump_to = "p",
          edit = { "o", "<CR>" },
          vsplit = "v",
          split = "s",
          tabe = "t",
          tabnew = "r",
          quit = { "q", "<ESC>" },
          close_in_preview = "<ESC>",
        },
      },
      definition = {
        edit = "<CR>",
        vsplit = "v",
        split = "s",
        tabe = "t",
        quit = "q",
        close = "<Esc>",
      },
      rename = {
        in_select = false,
        auto_save = true,
        keys = {
          quit = "<Esc>",
          exec = "<CR>",
        },
      },
      outline = {
        win_position = "right",
        win_width = 30,
        auto_preview = true,
        detail = true,
        auto_refresh = true,
        auto_close = true,
        close_after_jump = false,
        keys = {
          expand_collapse = "u",
          quit = "q",
          jump = "e",
        },
      },
      hover = {
        max_width = 0.6,
        open_link = "gx",
        open_cmd = "!xdg-open", -- or "silent !open" on macOS
      },
      diagnostic = {
        show_code_action = true,
        show_layout = "float",
        jump_num_shortcut = true,
        max_width = 0.7,
        keys = {
          exec_action = "o",
          quit = "q",
          expand_or_jump = "<CR>",
          toggle_mode = "m",
          toggle_preview = "P",
        },
      },
    })
  end,
}
