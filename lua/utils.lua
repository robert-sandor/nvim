local U = {}

U.map = function(mode, lhs, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  vim.keymap.set(mode, lhs, rhs, opts)
end

U.nmap = function(lhs, rhs, desc, opts)
  U.map('n', lhs, rhs, desc, opts)
end

U.vmap = function(lhs, rhs, desc, opts)
  U.map('v', lhs, rhs, desc, opts)
end

return U
