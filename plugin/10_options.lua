-- General ====================================================================
vim.g.mapleader = ' ' -- Use `<Space>` as <Leader> key

vim.o.mouse = 'a' -- Enable mouse
vim.o.mousescroll = 'ver:1,hor:6' -- Customize mouse scroll
vim.o.switchbuf = 'usetab' -- Use already opened buffers when switching
vim.o.undofile = true -- Enable persistent undo
vim.o.confirm = true -- Enable confimation for abandoning buffers, and others

vim.o.shada = "'100,<50,s10,:1000,/100,@100,h" -- Limit ShaDa file (for startup)

-- Enable all filetype plugins and syntax (if not enabled, for better startup)
vim.cmd('filetype plugin indent on')
if vim.fn.exists('syntax_on') ~= 1 then
  vim.cmd('syntax enable')
end

-- UI =========================================================================
vim.o.breakindent = true -- Indent wrapped lines to match line start
vim.o.breakindentopt = 'list:-1' -- Add padding for lists (if 'wrap' is set)
vim.o.colorcolumn = '+1' -- Draw column on the right of maximum width
vim.o.cursorline = true -- Enable current line highlighting
vim.o.cursorlineopt = 'screenline,number' -- Show cursor line per screen line
vim.o.linebreak = true -- Wrap lines at 'breakat' (if 'wrap' is set)
vim.o.list = true -- Show helpful text indicators
vim.o.number = true -- Show line numbers
vim.o.pumheight = 10 -- Make popup menu smaller
vim.o.relativenumber = true -- Show relative line numbers
vim.o.ruler = false -- Don't show cursor coordinates
vim.o.shortmess = 'CFOSWaco' -- Disable some built-in completion messages
vim.o.showmode = false -- Don't show mode in command line
vim.o.signcolumn = 'yes' -- Always show signcolumn (less flicker)
vim.o.splitbelow = true -- Horizontal splits will be below
vim.o.splitkeep = 'screen' -- Reduce scroll during window split
vim.o.splitright = true -- Vertical splits will be to the right
vim.o.winborder = 'single' -- Use border in floating windows
vim.o.wrap = false -- Don't visually wrap lines (toggle with \w)

-- Special UI symbols. More is set via 'mini.basics' later.
vim.o.fillchars = 'eob: ,fold:╌'
vim.o.listchars = 'extends:…,nbsp:␣,precedes:…,tab:> '

-- Folds (see `:h fold-commands`, `:h zM`, `:h zR`, `:h zA`, `:h zj`)
vim.o.foldlevel = 10 -- Fold nothing by default; set to 0 or 1 to fold
vim.o.foldmethod = 'indent' -- Fold based on indent level
vim.o.foldnestmax = 10 -- Limit number of fold levels
vim.o.foldtext = '' -- Show text under fold with its highlighting

-- Editing ====================================================================
vim.o.autoindent = true -- Use auto indent
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.formatoptions = 'rqnl1j' -- Improve comment editing
vim.o.ignorecase = true -- Ignore case during search
vim.o.incsearch = true -- Show search matches while typing
vim.o.infercase = true -- Infer case in built-in completion
vim.o.scrolloff = 10 -- Keep rows above and below cursor
vim.o.shiftwidth = 2 -- Use this number of spaces for indentation
vim.o.showmatch = true -- Show matching brackets
vim.o.matchtime = 2 -- How long to show matching brackets
vim.o.sidescrolloff = 10 -- Keep columns to the left and right of cursor
vim.o.smartcase = true -- Respect case if search pattern has upper case
vim.o.smartindent = true -- Make indenting smart
vim.o.spelloptions = 'camel' -- Treat camelCase word parts as separate words
vim.o.tabstop = 2 -- Show tab as this number of spaces
vim.o.virtualedit = 'block' -- Allow going past end of line in blockwise mode

-- Pattern for a start of numbered list (used in `gw`). This reads as
-- "Start of list item is: at least one special character (digit, -, +, *)
-- possibly followed by punctuation (. or `)`) followed by at least one space".
vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]

-- Built-in completion
vim.o.complete = '.,w,b,kspell' -- Use less sources
vim.o.completeopt = 'menuone,noselect,fuzzy,nosort' -- Use custom behavior

-- Autocommands ===============================================================

-- Don't auto-wrap comments and don't insert comment leader after hitting 'o'.
-- Do on `FileType` to always override these changes from filetype plugins.
_G.Config.new_autocmd('FileType', nil, function()
  vim.cmd('setlocal formatoptions-=c formatoptions-=o')
end, "Proper 'formatoptions'")

_G.Config.new_autocmd('VimResized', nil, function()
  vim.cmd('wincmd =')
end, 'Equalize splits on window resized')

-- There are other autocommands created by 'mini.basics'. See 'plugin/30_mini.lua'.

-- Diagnostics ================================================================

-- Neovim has built-in support for showing diagnostic messages. This configures
-- a more conservative display while still being useful.
-- See `:h vim.diagnostic` and `:h vim.diagnostic.config()`.
-- Use `later()` to avoid sourcing `vim.diagnostic` on startup
require('mini.deps').later(function()
  vim.diagnostic.config({
    -- Show signs on top of any other sign, but only for warnings and errors
    signs = { priority = 9999, severity = { min = 'WARN', max = 'ERROR' } },

    -- Show all diagnostics as underline (for their messages type `<Leader>ld`)
    underline = { severity = { min = 'HINT', max = 'ERROR' } },

    -- Show more details immediately for errors on the current line
    virtual_lines = false,
    virtual_text = {
      current_line = true,
      severity = { min = 'WARN', max = 'ERROR' },
    },

    -- Don't update diagnostics when typing
    update_in_insert = false,
  })
end)

-- Filetypes
vim.filetype.add({
  pattern = {
    -- docker compose files
    ['.*%.?docker-compose%.ya?ml'] = 'yaml.docker-compose',
    ['.*%.?compose%.ya?ml'] = 'yaml.docker-compose',
    -- Ansible
    ['.*/defaults/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/host_vars/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/group_vars/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/group_vars/.*/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/playbook.*%.ya?ml'] = 'yaml.ansible',
    ['.*/playbooks/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/roles/.*/tasks/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/roles/.*/handlers/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/tasks/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/molecule/.*%.ya?ml'] = 'yaml.ansible',
  },
})
