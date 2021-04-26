local function map(lhs, rhs, mode, opts)
   local options = { noremap = true, silent = true }
   local vimMode = mode
   if opts then options = vim.tbl_extend('force', options, opts) end
   if mode == nil then vimMode = 'n' end
   vim.api.nvim_set_keymap(vimMode, lhs, rhs, options)
end

function nmap(lhs, rhs, opts)
   map(lhs, rhs, 'n', opts)
end

function imap(lhs, rhs, opts)
   map(lhs, rhs, 'i', opts)
end

function tmap(lhs, rhs, opts)
   map(lhs, rhs, 't', opts)
end

function inmap(lhs, rhs, opts)
   map(lhs, rhs, 'i', opts)
   map(lhs, rhs, 'n', opts)
end

-- window cmds
---- nav cmds
nmap('<leader>l', '<C-w>l')
nmap('<leader>k', '<C-w>k')
nmap('<leader>j', '<C-w>j')
nmap('<leader>h', '<C-w>h')

---- split cmds
nmap('<leader>sm', ':split<CR>')
nmap('<leader>sn', ':vsplit<CR>')
---------------------------------------------------------------------------------------------------

-- buffer cmds

-- tabs cmds

-- file cmds
nmap('<leader>q', ':q<CR>')
nmap('<leader>w', ':w<CR>')
