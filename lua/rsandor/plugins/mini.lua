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
      nmap('<leader>bd', bufremove.delete, '[b]uffer [d]elete')

      -- comments with gc
      require('mini.comment').setup()

      -- highlight word under cursor
      require('mini.cursorword').setup()

      -- file manager
      local files = require('mini.files')
      files.setup({
        mappings = {
          go_in = '',
          go_in_plus = 'l',
          go_out = '',
          go_out_plus = 'h',
        },
        windows = {
          preview = true,
          width_focus = 30,
          width_preview = 50,
        },
      })
      local function toggle_files(path, use_latest, opts)
        opts = opts or {}
        if not files.close() then
          files.open(path, use_latest, opts)
        end
      end

      nmap('<leader>e', function()
        toggle_files(vim.api.nvim_buf_get_name(0), false)
      end, '[e]xplore files')

      nmap('<leader>E', function()
        toggle_files(nil, true)
      end, '[e]xplore files cwd')

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
