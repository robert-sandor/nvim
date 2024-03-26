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
          lsp_trouble = true,
          mason = true,
          mini = { enabled = true, indentscope_color = 'peach' },
          neogit = true,
          telescope = { enabled = true, style = 'nvchad' },
          treesitter = true,
          treesitter_context = true,
          which_key = true,
        },
      })
      vim.cmd('colorscheme catppuccin-macchiato')
    end,
  },
}
