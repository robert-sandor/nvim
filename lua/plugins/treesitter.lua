return function()
  require('mini.deps').add({
    source = 'nvim-treesitter/nvim-treesitter',
    checkout = 'master',
    monitor = 'main',
    hooks = {
      post_checkout = function()
        vim.cmd('TSUpdate')
      end,
    },
  })

  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'vimdoc', 'yaml', 'regex' },
    highlight = { enable = true },
    indent = { enable = true },
  })
end
