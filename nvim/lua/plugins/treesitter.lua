return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "javascript",
      "typescript",
      "tsx", -- Only add tsx for JSX/TSX
    },

    highlight = {
      enable = true, -- Enable Treesitter highlighting
      additional_vim_regex_highlighting = false,
    },
  },
}
