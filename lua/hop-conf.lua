local hop = require('hop')

hop.setup({
   keys = 'asdfghjkl;zxcvnm,.qweruiop'
})

Nmap('<Leader>s',        ':HopChar1<CR>')
Nmap('<Leader>w',        ':HopWord<CR>')
Nmap('<Leader>d',        ':HopChar2<CR>')
Nmap('<Leader><Esc>',    ':HopLine<CR>')
Nmap('<Leader><Leader>', ':HopPattern<CR>')
