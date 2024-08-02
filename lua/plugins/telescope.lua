return {
  {
    'nvim-telescope/telescope.nvim',
    keys = {
      {
        '<leader>fh',
        function()
          require('telescope.builtin').help_tags()
        end,
        desc = 'Find Help',
      },
      {
        '<leader>fk',
        function()
          require('telescope.builtin').keymaps()
        end,
        desc = 'Find keymaps',
      },
    },
  },
}
