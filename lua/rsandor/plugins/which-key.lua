return {
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      local wk = require('which-key')

      wk.setup({
        spelling = { enabled = false },
        window = {
          border = 'single',
          winblend = 10,
        },
      })

      wk.register({
        ['<leader>b'] = { name = 'buffer' },
        ['<leader>c'] = { name = 'code' },
        ['<leader>f'] = { name = 'find' },
        ['<leader>g'] = { name = 'git' },
        ['<leader>gh'] = { name = 'git hunk' },
        ['<leader>t'] = { name = 'toggles' },
        ['<leader>x'] = { name = 'trouble' },
      })
    end,
  },
}
