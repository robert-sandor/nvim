return {
  {
    'NeogitOrg/neogit',
    cmd = 'Neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed, not both.
      'nvim-telescope/telescope.nvim', -- optional
    },
    config = true,
    keys = {
      { '<leader>gs', '<cmd>Neogit<cr>', desc = '[g]it [s]tatus' },
      { '<leader>gc', '<cmd>Neogit commit<cr>', desc = '[g]it [c]ommit' },
    },
  },
}
