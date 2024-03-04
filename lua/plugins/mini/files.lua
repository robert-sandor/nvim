return {
  "echasnovski/mini.files",
  version = "*",
  opts = {
    windows = {
      preview = true,
      width_focus = 30,
      width_preview = 50,
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), false)
      end,
      desc = "file [e]xplorer",
    },
    {
      "<leader>E",
      function()
        require("mini.files").open(nil, true)
      end,
      desc = "file [E]xplorer cwd",
    },
  },
}
