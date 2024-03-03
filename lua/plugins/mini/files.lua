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
        require("mini.files").open()
      end,
      desc = "file [e]xplorer",
    },
  },
}
