return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = false,

  dependencies = {
    "nvim-lua/plenary.nvim", -- Utility functions
    "nvim-tree/nvim-web-devicons", -- Icons (optional but recommended)
    "MunifTanjim/nui.nvim", -- UI components
  },

  opts = {
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = false,

    default_component_configs = {
      indent = {
        with_markers = true,
        indent_size = 2,
        padding = 1,
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "󰜌",
        default = "",
      },
      git_status = {
        symbols = {
          added = "✚",
          modified = "",
          deleted = "✖",
          renamed = "",
          untracked = "",
          ignored = "",
          unstaged = "",
          staged = "",
          conflict = "",
        },
      },
    },

    filesystem = {
      bind_to_cwd = true,
      cwd_target = {
        sidebar = "tab",
        current = "window",
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      use_libuv_file_watcher = true,

      hijack_netrw_behavior = "open_default",

      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          "node_modules",
          "__pycache__",
          ".DS_Store",
        },
        never_show = {
          ".git",
          ".idea",
        },
      },
    },
  },

  config = function(_, opts)
    require("neo-tree").setup(opts)

    -- 🔁 Auto-update Neo-tree root to project root on file open
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        local file = vim.fn.expand "%:p"
        if file == "" or vim.fn.isdirectory(file) == 1 then return end

        local root_markers = {
          ".git",
          "package.json",
          "pyproject.toml",
          "Cargo.toml",
        }

        local function find_project_root()
          for _, marker in ipairs(root_markers) do
            local match = vim.fn.finddir(marker, vim.fn.fnamemodify(file, ":h") .. ";")
            if match ~= "" then return vim.fn.fnamemodify(match, ":h") end
          end
          return vim.fn.fnamemodify(file, ":h")
        end

        local project_root = find_project_root()
        require("neo-tree.sources.manager").set_cwd(project_root)
      end,
    })
  end,
}
