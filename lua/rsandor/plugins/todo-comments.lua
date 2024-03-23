return {
  {
    'folke/todo-comments.nvim',
    dependencies = {
      'plenary.nvim',
      'folke/trouble.nvim',
      'nvim-telescope/telescope.nvim',
    },
    event = 'VeryLazy',
    opts = {
      signs = false,
    },
    keys = {
      { '<leader>ft', '<cmd>TodoTelescope<cr>', desc = 'find todos' },
      { '<leader>xt', '<cmd>TodoTrouble<cr>', desc = 'todos' },
    },
  },
}
