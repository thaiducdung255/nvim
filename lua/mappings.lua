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

-- window cmds
---- nav cmds
Nmap('<leader>l', '<C-w>l')
Nmap('<leader>k', '<C-w>k')
Nmap('<leader>j', '<C-w>j')
Nmap('<leader>h', '<C-w>h')

---- split cmds
Nmap('<leader>sm', ':split<CR>')
Nmap('<leader>sn', ':vsplit<CR>')
---------------------------------------------------------------------------------------------------

-- buffer cmds
---------------------------------------------------------------------------------------------------

-- tabs cmds
---------------------------------------------------------------------------------------------------

-- file cmds
Nmap('<leader>q', ':q<CR>')
Nmap('<leader>w', ':w<CR>')
---------------------------------------------------------------------------------------------------

-- system cmds
---- use system copy/paste shortcuts
Nmap('<C-c>', '"+y<ESC>')
Nmap('<C-v>', '"+p<ESC>')
---------------------------------------------------------------------------------------------------

-- other
Nmap('kk', '<ESC>la')
Nmap('jj', '<ESC>i')

Nmap('U', '<C-r>')

Nmap('gn', '<C-o>')
Nmap('gm', '<C-i>')

Nmap('N', '<C-d>')
Nmap('M', '<C-u>')

Nmap('<leader>v', 'v$h')
Nmap('Y', 'y$')

Nvmap('ga', '^')
Nvmap('gf', '$')
---------------------------------------------------------------------------------------------------

-- other cmds
---- auto pair brackets
---- bracket navs
Nmap('gj', 'f(')
Nmap('gk', 'f[')
Nmap('gl', 'f{')
Nmap('g;', 'f\'')
Nmap('g:', 'f"')
Nmap('g\'', 'f`')
Nmap('gh', 'f<')

Nmap('gJ', 'f)')
Nmap('gK', 'f]')
Nmap('gL', 'f}')
Nmap('gH', 'f>')

---- insert brackets
Vmap('sj', 'di()<ESC>hpF(i')
Vmap('sk', 'di[]<ESC>hpl')
Vmap('sl', 'di{<space><space>}<ESC>hhpll')
Vmap('s;', 'di\'\'<ESC>hpl')
Vmap('s:', 'di""<ESC>hpl')
Vmap('s\'', 'di``<ESC>hpl')
Vmap('sh', 'di<><ESC>hpl')

---- edit brackets motion with t/T
Nmap('zj', 'ct)')
Nmap('zk', 'ct]')
Nmap('zl', 'ct}')
Nmap('z;', 'ct\'')
Nmap('z:', 'ct"')
Nmap('z\'', 'ct`')
Nmap('zh', 'ct>')

Nmap('zJ', 'cT)')
Nmap('zK', 'cT]')
Nmap('zL', 'cT}')
Nmap('z:', 'cT\'')
Nmap('z;', 'cT"')
Nmap('z\'', 'cT`')
Nmap('zH', 'cT>')
---------------------------------------------------------------------------------------------------
