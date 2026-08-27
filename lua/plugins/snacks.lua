require('snacks').setup({
  picker = { enabled = true },
  lazygit = { enabled = true },
  terminal = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
})

vim.keymap.set('n', '<leader>f', function() require('snacks').picker.files() end, { desc = 'Open [F]ile picker' })
vim.keymap.set('n', '<leader>b', function() require('snacks').picker.buffers() end, { desc = 'Open [B]uffer picker' })
vim.keymap.set(
  'n',
  '<leader>/',
  function() require('snacks').picker.grep() end,
  { desc = '[/] Global search in workspace' }
)

vim.keymap.set('n', '<leader>g', function() require('snacks').lazygit() end, { desc = 'Open Lazy[G]it' })

vim.keymap.set('n', '<leader>t', function() require('snacks').terminal.focus() end, { desc = 'Open [T]erminal' })
