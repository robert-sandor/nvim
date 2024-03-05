local map = vim.keymap.set

-- clear search
map({ 'i', 'n' }, '<esc>', '<cmd>nohl<cr><esc>', { desc = 'clear search highlight' })

-- better up/down
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true })
map('x', 'n', "'Nn'[v:searchforward]", { expr = true })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true })
map('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true })
map('x', 'N', "'nN'[v:searchforward]", { expr = true })
map('o', 'N', "'nN'[v:searchforward]", { expr = true })

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- buffer
map('n', '<leader>bn', '<cmd>enew<cr>', { desc = '[b]uffer [n]ew' })
