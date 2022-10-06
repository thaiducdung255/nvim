local map = require('_utils').map
local get_key_code = require('_utils').get_key_code

local keycodes = require('_keymap')

-- window cmds
---- nav cmds
map('n', keycodes.sys.nav.r, '<C-w>l')
map('n', keycodes.sys.nav.u, '<C-w>k')
map('n', keycodes.sys.nav.d, '<C-w>j')
map('n', keycodes.sys.nav.l, '<C-w>h')

---- resize window cmds
map('n', keycodes.sys.w_resize.h_desc, ':vertical resize -2<CR>')
map('n', keycodes.sys.w_resize.h_inc, ':vertical resize +2<CR>')
map('n', keycodes.sys.w_resize.v_desc, ':resize -2<CR>')
map('n', keycodes.sys.w_resize.v_inc, ':resize +2<CR>')

---- split cmds
map('n', keycodes.sys.w_split.h, ':split<CR>')
map('n', keycodes.sys.w_split.v, ':vsplit<CR>')
---------------------------------------------------------------------------------------------------
-- buffer cmds
map('n', keycodes.sys.buf.next, ':bn<CR>')
map('n', keycodes.sys.buf.prev, ':bp<CR>')
map('n', keycodes.sys.buf.del, ':bd<CR>')
---------------------------------------------------------------------------------------------------

-- tabs cmds
map('n', keycodes.sys.tab.new, ':tabnew<CR>')
map('n', keycodes.sys.tab.prev, ':tabprev<CR>')
map('n', keycodes.sys.tab.next, ':tabnext<CR>')
---------------------------------------------------------------------------------------------------

-- file cmds
map('n', keycodes.sys.file.quit, ':q<CR>')
map('n', keycodes.sys.file.write, ':write<CR>')

---- undo
map('n', keycodes.sys.file.undo, '<C-r>')

---- mru file nav cmds
map('n', keycodes.sys.file.next_pos, '<C-o>')
map('n', keycodes.sys.file.prev_pos, '<C-i>')

-- terminal cmds
map('t', keycodes.sys.term.esc, '<C-\\><C-n>')
-- map('n', '<A-x>', 'a<C-c>')
---------------------------------------------------------------------------------------------------

-- search nav cmds
map('n', keycodes.sys.search_nav.next, 'n')
map('n', keycodes.sys.search_nav.prev, 'N')

-- clipboard modify
map('v', keycodes.sys.clipboard.paste, '"_dP')
---------------------------------------------------------------------------------------------------

-- other cmds
---- cursor nav cmds
map('i', keycodes.sys.cursor_nav.r, '<ESC>la')
map('i', keycodes.sys.cursor_nav.l, '<ESC>i')

---- go to first/last position of a line
map('nv', keycodes.sys.cursor_nav.first, '^')
map('nv', keycodes.sys.cursor_nav.last, '$')

---- scroll cmds
map('nv', keycodes.sys.scroll.d, '<C-d>')
map('nv', keycodes.sys.scroll.u, '<C-u>')

---- custom select cmds
map('n', keycodes.sys.custom_super_v, 'V')
map('n', keycodes.sys.custom_V, 'v$h')

---- register
map('nv', keycodes.sys.register.a, '@a')
map('nv', keycodes.sys.register.d, '@d')
map('nv', keycodes.sys.register.f, '@f')
map('nv', keycodes.sys.register.g, '@g')
map('nv', keycodes.sys.register.p, '@p')
map('nv', keycodes.sys.register.q, '@q')
map('nv', keycodes.sys.register.r, '@r')
map('nv', keycodes.sys.register.s, '@s')
map('nv', keycodes.sys.register.w, '@w')

---- toggle upper/lower/camel case
map('i', keycodes.sys.case_mod.upper, '<ESC>vbUea')
map('i', keycodes.sys.case_mod.lower, '<ESC>vbuea')
map('i', keycodes.sys.case_mod.pascal, '<ESC>b~ea')

---- qoutes change cmds
map('n', keycodes.sys.quote_mod.single, 'f`r\'f`r\'F\'')
map('n', keycodes.sys.quote_mod.template, 'f\'r`f\'r`F`')

---- auto pairs cmds
map('ic', keycodes.sys.auto_pair.parent, '()<left>')
map('ic', keycodes.sys.auto_pair.square, '[]<left>')
map('ic', keycodes.sys.auto_pair.curly, '{}<left>')
map('ic', keycodes.sys.auto_pair.angle, '<><left>')
map('ic', keycodes.sys.auto_pair.temp_quote, '``<left>')
map('i', keycodes.sys.auto_pair.temp_val, '${}<Left>')

---- insert brackets
map('v', keycodes.sys.bracket_ins.parent, 'di()<ESC>hpF(i')
map('v', keycodes.sys.bracket_ins.square, 'di[]<ESC>hpl')
map('v', keycodes.sys.bracket_ins.curly, 'di{<space><space>}<ESC>hhpll')
map('v', keycodes.sys.bracket_ins.s_quote, 'di\'\'<ESC>hpl')
map('v', keycodes.sys.bracket_ins.d_quote, 'di""<ESC>hpl')
map('v', keycodes.sys.bracket_ins.temp_quote, 'di``<ESC>hpl')
map('v', keycodes.sys.bracket_ins.angle, 'di<><ESC>hpl')

---------------------------------------------------------------------------------------------------
-- key mods
---- symbol maps
map('i', keycodes.sys.symbol.exclamation, '!')
map('i', keycodes.sys.symbol.at_sign, '@')
map('i', keycodes.sys.symbol.sharp, '#')
map('i', keycodes.sys.symbol.dollar, '$')
map('i', keycodes.sys.symbol.percent, '%')
map('i', keycodes.sys.symbol.power, '^')
map('i', keycodes.sys.symbol._and, '&')
map('i', keycodes.sys.symbol.star, '*')
map('i', keycodes.sys.symbol.open_parent, '(')
map('i', keycodes.sys.symbol.close_parent, ')')
map('i', keycodes.sys.symbol.minus, '-')
map('i', keycodes.sys.symbol.equal, '=')
map('i', keycodes.sys.symbol.dangle, '_')
map('i', keycodes.sys.symbol.plus, '+')
map('i', keycodes.sys.symbol.nl, ',<CR>')
vim.cmd('nnoremap ' .. get_key_code(keycodes.sys.symbol.cmd_nav.open) .. ' :')
vim.cmd('vnoremap ' .. get_key_code(keycodes.sys.symbol.cmd_nav.open) .. ' :')

vim.cmd('nnoremap ' .. get_key_code(keycodes.sys.cmd_nav.mru) .. ' :<Up>')
map('c', keycodes.sys.cmd_nav.l, '<Left>')
map('c', keycodes.sys.cmd_nav.next, '<C-n>')
map('c', keycodes.sys.cmd_nav.prev, '<C-p>')
map('c', keycodes.sys.cmd_nav.r, '<Right>')
