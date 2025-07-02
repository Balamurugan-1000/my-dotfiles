return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle Diagnostics" },
    { "<leader>xw", "<cmd>Trouble diagnostics workspace<cr>", desc = "Workspace Diagnostics" },
    { "<leader>xd", "<cmd>Trouble diagnostics document<cr>", desc = "Document Diagnostics" },
    { "<leader>xq", "<cmd>Trouble quickfix<cr>", desc = "Quickfix" },
    { "<leader>xl", "<cmd>Trouble loclist<cr>", desc = "Location List" },
    { "gR", "<cmd>Trouble lsp toggle<cr>", desc = "LSP References" },
  },
  opts = {}, -- default options are fine
}
