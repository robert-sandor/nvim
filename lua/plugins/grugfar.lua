return function()
  require('mini.deps').add('MagicDuck/grug-far.nvim')

  require('grug-far').setup({})

  vim.keymap.set('n', '<leader>fr', function()
    require('grug-far').open()
  end, { desc = 'find and replace' })

  vim.keymap.set('x', '<leader>fr', function()
    require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>') } })
  end, { desc = 'find and replace' })
end
