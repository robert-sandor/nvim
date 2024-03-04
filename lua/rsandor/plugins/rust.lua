return {
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
    keys = require("rsandor.keymap").rust,
    config = function()
      local rt = require("rust-tools")
      local mason_registry = require("mason-registry")
      local codelldb = mason_registry.get_package("codelldb")
      local extension_path = codelldb:get_install_path() .. "/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

      rt.setup({
        dap = {
          adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
        },
        tools = {
          hover_actions = {
            auto_focus = true,
          },
        },
      })
    end,
  },
  {
    "saecki/crates.nvim",
    event = "BufRead Cargo.toml",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {},
    keys = require("rsandor.keymap").rust_crates,
  },
}
