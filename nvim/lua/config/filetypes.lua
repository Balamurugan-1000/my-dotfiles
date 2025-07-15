-- lua/config/filetypes.lua
vim.filetype.add({
  pattern = {
    ["*/templates/.*%.html"] = "htmldjango",
  },
})
