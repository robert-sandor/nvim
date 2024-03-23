return {
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      -- add configuration for servers - NOTE: these will not be installed automatically
      local server_configs = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = 'LuaJIT' },
              workspace = {
                checkThirdParty = false,
                library = {
                  '${3rd}/luv/library',
                  unpack(vim.api.nvim_get_runtime_file('', true)),
                },
              },
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      require('mason-lspconfig').setup({
        handlers = {
          function(server_name)
            local server_config = server_configs[server_name] or {}
            server_config.capabilities = vim.tbl_deep_extend('force', capabilities, server_config.capabilities or {})
            require('lspconfig')[server_name].setup(server_config)
          end,
        },
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          local nmap = require('rsandor.utils').nmap
          local builtin = require('telescope.builtin')

          nmap('K', vim.lsp.buf.hover, 'hover documentation', opts)

          nmap('gd', builtin.lsp_definitions, 'goto definition', opts)
          nmap('gi', builtin.lsp_implementations, 'goto implementation', opts)
          nmap('gr', builtin.lsp_references, 'goto references', opts)
          nmap('gD', vim.lsp.buf.declaration, 'goto Declaration', opts)

          nmap('<leader>cr', vim.lsp.buf.rename, 'code rename', opts)
          nmap('<leader>ca', vim.lsp.buf.code_action, 'code action', opts)
          nmap('<leader>ct', builtin.lsp_type_definitions, 'code type definition', opts)
          nmap('<leader>cd', builtin.lsp_document_symbols, 'code document symbols', opts)
          nmap('<leader>cw', builtin.lsp_dynamic_workspace_symbols, 'code workspace symbols', opts)
        end,
      })
    end,
  },
}
