return function()
  local files = require('mini.files')
  files.setup({
    mappings = {
      close = '<esc>',
      go_in = '',
      go_in_plus = 'l',
      go_out = '',
      go_out_plus = 'h',
    },
    windows = {
      preview = true,
      max_number = 3,
      width_focus = 50,
      width_nofocus = 15,
      width_preview = 50,
    },
  })

  vim.keymap.set('n', '<leader>e', function()
    files.open(vim.api.nvim_buf_get_name(0), false)
  end, { desc = 'Open file manager' })
end
