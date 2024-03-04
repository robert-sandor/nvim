local augroup = vim.api.nvim_create_augroup("UserAutocommands", {})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = "highlight yanked text",
})
