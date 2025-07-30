return function()
  require('mini.deps').add('folke/flash.nvim')

  require('flash').setup({})

  vim.keymap.set({ 'n', 'x', 'o' }, 's', require('flash').jump, { desc = 'flash' })
  vim.keymap.set('o', 'r', require('flash').remote, { desc = 'flash remote' })
end
