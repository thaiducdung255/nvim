require('hop').setup({})

Nmap('f',                ':HopChar1CurrentLine<CR>')
Omap('f',                ':HopChar1CurrentLine<CR>')

Nmap('s',                ':HopChar2<CR>')
Omap('s',                ':HopChar2<CR>')

Nmap('<Leader>w',        ':HopWord<CR>')
Nmap('<Leader>d',        ':HopChar2<CR>')
Nmap('<Leader><Esc>',    ':HopLine<CR>')
Nmap('<Leader><Leader>', ':HopPattern<CR>')
