return {
  {
    'stevearc/oil.nvim',
    enabled = false,
    opts = {
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      view_options = { show_hidden = true },
      float = { padding = 4 },
      keymaps = { ['q'] = { 'actions.close', mode = 'n' } },
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
