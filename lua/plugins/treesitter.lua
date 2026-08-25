-- Update registry when installed or updated
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then return end

    if name == 'nvim-treesitter' then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('TSUpdate')
      return
    end
  end,
})

local ts = require('nvim-treesitter')
ts.install({ 'bash', 'diff', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' })

local function ts_try_attach(buf, language)
  -- Exit if language is not available
  if not vim.treesitter.language.add(language) then return end
  vim.treesitter.start(buf, language)

  -- Enable TS-based indentation
  if vim.treesitter.query.get(language, 'indents') ~= nil then
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
end

local available_parsers = ts.get_available()
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local buf, language = args.buf, vim.treesitter.language.get_lang(args.match)
    if not language then return end

    local ts = require('nvim-treesitter')

    -- if parser is installed, try to attach
    if vim.tbl_contains(ts.get_installed('parsers'), language) then
      ts_try_attach(buf, language)
      return
    end

    -- if parser is not installed, install and then try to attach
    if vim.tbl_contains(available_parsers, language) then
      ts.install(language):await(function() ts_try_attach(buf, language) end)
      return
    end

    -- try to attach just in case
    ts_try_attach(buf, language)
  end,
})
