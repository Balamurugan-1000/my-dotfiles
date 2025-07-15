local M = {
  closed_buffers = {},
}

function M.on_buf_delete(bufnr)
  if vim.api.nvim_buf_is_valid(bufnr) then
    local name = vim.api.nvim_buf_get_name(bufnr)
    if name and name ~= "" and vim.fn.filereadable(name) == 1 then
      table.insert(M.closed_buffers, 1, name)
      if #M.closed_buffers > 10 then -- keep only last 10
        table.remove(M.closed_buffers)
      end
    end
  end
end

-- Called once to hook into all deletions
function M.setup_autocmd()
  vim.api.nvim_create_autocmd("BufDelete", {
    callback = function(args)
      M.on_buf_delete(args.buf)
    end,
  })
end

function M.reopen_last_buffer()
  local last = table.remove(M.closed_buffers, 1)
  if last then
    vim.cmd("edit " .. vim.fn.fnameescape(last))
  else
    vim.notify("No closed buffer to reopen", vim.log.levels.WARN)
  end
end

return M
