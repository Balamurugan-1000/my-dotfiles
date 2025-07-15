return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
              },
            },
          },
        },

        -- Ruff for linting (fast and Django-aware)
        ruff = {},

        html = {

          filetypes = { "html", "htmldjango", "django-html" },
        },
        emmet_ls = {
          filetypes = {
            "html",
            "htmldjango",
            "django-html",
            "css",
            "javascript",
          },
        },
      },

      setup = {
        -- Optional: Custom init if needed
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "ruff",
        "emmet-ls",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "python",
        "html",
        "css",
        "javascript",
        "json",
      },
    },
  },
}
