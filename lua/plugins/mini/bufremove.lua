return {
  "echasnovski/mini.bufremove",
  version = "*",
  opts = {},
  keys = {
    {
      "<leader>bd",
      function()
        require("mini.bufremove").delete()
      end,
      desc = "[b]uffer [d]elete",
    },
  },
}
