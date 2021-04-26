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

function vmap(lhs, rhs, opts)
   map(lhs, rhs, 'v', opts)
end

function inmap(lhs, rhs, opts)
   map(lhs, rhs, 'i', opts)
   map(lhs, rhs, 'n', opts)
end

function nvmap(lhs, rhs, opts)
   map(lhs, rhs, 'n', opts)
   map(lhs, rhs, 'v', opts)
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
---------------------------------------------------------------------------------------------------

-- tabs cmds
---------------------------------------------------------------------------------------------------

-- file cmds
nmap('<leader>q', ':q<CR>')
nmap('<leader>w', ':w<CR>')
---------------------------------------------------------------------------------------------------

-- system cmds
---- use system copy/paste shortcuts
vmap('<C-c>', '"+y<ESC>')
vmap('<C-v>', '"+p<ESC>')
---------------------------------------------------------------------------------------------------

-- other
imap('kk', '<ESC>la')
imap('jj', '<ESC>i')

nmap('U', '<C-r>')

nmap('gn', '<C-o>')
nmap('gm', '<C-i>')

nmap('N', '<C-d>')
nmap('M', '<C-u>')

nmap('<leader>v', 'v$h')
nmap('Y', 'y$')

nvmap('ga', '^')
nvmap('gf', '$')
---------------------------------------------------------------------------------------------------
