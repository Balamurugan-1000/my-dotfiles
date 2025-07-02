return {
  "akinsho/toggleterm.nvim",
  keys = {
    {
      "<A-1>",
      function()
        require("toggleterm.terminal").Terminal:new({ count = 1 }):toggle()
      end,
      desc = "ToggleTerm 1",
    },
    {
      "<A-2>",
      function()
        require("toggleterm.terminal").Terminal:new({ count = 2 }):toggle()
      end,
      desc = "ToggleTerm 2",
    },
    {
      "<A-3>",
      function()
        require("toggleterm.terminal").Terminal:new({ count = 3 }):toggle()
      end,
      desc = "ToggleTerm 3",
    },
    {
      "<A-4>",
      function()
        require("toggleterm.terminal").Terminal:new({ count = 4 }):toggle()
      end,
      desc = "ToggleTerm 4",
    },
    {
      "<A-5>",
      function()
        require("toggleterm.terminal").Terminal:new({ count = 5 }):toggle()
      end,
      desc = "ToggleTerm 5",
    },
  },
  opts = {
    direction = "float", -- You can also set it to "horizontal", "vertical", or "tab"
    open_mapping = nil, -- We override mappings manually
    shade_terminals = true,
    start_in_insert = true,
    persist_size = true,
    persist_mode = true,
    shell = vim.o.shell,
  },
}
