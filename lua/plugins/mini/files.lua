return {
  "echasnovski/mini.files",
  version = "*",
  opts = {
    mappings = {
      close = "<esc>",
      go_in = "L",
      go_in_plus = "l",
    },
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
        local mf = require("mini.files")
        if not mf.close() then
          mf.open(vim.api.nvim_buf_get_name(0), false)
        end
      end,
      desc = "file [e]xplorer",
    },
    {
      "<leader>E",
      function()
        local mf = require("mini.files")
        if not mf.close() then
          mf.open(nil, true)
        end
      end,
      desc = "file [E]xplorer cwd",
    },
  },
}
