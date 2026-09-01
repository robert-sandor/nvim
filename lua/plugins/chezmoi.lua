require('chezmoi').setup({})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { os.getenv('HOME') .. '/.local/share/chezmoi/*' },
  callback = function(ev)
    local bufnr = ev.buf
    vim.schedule(function() require('chezmoi.commands.__edit').watch(bufnr) end)
  end,
})
