return {
  {
    'folke/todo-comments.nvim',
    dependencies = { 'plenary.nvim' },
    event = 'VeryLazy',
    opts = {
      signs = false,
    },
    keys = {
      { '<leader>ft', '<cmd>TodoTelescope<cr>', desc = '[f]ind [t]odos' },
    },
  },
}
