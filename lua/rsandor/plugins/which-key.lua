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
        ['<leader>b'] = { name = '[b]uffer' },
        ['<leader>c'] = { name = '[c]ode' },
        ['<leader>f'] = { name = '[f]ind' },
        ['<leader>h'] = { name = '[h]unk (git)' },
        ['<leader>t'] = { name = '[t]oggles' },
      })
    end,
  },
}
