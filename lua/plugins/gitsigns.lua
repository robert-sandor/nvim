return {
    {
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        opts = {
            signcolumn = true,
            numhl = true,
            current_line_blame = true,
            on_attach = function(bufnr)
                local gs = require('gitsigns')

                local map = function(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { desc = desc, buffer = bufnr })
                end

                map('n', ']h', gs.next_hunk, 'next hunk')
                map('n', '[h', gs.prev_hunk, 'previous hunk')

                map({ 'n', 'v' }, '<leader>gs', gs.stage_hunk, '[g]it [s]tage')
                map({ 'n', 'v' }, '<leader>gr', gs.reset_hunk, '[g]it [r]eset')
                map('n', '<leader>gS', gs.stage_buffer, '[g]it [s]tage buffer')
                map('n', '<leader>gR', gs.reset_buffer, '[g]it [r]eset buffer')
                map('n', '<leader>gu', gs.undo_stage_hunk, '[g]it stage [u]ndo')
                map('n', '<leader>gp', gs.preview_hunk, '[g]it [p]review')
                map('n', '<leader>gb', function()
                    gs.blame_line({ full = true })
                end, '[g]it [b]lame')
            end,
        },
    },
}
