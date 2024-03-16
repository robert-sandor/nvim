return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    config = function()
      local u = require('rsandor.utils')
      local gitsigns = require('gitsigns')

      u.nmap('<leader>tb', gitsigns.toggle_current_line_blame, '[t]oggle current line [b]lame')

      u.nmap('[c', gitsigns.prev_hunk, 'previous [c]hange')
      u.nmap(']c', gitsigns.next_hunk, 'next [c]hange')

      u.nmap('<leader>hp', gitsigns.preview_hunk_inline, '[h]unk [p]review')
      u.nmap('<leader>hs', gitsigns.stage_hunk, '[h]unk [s]tage')
      u.nmap('<leader>hS', gitsigns.stage_buffer, '[h]unk [s]tage buffer')
      u.nmap('<leader>hr', gitsigns.reset_hunk, '[h]unk [r]eset')
      u.nmap('<leader>hr', gitsigns.reset_buffer, '[h]unk [r]eset buffer')
      u.nmap('<leader>hu', gitsigns.undo_stage_hunk, '[h]unk stage [u]ndo')

      u.vmap('<leader>hs', function()
        gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, '[h]unk [s]tage')
      u.vmap('<leader>hr', function()
        gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, '[h]unk [s]tage')

      gitsigns.setup({
        signcolumn = true,
        numhl = true,
      })
    end,
  },
}
