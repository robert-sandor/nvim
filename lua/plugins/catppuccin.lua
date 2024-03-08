return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        integrations = {
          cmp = true,
          flash = true,
          gitsigns = true,
          mason = true,
          treesitter = true,
          which_key = true,
        },
      })
      vim.cmd('colorscheme catppuccin-macchiato')
    end,
  },
}
