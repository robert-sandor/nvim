require('conform').setup({
  format_on_save = { timeout_ms = 500 },
  default_format_opts = { lsp_format = 'fallback' },
  formatters_by_ft = {},
})

vim.keymap.set(
  { 'n', 'v' },
  '<leader>=',
  function() require('conform').format({ async = true }) end,
  { desc = '[=] Format buffer' }
)
