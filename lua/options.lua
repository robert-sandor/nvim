--------------------------------------------------------------------------------
-- Basic settings
--------------------------------------------------------------------------------
vim.g.mapleader = ' ' -- Set leader key to space
vim.g.maplocalleader = ' ' -- Set local leader key (NEW)

vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true -- Highlight current line
vim.opt.cursorlineopt = 'both' -- Highlight both current line and number
vim.opt.wrap = false -- Soft wrap when needed
vim.opt.scrolloff = 10 -- Keep 10 rows above/below cursor
vim.opt.sidescrolloff = 10 -- Keep 10 columns left/right cursor

-- Indentation settings
vim.opt.tabstop = 2 -- Tab width
vim.opt.shiftwidth = 2 -- Indent width
vim.opt.softtabstop = 2 -- Soft tab stop
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Case sensitive if uppercase in search
vim.opt.incsearch = true -- Show matches as you type

-- Visual settings
vim.opt.termguicolors = true -- Enable 24-bit colors
vim.opt.signcolumn = 'yes' -- Always show sign column
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.matchtime = 2 -- How long to show matching bracket
vim.opt.cmdheight = 1 -- Command line height
vim.opt.completeopt = 'menuone,noinsert,noselect' -- Completion options
vim.opt.showmode = false -- Don't show mode in command line
vim.opt.pumheight = 10 -- Popup menu height
vim.opt.conceallevel = 0 -- Don't hide markup
vim.opt.concealcursor = '' -- Don't hide cursor line markup
vim.opt.lazyredraw = true -- Don't redraw during macros

-- File handling
vim.opt.backup = false -- Don't create backup files
vim.opt.writebackup = false -- Don't create backup before writing
vim.opt.swapfile = false -- Don't create swap files
vim.opt.undofile = true -- Persistent undo
vim.opt.undodir = vim.fn.expand('~/.vim/undodir') -- Undo directory
vim.opt.updatetime = 250 -- Faster completion
vim.opt.timeoutlen = 300 -- Key timeout duration
vim.opt.ttimeoutlen = 0 -- Key code timeout
vim.opt.autoread = true -- Auto reload files changed outside vim
vim.opt.autowrite = false -- Don't auto save

-- Behavior settings
vim.opt.iskeyword:append('-') -- Treat dash as part of word
vim.opt.path:append('**') -- include subdirectories in search
vim.opt.mouse = 'a' -- Enable mouse support
vim.opt.clipboard:append('unnamedplus') -- Use system clipboard
vim.opt.encoding = 'UTF-8' -- Set encoding
vim.opt.inccommand = 'split'
vim.opt.confirm = true

-- Cursor settings
vim.opt.guicursor =
  'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175'

-- Folding settings
vim.opt.foldmethod = 'expr' -- Use expression for folding
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()' -- Use treesitter for folding
vim.opt.foldlevel = 99 -- Start with all folds open

-- Split behavior
vim.opt.splitbelow = true -- Horizontal splits go below
vim.opt.splitright = true -- Vertical splits go right

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- Diagnostics
vim.diagnostic.config({
  underline = { severity = vim.diagnostic.severity.ERROR },
  virtual_text = { current_line = true, spacing = 8 },
  float = { border = 'rounded' },
  signs = true,
  severity_sort = true,
})
