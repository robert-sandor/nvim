return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = function()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local null_ls = require("null-ls")

    return {
      sources = {
        -- Lua formatting
        null_ls.builtins.formatting.stylua,

        -- Go formatting
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.golines,

        -- Rust formatting
        null_ls.builtins.formatting.rustfmt,

        -- Bash formatting
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.code_actions.shellcheck,

        -- JS, TS, JSON, YAML, etc. formatting
        null_ls.builtins.formatting.prettier,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    }
  end,
}
