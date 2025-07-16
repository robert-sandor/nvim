return function()
  require('mini.deps').add({
    source = 'MeanderingProgrammer/render-markdown.nvim',
    depends = {
      'nvim-treesitter/nvim-treesitter',
      'echasnovski/mini.nvim',
    },
  })

  local md = require('render-markdown')
  md.setup({
    completions = { lsp = { enabled = true } },
  })

  vim.keymap.set('n', '<leader>mt', md.buf_toggle, { desc = 'toggle markdown rendering' })
end
