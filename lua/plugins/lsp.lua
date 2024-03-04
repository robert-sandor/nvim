return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      { "folke/neodev.nvim", opts = {} },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
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
        require("lspconfig")[server].setup(servers[server] or {})
      end

      local ensure_installed = {}
      for server, _ in pairs(servers) do
        table.insert(ensure_installed, server)
      end
      require("mason-lspconfig").setup({ ensure_installed = ensure_installed, handlers = { lsp_setup } })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          local map = function(mode, lhs, rhs, options)
            vim.tbl_extend("force", options, { buffer = ev.buf })
            vim.keymap.set(mode, lhs, rhs, options)
          end

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          map("n", "K", vim.lsp.buf.hover, { desc = "lsp hover" })
          map("n", "gD", vim.lsp.buf.declaration, { desc = "[g]oto [D]eclaration" })
          map("n", "gd", vim.lsp.buf.definition, { desc = "[g]oto [d]efinition" })
          map("n", "gi", vim.lsp.buf.implementation, { desc = "[g]oto [i]mplementation" })
          map("n", "gr", vim.lsp.buf.references, { desc = "[g]oto [r]eferences" })
          map("n", "<leader>cs", vim.lsp.buf.signature_help, { desc = "[c]ode [s]ignature" })
          map("n", "<leader>ct", vim.lsp.buf.type_definition, { desc = "[c]ode [t]ype definition" })
          map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "[c]ode [r]ename" })
          map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[c]ode [a]ction" })
          map("n", "<leader>cf", function()
            vim.lsp.buf.format({ async = true })
          end, { desc = "[c]ode [f]ormat" })
        end,
      })
    end,
  },
}
