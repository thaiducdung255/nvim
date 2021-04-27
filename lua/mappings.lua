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

-- other cmds
---- auto pair brackets
---- bracket navs
nmap('gj', 'f(')
nmap('gk', 'f[')
nmap('gl', 'f{')
nmap('g;', 'f\'')
nmap('g:', 'f"')
nmap('g\'', 'f`')
nmap('gh', 'f<')

nmap('gJ', 'f)')
nmap('gK', 'f]')
nmap('gL', 'f}')
nmap('gH', 'f>')

---- insert brackets
vmap('sj', 'di()<ESC>hpF(i')
vmap('sk', 'di[]<ESC>hpl')
vmap('sl', 'di{<space><space>}<ESC>hhpll')
vmap('s;', 'di\'\'<ESC>hpl')
vmap('s:', 'di""<ESC>hpl')
vmap('s\'', 'di``<ESC>hpl')
vmap('sh', 'di<><ESC>hpl')

---- edit brackets motion with t/T
nmap('zj', 'ct)')
nmap('zk', 'ct]')
nmap('zl', 'ct}')
nmap('z;', 'ct\'')
nmap('z:', 'ct"')
nmap('z\'', 'ct`')
nmap('zh', 'ct>')

nmap('zJ', 'cT)')
nmap('zK', 'cT]')
nmap('zL', 'cT}')
nmap('z:', 'cT\'')
nmap('z;', 'cT"')
nmap('z\'', 'cT`')
nmap('zH', 'cT>')
---------------------------------------------------------------------------------------------------
