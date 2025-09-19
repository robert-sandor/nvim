return function()
  require('mini.deps').add({ source = 'stevearc/oil.nvim' })

  require('oil').setup({
    columns = {
      'icon',
      'permissions',
    },
    view_options = {
      show_hidden = true,
    },
  })

  vim.keymap.set('n', '-', function()
    require('oil').open_float(nil, {
      preview = {
        vertical = true,
      },
    })
  end, { desc = 'Open parent directory' })
end
