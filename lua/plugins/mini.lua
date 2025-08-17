return function()
  require('mini.ai').setup({ n_lines = 100 })
  require('mini.diff').setup()
  require('mini.icons').setup()
  require('mini.indentscope').setup({ symbol = '▏', options = { try_as_border = true } })
  require('mini.move').setup()
  require('mini.pairs').setup()
  require('mini.statusline').setup()
  require('mini.surround').setup({
    mappings = {
      add = 'gsa',
      delete = 'gsd',
      find = 'gsf',
      find_left = 'gsF',
      highlight = 'gsh',
      replace = 'gsr',
      update_n_lines = 'gsn',
    },
  })

  local notify = require('mini.notify')
  notify.setup()
  vim.notify = notify.make_notify()
end
