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
      { '<leader>gs', '<cmd>Neogit<cr>', desc = 'git status' },
      { '<leader>gc', '<cmd>Neogit commit<cr>', desc = 'git commit' },
    },
  },
}
