require('snacks').setup({
  lazygit = { enabled = true },
  terminal = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
})

vim.keymap.set('n', '<leader>g', function() require('snacks').lazygit() end, { desc = 'Open Lazy[G]it' })

vim.keymap.set('n', '<leader>t', function() require('snacks').terminal.focus() end, { desc = 'Open [T]erminal' })
