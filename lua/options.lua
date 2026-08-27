-- Experimental: Enables compiled lua module loading for faster startup
vim.loader.enable()

-- Set leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable number column and relative number
vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Disable showing the mode, statusbard will show it
vim.o.showmode = false

-- Indent wrapped lines
vim.o.breakindent = true

-- Persist undo history
vim.o.undofile = true

-- Case-insensitive smart search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Always keep space for sign column
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Display some whitespace characters - see ':help listchars'
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Live preview substitutions
vim.o.inccommand = 'split'

-- Highlights the line the cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Ask to save unsaved files on quit
vim.o.confirm = true

-- Set default floating window borders
vim.o.winborder = 'rounded'

-- TODO: complete this when we actually have diagnostics
-- Configure diagnostics
vim.diagnostic.config({
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },
  virtual_text = true,

  -- Open a floating window with the error on jump
  jump = {
    on_jump = function(_, bufnr) vim.diagnostic.open_float({ bufnr = bufnr, scope = 'cursor', focus = false }) end,
  },
})
