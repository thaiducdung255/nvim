local function map(lhs, rhs, mode, opts)
   local options = { noremap = true, silent = true }
   local vimMode = mode
   if opts then options = vim.tbl_extend('force', options, opts) end
   if mode == nil then vimMode = 'n' end
   vim.api.nvim_set_keymap(vimMode, lhs, rhs, options)
end

function Nmap(lhs, rhs, opts)
   map(lhs, rhs, 'n', opts)
end

function Imap(lhs, rhs, opts)
   map(lhs, rhs, 'i', opts)
end

function Tmap(lhs, rhs, opts)
   map(lhs, rhs, 't', opts)
end

function Vmap(lhs, rhs, opts)
   map(lhs, rhs, 'v', opts)
end

function Inmap(lhs, rhs, opts)
   map(lhs, rhs, 'i', opts)
   map(lhs, rhs, 'n', opts)
end

function Nvmap(lhs, rhs, opts)
   map(lhs, rhs, 'n', opts)
   map(lhs, rhs, 'v', opts)
end

function Invmap(lhs, rhs, opts)
   map(lhs, rhs, 'n', opts)
   map(lhs, rhs, 'v', opts)
   map(lhs, rhs, 'i', opts)
end

DATA_PATH   = vim.fn.stdpath('data')
CACHE_PATH  = vim.fn.stdpath('cache')
