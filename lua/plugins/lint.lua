return function()
  require('mini.deps').add('mfussenegger/nvim-lint')

  require('lint').linters_by_ft = {
    fish = { 'fish' },
  }

  vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost' }, {
    callback = function()
      require('lint').try_lint()
    end,
  })

  vim.keymap.set('n', '<leader>cl', require('lint').try_lint, { desc = 'code lint' })
end
