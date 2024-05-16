local u = require('rsandor.utils')

-- clear search
u.map({ 'i', 'n' }, '<esc>', '<cmd>nohl<cr><esc>', 'clear search highlight', {})

-- better paste
u.map({ 'n', 'x' }, '<leader>p', '"0p', 'paste last yanked', {})

-- better up/down
u.nxmap('j', "v:count == 0 ? 'gj' : 'j'", 'Down', { expr = true, silent = true })
u.nxmap('<Down>', "v:count == 0 ? 'gj' : 'j'", 'Down', { expr = true, silent = true })
u.nxmap('k', "v:count == 0 ? 'gk' : 'k'", 'Up', { expr = true, silent = true })
u.nxmap('<Up>', "v:count == 0 ? 'gk' : 'k'", 'Up', { expr = true, silent = true })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
u.nmap('n', "'Nn'[v:searchforward].'zv'", '', { expr = true })
u.map({ 'x', 'o' }, 'n', "'Nn'[v:searchforward]", '', { expr = true })
u.nmap('N', "'nN'[v:searchforward].'zv'", '', { expr = true })
u.map({ 'x', 'o' }, 'N', "'nN'[v:searchforward]", '', { expr = true })

-- better indenting
u.vmap('<', '<gv')
u.vmap('>', '>gv')

-- buffer
u.nmap('<leader>bn', '<cmd>enew<cr>', 'buffer new', {})

-- diagnostics
u.nmap('[d', vim.diagnostic.goto_prev, 'go to previous diagnostic message', {})
u.nmap(']d', vim.diagnostic.goto_next, 'go to next diagnostic message', {})

-- center line when scrolling up/down
u.nmap('<c-u>', '<c-u>zz', 'scroll half page up', {})
u.nmap('<c-d>', '<c-d>zz', 'scroll half page down', {})

-- quickly replace word under cursor
u.nmap('<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], 'change word under cursor', {})

--
u.nmap('<leader>oc', '<cmd>!code %<cr><cr>', 'open in vscode', {})
