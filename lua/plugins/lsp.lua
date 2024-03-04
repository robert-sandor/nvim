return {
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
      { 'folke/neodev.nvim', opts = {} },
      'mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    opts = {
      servers = {
        ansiblels = {},
        bashls = {},
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
            },
          },
        },
        yamlls = {},
      },
    },
    config = function(_, opts)
      local servers = opts.servers
      local lsp_setup = function(server)
        require('lspconfig')[server].setup(servers[server] or {})
      end

      local ensure_installed = {}
      for server, _ in pairs(servers) do
        table.insert(ensure_installed, server)
      end
      require('mason-lspconfig').setup({ ensure_installed = ensure_installed, handlers = { lsp_setup } })

      local telescope_available, telescope_builtin = pcall(require, 'telescope.builtin')

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          local function map(mode, lhs, rhs, options)
            vim.tbl_extend('force', options, { buffer = ev.buf })
            vim.keymap.set(mode, lhs, rhs, options)
          end

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          map('n', 'K', vim.lsp.buf.hover, { desc = 'lsp hover' })
          map('n', '<leader>cr', vim.lsp.buf.rename, { desc = '[c]ode [r]ename' })
          map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = '[c]ode [a]ction' })
          map('n', 'gD', vim.lsp.buf.declaration, { desc = '[g]oto [D]eclaration' })

          map('n', 'gd', function()
            if telescope_available then
              telescope_builtin.lsp_definitions()
            else
              vim.lsp.buf.definition()
            end
          end, { desc = '[g]oto [d]efinition' })

          map('n', 'gi', function()
            if telescope_available then
              telescope_builtin.lsp_implementations()
            else
              vim.lsp.buf.implementation()
            end
          end, { desc = '[g]oto [i]mplementation' })

          map('n', 'gr', function()
            if telescope_available then
              telescope_builtin.lsp_references()
            else
              vim.lsp.buf.references()
            end
          end, { desc = '[g]oto [r]eferences' })

          -- map('n', '<leader>cs', vim.lsp.buf.signature_help, { desc = '[c]ode [s]ignature' })
          map('n', '<leader>ct', function()
            if telescope_available then
              telescope_builtin.lsp_type_definitions()
            else
              vim.lsp.buf.type_definition()
            end
          end, { desc = '[c]ode [t]ype definition' })
        end,
      })
    end,
  },
}
