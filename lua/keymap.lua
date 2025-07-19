local utils = require('utils')
local key, cmd = utils.key, utils.cmd

key('n', '<esc>', cmd('nohl'), 'Clear search highlights')

vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste without yanking' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete without yanking' })

vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })

key('n', '<leader>q', vim.diagnostic.setqflist, 'Open diagnostic quickfix list')

-- Simpler splits
key('n', '<leader>-', cmd('split'), 'split window horizontally')
key('n', '<leader>\\', cmd('vsplit'), 'split window vertically')
