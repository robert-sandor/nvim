return {
  'echasnovski/mini.surround',
  opts = {
    mappings = {
      add = '<leader>sa',
      delete = '<leader>sd',
      find = '',
      find_left = '',
      highlight = '',
      replace = '<leader>sr',
      update_n_lines = '<leader>sn',
    },
  },
  keys = {
    { '<leader>sa', mode = { 'n', 'v' }, desc = '[s]urround [a]dd' },
    { '<leader>sd', desc = '[s]urround [d]elete' },
    { '<leader>sr', desc = '[s]urround [r]eplace' },
    { '<leader>sn', desc = '[s]urround update [n]_lines' },
  },
}
