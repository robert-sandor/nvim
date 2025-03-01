return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  event = {
    'BufReadPre ' .. vim.fn.expand('~') .. '/dev/notes/*.md',
    'BufNewFile ' .. vim.fn.expand('~') .. '/dev/notes/*.md',
  },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    workspaces = {
      {
        name = 'notes',
        path = '~/dev/notes',
      },
    },
  },
}
