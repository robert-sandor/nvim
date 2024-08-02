return {
  {
    'stevearc/oil.nvim',
    opts = {
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 4,
      },
    },
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    keys = {
      {
        '-',
        function()
          require('oil').open_float()
        end,
        desc = 'Oil',
      },
    },
  },
}
