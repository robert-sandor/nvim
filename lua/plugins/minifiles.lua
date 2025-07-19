return function()
  local files = require('mini.files')
  files.setup({
    mappings = {
      close = 'q',
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
    local path = vim.api.nvim_buf_get_name(0)
    path = vim.uv.fs_stat(path) and path or ''
    files.open(path, false)
  end, { desc = 'Open file manager' })
end
