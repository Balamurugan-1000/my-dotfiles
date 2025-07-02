return {
  -- 🔍 Telescope core
  {
    "nvim-telescope/telescope.nvim",
    version = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    cmd = "Telescope",
    keys = {
      -- 🗂 Files & Search
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep (Live)" },
      { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Find Word Under Cursor" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
      { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
      { "<leader>fr", "<cmd>Telescope resume<cr>", desc = "Resume Last Search" },

      -- 🔍 Developer Tools
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
      { "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace Symbols" },
      { "<leader>fi", "<cmd>Telescope lsp_implementations<cr>", desc = "LSP Implementations" },
      { "<leader>frf", "<cmd>Telescope lsp_references<cr>", desc = "References" },
      { "<leader>fD", "<cmd>Telescope lsp_definitions<cr>", desc = "Definitions" },
      { "<leader>ft", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Type Definitions" },

      -- 🔄 Git
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },
      { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },

      -- 📂 File Browser (if installed)

      -- 🕘 Undo Tree (if installed)
      { "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Undo History" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = "horizontal",
          sorting_strategy = "ascending",
          layout_config = {
            prompt_position = "top",
          },
        },
      })
      -- Load native FZF extension if installed
      pcall(require("telescope").load_extension, "fzf")
    end,
  },

  -- 🚀 Native FZF sorter (requires make)
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = function()
      return vim.fn.executable("make") == 1
    end,
  },

  -- 📁 File browser

  -- 🔂 Undo tree powered by Telescope
  {
    "debugloop/telescope-undo.nvim",
    config = function()
      require("telescope").load_extension("undo")
    end,
    keys = {
      { "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Undo History" },
    },
  },
}
