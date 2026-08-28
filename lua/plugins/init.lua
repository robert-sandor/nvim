local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add({
  { src = gh('catppuccin/nvim'), name = 'catppuccin' },
  gh('nvim-mini/mini.nvim'),
  gh('folke/snacks.nvim'),
  gh('lewis6991/gitsigns.nvim'),
  gh('j-hui/fidget.nvim'),
  gh('neovim/nvim-lspconfig'),
  gh('stevearc/conform.nvim'),
  { src = gh('saghen/blink.cmp'), version = vim.version.range('1.*') },
  gh('mfussenegger/nvim-lint'),
  { src = gh('nvim-treesitter/nvim-treesitter'), version = 'main' },
  { src = gh('nvim-treesitter/nvim-treesitter-textobjects'), version = 'main' },
  gh('mfussenegger/nvim-ansible'), -- Specific to Ansible
  gh('b0o/SchemaStore.nvim'),
})

require('plugins.catppuccin')
require('plugins.mini')
require('plugins.snacks')
require('plugins.treesitter')
require('plugins.fidget')
require('plugins.conform')
require('plugins.lint')
require('plugins.blink')
