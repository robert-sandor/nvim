require('lint').linters_by_ft = {
  fish = { 'fish' },
}

vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
  group = vim.api.nvim_create_augroup('custom-lint', { clear = true }),
  callback = function() require('lint').try_lint() end,
})
