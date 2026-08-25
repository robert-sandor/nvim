require('fzf-lua').setup()

vim.keymap.set('n', '<leader>f', '<cmd>FzfLua files<CR>', { desc = 'Open [F]ile picker' })
vim.keymap.set('n', '<leader>b', '<cmd>FzfLua buffers<CR>', { desc = 'Open [B]uffer picker' })
vim.keymap.set('n', '<leader>/', '<cmd>FzfLua live_grep<CR>', { desc = '[/] Global search in workspace' })
