return {
  {
    'NeogitOrg/neogit',
    cmd = 'Neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = true,
    keys = {
      { '<leader>gs', '<cmd>Neogit<cr>', desc = '[g]it [s]tatus' },
      { '<leader>gc', '<cmd>Neogit commit<cr>', desc = '[g]it [c]ommit' },
    },
  },
}
