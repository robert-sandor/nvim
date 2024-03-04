return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signcolumn = true,
    numhl = true,
    on_attach = function(bufnr)
      require("rsandor.util").load_keymaps(require("rsandor.keymap").gitsigns, { buffer = bufnr })
    end,
  },
}
