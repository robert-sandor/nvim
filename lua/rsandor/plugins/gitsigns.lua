return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    config = function()
      local u = require('rsandor.utils')
      local gitsigns = require('gitsigns')

      u.nmap('<leader>tb', gitsigns.toggle_current_line_blame, 'toggle current line blame')

      u.nmap('[h', gitsigns.prev_hunk, 'previous hunk')
      u.nmap(']h', gitsigns.next_hunk, 'next hunk')

      u.nmap('<leader>ghp', gitsigns.preview_hunk_inline, 'hunk preview')
      u.nmap('<leader>ghs', gitsigns.stage_hunk, 'hunk stage')
      u.nmap('<leader>ghS', gitsigns.stage_buffer, 'hunk stage buffer')
      u.nmap('<leader>ghr', gitsigns.reset_hunk, 'hunk reset')
      u.nmap('<leader>ghR', gitsigns.reset_buffer, 'hunk reset buffer')
      u.nmap('<leader>ghu', gitsigns.undo_stage_hunk, 'hunk stage undo')

      u.vmap('<leader>ghs', function()
        gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, 'hunk stage')
      u.vmap('<leader>ghr', function()
        gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, 'hunk stage')

      gitsigns.setup({
        signcolumn = true,
        numhl = true,
      })
    end,
  },
}
