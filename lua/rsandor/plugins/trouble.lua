return {
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = { 'Trouble', 'TroubleToggle' },
    opts = {
      auto_jump = true,
      focus = true,
    },
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'diagnostics' },
      { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.bug=0<cr>', desc = 'buffer diagnostics' },
      { '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = 'location list' },
      { '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = 'quickfix' },
      {
        '[q',
        function()
          if require('trouble').is_open('diagnostics') then
            require('trouble').prev('diagnostics')
          else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'previous trouble/quickfix item',
      },
      {
        ']q',
        function()
          if require('trouble').is_open('diagnostics') then
            require('trouble').next('diagnostics')
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'next trouble/quickfix item',
      },
    },
  },
}
