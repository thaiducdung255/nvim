-- window cmds
---- nav cmds
Nmap('<LEADER>l', '<C-w>l')
Nmap('<LEADER>k', '<C-w>k')
Nmap('<LEADER>j', '<C-w>j')
Nmap('<LEADER>h', '<C-w>h')

---- resize window cmds
Nmap('<C-h>', ':vertical resize -2<CR>')
Nmap('<C-j>', ':resize -2<CR>')
Nmap('<C-k>', ':resize +2<CR>')
Nmap('<C-l>', ':vertical resize +2<CR>')

---- split cmds
Nmap('<LEADER>sm', ':split<CR>')
Nmap('<LEADER>sn', ':vsplit<CR>')
---------------------------------------------------------------------------------------------------

-- buffer cmds
Nmap('<S-h>',  ':bn<CR>')
Nmap('<S-l>',  ':bp<CR>')
Nmap('gq',     ':bd<CR>')
---------------------------------------------------------------------------------------------------

-- tabs cmds
Nmap('<LEADER>t', ':tabnew<CR>')
Nmap('<S-j>',     ':tabprev<CR>')
Nmap('<S-k>',     ':tabnext<CR>')
---------------------------------------------------------------------------------------------------

-- file cmds
Nmap('<LEADER>q', ':q<CR>')
Nmap('<LEADER>w', ':w<CR>')

-- terminal cmds
Tmap('<ESC>', '<C-\\><C-n>')
---------------------------------------------------------------------------------------------------

-- system cmds
Nmap('<Tab>',     ';')
Nmap('<S-Tab>',   ',')
---- use system copy/paste shortcuts
--Nmap('<C-c>', '"+y<ESC>')
--Nmap('<C-v>', '"+p<ESC>')

Vmap('p', '"_dP')
---------------------------------------------------------------------------------------------------

-- other cmds
---- cursor nav cmds
Imap('kk', '<ESC>la')
Imap('jj', '<ESC>i')

---- undo cmds
Nmap('U', '<C-r>')

---- mru file nav cmds
Nmap('gn', '<C-o>')
Nmap('gm', '<C-i>')

---- scroll cmds
Nmap('N', '<C-d>')
Nmap('M', '<C-u>')

---- custom yank/select cmds
Nmap('<LEADER>v', 'v$h')
Nmap('Y',         'y$')

---- go to first/last position of a line
Nvmap('ga', '^')
Nvmap('gf', '$')

---- toggle upper/lower/camel case
Imap(';u', '<ESC>vbUea')
Imap(';i', '<ESC>vbuea')
Imap(';o', '<ESC>b~ea')

---- bracket fix cmds
Nmap(';c', 'f`r\'f`r\'F\'')
Nmap(';v', 'f\'r`f\'r`F`')

---- bracket delete cmds
Nmap(';;',  'f\'xf\'x')
Nmap(';:',  'f"xf"x')
Nmap(';\'', 'f`xf`x')
Nmap(';j',  'f)xF(x')
Nmap(';k',  'f]xF[x')
Nmap(';l',  'f}hxxF{xx')
Nmap(';h',  'f>xF<x')

---- auto pair brackets
Imap(';j', '()<left>')
Imap(';k', '[]<left>')
Imap(';l', '{}<left>')
Imap(';h', '<><left>')
Imap(';\'', '``<left>')

---- bracket navs
Nmap('gj',  'f(')
Nmap('gk',  'f[')
Nmap('gl',  'f{')
Nmap('g;',  'f\'')
Nmap('g:',  'f"')
Nmap('g\'', 'f`')
Nmap('gh',  'f<')

Nmap('gJ', 'f)')
Nmap('gK', 'f]')
Nmap('gL', 'f}')
Nmap('gH', 'f>')

---- insert brackets
Vmap('sj',  'di()<ESC>hpF(i')
Vmap('sk',  'di[]<ESC>hpl')
Vmap('sl',  'di{<space><space>}<ESC>hhpll')
Vmap('s;',  'di\'\'<ESC>hpl')
Vmap('s:',  'di""<ESC>hpl')
Vmap('s\'', 'di``<ESC>hpl')
Vmap('sh',  'di<><ESC>hpl')

---- edit brackets motion with t/T
Nmap('zj',  'ct)')
Nmap('zk',  'ct]')
Nmap('zl',  'ct}')
Nmap('z;',  'ct\'')
Nmap('z:',  'ct"')
Nmap('z\'', 'ct`')
Nmap('zh',  'ct>')

Nmap('zJ',  'cT)')
Nmap('zK',  'cT]')
Nmap('zL',  'cT}')
Nmap('z:',  'cT\'')
Nmap('z;',  'cT"')
Nmap('z\'', 'cT`')
Nmap('zH',  'cT>')

---- edit inside bracket cmds
Nmap('cj',  'f(ci(')
Nmap('ck',  'f[ci[')
Nmap('cl',  'f{ci{')
Nmap('c;',  'ci\'')
Nmap('c:',  'ci"')
Nmap('c\'', 'ci`')
Nmap('ch',  'f<ci<')

---- delete inside bracket cmds
Nmap('dj',  'f(di(')
Nmap('dk',  'f[di[')
Nmap('dl',  'f{di{')
Nmap('d;',  'di\'')
Nmap('d:',  'di"')
Nmap('d\'', 'di`')
Nmap('dh',  'f<di<')

---- select inside bracket cmds
Nmap('sj',  'f(vi(')
Nmap('sk',  'f[vi[')
Nmap('sl',  'f{vi{')
Nmap('s;',  'vi\'')
Nmap('s:',  'vi"')
Nmap('s\'', 'vi`')
Nmap('sh',  'f<vi<')
---------------------------------------------------------------------------------------------------
