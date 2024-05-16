return {
  {
    'echasnovski/mini.nvim',
    version = '*',
    lazy = false,
    config = function()
      local nmap = require('rsandor.utils').nmap

      -- add more textobjects
      require('mini.ai').setup({ n_lines = 500 })

      -- delete buffers with <leader>bd
      local bufremove = require('mini.bufremove')
      bufremove.setup()
      nmap('<leader>bd', bufremove.delete, 'buffer delete')

      -- highlight word under cursor
      require('mini.cursorword').setup()

      -- show current indent
      local indentscope = require('mini.indentscope')
      indentscope.setup({
        symbol = '▏',
        draw = {
          delay = 100,
          animation = function()
            return 5
          end,
        },
        options = {
          try_as_border = true,
        },
      })

      -- move text around with Alt-hjkl
      require('mini.move').setup()

      -- notifications
      local notify = require('mini.notify')
      notify.setup()
      vim.notify = notify.make_notify()

      -- automatically add paren pairs
      require('mini.pairs').setup()

      -- splitjoin
      require('mini.splitjoin').setup()

      -- statusline
      require('mini.statusline').setup()

      -- surround
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
    end,
  },
}
