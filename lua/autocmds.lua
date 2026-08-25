-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- Start terminal mode in insert
vim.api.nvim_create_autocmd('TermOpen', { pattern = '*', callback = function() vim.cmd('startinsert') end })

-- Autoclose terminal on success code
vim.api.nvim_create_autocmd('TermClose', {
  pattern = '*',
  callback = function(args)
    if vim.v.event.status == 0 then vim.api.nvim_buf_delete(args.buf, {}) end
  end,
})
