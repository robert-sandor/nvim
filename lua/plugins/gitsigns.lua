return function()
  require('mini.deps').add('lewis6991/gitsigns.nvim')

  local on_attach = function(bufnr)
    local gitsigns = require('gitsigns')
    local bufkey = require('utils').buffer_keymap_function(bufnr)

    bufkey('n', '<leader>gp', gitsigns.preview_hunk_inline, 'Git preview hunk')
    bufkey('n', '<leader>gb', gitsigns.blame, 'Git blame')

    bufkey('n', '<leader>gs', gitsigns.stage_hunk, 'Git stage hunk')
    bufkey('n', '<leader>gr', gitsigns.reset_hunk, 'Git reset hunk')
    bufkey('n', '<leader>gS', gitsigns.stage_buffer, 'Git stage buffer')
    bufkey('n', '<leader>gR', gitsigns.reset_buffer, 'Git reset buffer')

    bufkey('v', '<leader>gs', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, 'Git stage hunk')
    bufkey('v', '<leader>gr', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, 'Git reset hunk')

    bufkey('n', '<leader>gtb', gitsigns.toggle_current_line_blame, 'Git toggle blame')
    bufkey('n', '<leader>gtb', gitsigns.toggle_word_diff, 'Git toggle word diff')

    bufkey({ 'o', 'x' }, 'ih', gitsigns.select_hunk, 'In hunk')

    table.insert(require('mini.clue').config.clues, { mode = 'n', keys = '<leader>g', desc = '+git' })
  end

  require('gitsigns').setup({
    signcolumn = true,
    numhl = true,
    on_attach = on_attach,
  })
end
