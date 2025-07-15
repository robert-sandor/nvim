return function()
  require('mini.deps').add({ source = 'catppuccin/nvim', name = 'catppuccin' })

  require('catppuccin').setup({
    integrations = {
      blink_cmp = true,
      gitsigns = true,
      mason = true,
      treesitter = true,
    },
  })

  vim.cmd('colorscheme catppuccin-mocha')
end
