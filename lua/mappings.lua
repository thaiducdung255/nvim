-- window cmds
---- nav cmds
Nmap(Keycodes.mappings.nav_right, '<C-w>l')
Nmap(Keycodes.mappings.nav_up, '<C-w>k')
Nmap(Keycodes.mappings.nav_down, '<C-w>j')
Nmap(Keycodes.mappings.nav_left, '<C-w>h')

---- resize window cmds
Nmap('<C-h>', ':vertical resize -2<CR>')
Nmap('<C-j>', ':resize -2<CR>')
Nmap('<C-k>', ':resize +2<CR>')
Nmap('<C-l>', ':vertical resize +2<CR>')

---- split cmds
Nmap('<LEADER>sj', ':split<CR>')
Nmap('<LEADER>sk', ':vsplit<CR>')
---------------------------------------------------------------------------------------------------

-- buffer cmds
Nmap('<S-l>',  ':bn<CR>')
Nmap('<S-h>',  ':bp<CR>')
Nmap('gq',     ':bd<CR>')
---------------------------------------------------------------------------------------------------

-- tabs cmds
Nmap('<LEADER>t', ':tabnew<CR>')
Nmap('<S-j>',     ':tabprev<CR>')
Nmap('<S-k>',     ':tabnext<CR>')
---------------------------------------------------------------------------------------------------

-- file cmds
Nmap('<LEADER>q', ':q<CR>')

-- terminal cmds
Tmap('<ESC>', '<C-\\><C-n>')
Nmap('<A-x>', 'a<C-c>')
---------------------------------------------------------------------------------------------------

-- system cmds
Nmap('<Tab>', 'n')
Nmap('<S-Tab>', 'N')

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
Nvmap('N', '<C-d>')
Nvmap('M', '<C-u>')

---- custom yank/select cmds
Nmap('<LEADER>v', 'v$h')

---- go to first/last position of a line
Nvmap('ga', '^')
Nvmap('gf', '$')

---- register
Nvmap('<LEADER>r', '@q')

---- toggle upper/lower/camel case
Imap(';u', '<ESC>vbUea')
Imap(';i', '<ESC>vbuea')
Imap(';o', '<ESC>b~ea')

---- bracket fix cmds
Nmap(';c', 'f`r\'f`r\'F\'')
Nmap(';v', 'f\'r`f\'r`F`')

---- auto pair brackets
Icmap(';j',  '()<left>')
Icmap(';k',  '[]<left>')
Icmap(';l',  '{}<left>')
Icmap(';h',  '<><left>')
Icmap(';\'', '``<left>')

---- insert brackets
Vmap('sj',  'di()<ESC>hpF(i')
Vmap('sk',  'di[]<ESC>hpl')
Vmap('sl',  'di{<space><space>}<ESC>hhpll')
Vmap('s;',  'di\'\'<ESC>hpl')
Vmap('s:',  'di""<ESC>hpl')
Vmap('s\'', 'di``<ESC>hpl')
Vmap('sh',  'di<><ESC>hpl')

---------------------------------------------------------------------------------------------------
