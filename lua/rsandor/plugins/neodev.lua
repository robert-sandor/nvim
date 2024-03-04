return {
  "folke/neodev.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  opts = {},
  config = function()
    require("lspconfig").lua_ls.setup({
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })
  end,
}
