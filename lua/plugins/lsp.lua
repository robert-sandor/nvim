return function()
  require('mini.deps').add('neovim/nvim-lspconfig')

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(args)
      local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
      -- if client:supports_method('textDocument/implementation') then
      -- Create a keymap for vim.lsp.buf.implementation ...
      -- end
      -- Auto-format ("lint") on save.
      -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
      -- if
      --     not client:supports_method('textDocument/willSaveWaitUntil')
      --     and client:supports_method('textDocument/formatting')
      -- then
      --   vim.api.nvim_create_autocmd('BufWritePre', {
      --     group = vim.api.nvim_create_augroup('UserLspConfig', { clear = false }),
      --     buffer = args.buf,
      --     callback = function()
      --       vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
      --     end,
      --   })
      -- end
    end,
  })
end
