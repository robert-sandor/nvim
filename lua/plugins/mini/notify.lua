return {
  'echasnovski/mini.notify',
  event = 'VeryLazy',
  opts = {},
  config = function(_, opts)
    require('mini.notify').setup(opts)
    vim.notify = require('mini.notify').make_notify()
  end,
}
