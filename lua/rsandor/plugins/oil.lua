return {
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      -- 'nvim-tree/nvim-web-devicons',
      'echasnovski/mini.nvim',
    },
    keys = {
      { '-', '<cmd>Oil<cr>', desc = 'explore files - oil' },
    },
  },
}
