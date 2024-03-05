-- some initial settings
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.termguicolors = true

-- General settings
vim.o.undofile = true
vim.o.undolevels = 10000
vim.o.backup = false
vim.o.writebackup = false
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'

-- Enable all filetype plugins
vim.cmd('filetype plugin indent on')

-- UI settings
vim.o.breakindent = true
vim.o.confirm = true
vim.o.cursorline = true
vim.o.fillchars = 'eob: '
vim.o.linebreak = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.splitbelow = true
vim.o.splitright = true

vim.o.pumblend = 10
vim.o.pumheight = 10

vim.o.scrolloff = 10
vim.o.sidescrolloff = 10

vim.o.showmode = false

-- Formatting
vim.o.formatoptions = 'jcroqlnt'

-- Tabs and spaces
vim.o.expandtab = true
vim.o.shiftround = true
vim.o.shiftwidth = 2

-- Editing
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.infercase = true
vim.o.smartcase = true
vim.o.smartindent = true

-- Completions
vim.o.completeopt = 'menu,menuone,noinsert'

-- Termguicolors
vim.o.termguicolors = true

-- Folds
vim.o.foldmethod = 'indent'
vim.o.foldlevel = 99
