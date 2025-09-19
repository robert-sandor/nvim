return function()
  require('mini.deps').add('stevearc/conform.nvim')

  require('conform').setup({
    default_format_opts = { lsp_format = 'fallback', timeout_ms = 500 },
    formatters_by_ft = {
      fish = { 'fish_indent' },
      sh = { 'shfmt' },
      yaml = { 'prettierd' },
    },
    format_on_save = { timeout_ms = 500 },
  })

  vim.keymap.set('n', '<leader>cf', require('conform').format, { desc = 'code format' })
end
