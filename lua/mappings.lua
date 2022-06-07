-- window cmds
---- nav cmds
Nmap(Keycodes.sys.nav.r, '<C-w>l')
Nmap(Keycodes.sys.nav.u, '<C-w>k')
Nmap(Keycodes.sys.nav.d, '<C-w>j')
Nmap(Keycodes.sys.nav.l, '<C-w>h')

---- resize window cmds
Nmap(Keycodes.sys.w_resize.v_desc, ':vertical resize -2<CR>')
Nmap(Keycodes.sys.w_resize.h_desc, ':resize -2<CR>')
Nmap(Keycodes.sys.w_resize.h_inc, ':resize +2<CR>')
Nmap(Keycodes.sys.w_resize.v_inc, ':vertical resize +2<CR>')

---- split cmds
Nmap(Keycodes.sys.w_split.h, ':split<CR>')
Nmap(Keycodes.sys.w_split.v, ':vsplit<CR>')
---------------------------------------------------------------------------------------------------
-- buffer cmds
Nmap(Keycodes.sys.buf.next, ':bn<CR>')
Nmap(Keycodes.sys.buf.prev, ':bp<CR>')
Nmap(Keycodes.sys.buf.del, ':bd<CR>')
---------------------------------------------------------------------------------------------------

-- tabs cmds
Nmap(Keycodes.sys.tab.new, ':tabnew<CR>')
Nmap(Keycodes.sys.tab.prev, ':tabprev<CR>')
Nmap(Keycodes.sys.tab.next, ':tabnext<CR>')
---------------------------------------------------------------------------------------------------

-- file cmds
Nmap(Keycodes.sys.file.quit, ':q<CR>')
Nmap(Keycodes.sys.file.write, ':write<CR>')

---- undo
Nmap(Keycodes.sys.file.undo, '<C-r>')

---- mru file nav cmds
Nmap(Keycodes.sys.file.next_pos, '<C-o>')
Nmap(Keycodes.sys.file.prev_pos, '<C-i>')

-- terminal cmds
Tmap(Keycodes.sys.term.esc, '<C-\\><C-n>')
-- Nmap('<A-x>', 'a<C-c>')
---------------------------------------------------------------------------------------------------

-- search nav cmds
Nmap(Keycodes.sys.search_nav.next, 'n')
Nmap(Keycodes.sys.search_nav.prev, 'N')

-- clipboard modify
Vmap(Keycodes.sys.clipboard.paste, '"_dP')
---------------------------------------------------------------------------------------------------

-- other cmds
---- cursor nav cmds
Imap(Keycodes.sys.cursor_nav.r, '<ESC>la')
Imap(Keycodes.sys.cursor_nav.l, '<ESC>i')

---- go to first/last position of a line
Nvmap(Keycodes.sys.cursor_nav.first, '^')
Nvmap(Keycodes.sys.cursor_nav.last, '$')

---- scroll cmds
Nvmap(Keycodes.sys.scroll.d, '<C-d>')
Nvmap(Keycodes.sys.scroll.u, '<C-u>')

---- custom select cmds
Nmap(Keycodes.sys.custom_super_v, 'V')
Nmap(Keycodes.sys.custom_V, 'v$h')

---- register
Nvmap(Keycodes.sys.register, '@q')

---- toggle upper/lower/camel case
Imap(Keycodes.sys.case_mod.upper, '<ESC>vbUea')
Imap(Keycodes.sys.case_mod.lower, '<ESC>vbuea')
Imap(Keycodes.sys.case_mod.pascal, '<ESC>b~ea')

---- qoutes change cmds
Nmap(Keycodes.sys.quote_mod.single, 'f`r\'f`r\'F\'')
Nmap(Keycodes.sys.quote_mod.template, 'f\'r`f\'r`F`')

---- auto pairs cmds
Icmap(Keycodes.sys.auto_pair.parent, '()<left>')
Icmap(Keycodes.sys.auto_pair.square, '[]<left>')
Icmap(Keycodes.sys.auto_pair.curly, '{}<left>')
Icmap(Keycodes.sys.auto_pair.angle, '<><left>')
Icmap(Keycodes.sys.auto_pair.temp_quote, '``<left>')
Imap(Keycodes.sys.auto_pair.temp_val, '${}<Left>')

---- insert brackets
Vmap(Keycodes.sys.bracket_ins.parent, 'di()<ESC>hpF(i')
Vmap(Keycodes.sys.bracket_ins.square, 'di[]<ESC>hpl')
Vmap(Keycodes.sys.bracket_ins.curly, 'di{<space><space>}<ESC>hhpll')
Vmap(Keycodes.sys.bracket_ins.s_quote, 'di\'\'<ESC>hpl')
Vmap(Keycodes.sys.bracket_ins.d_quote, 'di""<ESC>hpl')
Vmap(Keycodes.sys.bracket_ins.temp_quote, 'di``<ESC>hpl')
Vmap(Keycodes.sys.bracket_ins.angle, 'di<><ESC>hpl')

---------------------------------------------------------------------------------------------------
-- key mods
---- symbol maps
Imap(Keycodes.sys.symbol.exclamation, '!')
Imap(Keycodes.sys.symbol.at_sign, '@')
Imap(Keycodes.sys.symbol.sharp, '#')
Imap(Keycodes.sys.symbol.dollar, '$')
Imap(Keycodes.sys.symbol.percent, '%')
Imap(Keycodes.sys.symbol.power, '^')
Imap(Keycodes.sys.symbol._and, '&')
Imap(Keycodes.sys.symbol.star, '*')
Imap(Keycodes.sys.symbol.open_parent, '(')
Imap(Keycodes.sys.symbol.close_parent, ')')
Imap(Keycodes.sys.symbol.minus, '-')
Imap(Keycodes.sys.symbol.equal, '=')
Imap(Keycodes.sys.symbol.dangle, '_')
Imap(Keycodes.sys.symbol.plus, '+')
Imap(Keycodes.sys.symbol.nl, ',<CR>')
vim.cmd [[nnoremap <CR> :]]
vim.cmd [[vnoremap <CR> :]]

Nmap(Keycodes.sys.cmd_nav.mru, ':<Up>')
Cmap(Keycodes.sys.cmd_nav.l, '<Left>')
Cmap(Keycodes.sys.cmd_nav.next, '<C-n>')
Cmap(Keycodes.sys.cmd_nav.prev, '<C-p>')
Cmap(Keycodes.sys.cmd_nav.r, '<Right>')
