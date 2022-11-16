local map = require('_utils').map
local get_key_code = require('_utils').get_key_code

local keycodes = require('_keymap').sys

-- hot reload config
map('n', keycodes.config.hot_reload, ':luafile %<CR>')

-- window cmds
---- nav cmds
map('n', keycodes.nav.r, '<C-w>l')
map('n', keycodes.nav.u, '<C-w>k')
map('n', keycodes.nav.d, '<C-w>j')
map('n', keycodes.nav.l, '<C-w>h')

---- resize window cmds
map('n', keycodes.w_resize.h_desc, ':vertical resize -2<CR>')
map('n', keycodes.w_resize.h_inc, ':vertical resize +2<CR>')
map('n', keycodes.w_resize.v_desc, ':resize -2<CR>')
map('n', keycodes.w_resize.v_inc, ':resize +2<CR>')

---- split cmds
map('n', keycodes.w_split.h, ':split<CR>')
map('n', keycodes.w_split.v, ':vsplit<CR>')
---------------------------------------------------------------------------------------------------
-- buffer cmds
map('n', keycodes.buf.next, ':bn<CR>')
map('n', keycodes.buf.prev, ':bp<CR>')
map('n', keycodes.buf.del, ':bd<CR>')
---------------------------------------------------------------------------------------------------

-- tabs cmds
map('n', keycodes.tab.new, ':tabnew<CR>')
map('n', keycodes.tab.prev, ':tabprev<CR>')
map('n', keycodes.tab.next, ':tabnext<CR>')
---------------------------------------------------------------------------------------------------

-- file cmds
map('n', keycodes.file.quit, ':q<CR>')
map('n', keycodes.file.write, ':write<CR>')

---- undo
map('n', keycodes.file.undo, '<C-r>')

---- mru file nav cmds
map('n', keycodes.file.next_pos, '<C-o>')
map('n', keycodes.file.prev_pos, '<C-i>')

-- terminal cmds
map('t', keycodes.term.esc, '<C-\\><C-n>')
-- map('n', '<A-x>', 'a<C-c>')
---------------------------------------------------------------------------------------------------

-- search nav cmds
map('n', keycodes.search_nav.next, 'n')
map('n', keycodes.search_nav.prev, 'N')

-- clipboard modify
map('v', keycodes.clipboard.paste, '"_dP')
---------------------------------------------------------------------------------------------------

-- other cmds
---- go to first/last position of a line
map('nv', keycodes.cursor_nav.first, '^')
map('nv', keycodes.cursor_nav.last, '$')

---- custom select cmds
map('n', keycodes.custom_super_v, 'V')
map('n', keycodes.custom_V, 'v$h')

---- register
map('nv', keycodes.register.a, '@a')
map('nv', keycodes.register.d, '@d')
map('nv', keycodes.register.f, '@f')
map('nv', keycodes.register.g, '@g')
map('nv', keycodes.register.p, '@p')
map('nv', keycodes.register.q, '@q')
map('nv', keycodes.register.r, '@r')
map('nv', keycodes.register.s, '@s')
map('nv', keycodes.register.w, '@w')

---- toggle upper/lower/camel case
map('i', keycodes.case_mod.upper, '<ESC>vbUea')
map('i', keycodes.case_mod.lower, '<ESC>vbuea')
map('i', keycodes.case_mod.pascal, '<ESC>b~ea')

---- qoutes change cmds
map('n', keycodes.quote_mod.single, 'f`r\'f`r\'F\'')
map('n', keycodes.quote_mod.template, 'f\'r`f\'r`F`')

---- auto pairs cmds
map('ic', keycodes.auto_pair.parent, '()<left>')
map('ic', keycodes.auto_pair.square, '[]<left>')
map('ic', keycodes.auto_pair.curly, '{}<left>')
map('ic', keycodes.auto_pair.angle, '<><left>')
map('ic', keycodes.auto_pair.temp_quote, '``<left>')
map('i', keycodes.auto_pair.temp_val, '${}<Left>')

---- insert brackets
map('v', keycodes.bracket_ins.parent, 'di()<ESC>hpF(i')
map('v', keycodes.bracket_ins.square, 'di[]<ESC>hpl')
map('v', keycodes.bracket_ins.curly, 'di{<space><space>}<ESC>hhpll')
map('v', keycodes.bracket_ins.s_quote, 'di\'\'<ESC>hpl')
map('v', keycodes.bracket_ins.d_quote, 'di""<ESC>hpl')
map('v', keycodes.bracket_ins.temp_quote, 'di``<ESC>hpl')
map('v', keycodes.bracket_ins.angle, 'di<><ESC>hpl')

---------------------------------------------------------------------------------------------------
-- key mods
---- symbol maps
map('i', keycodes.symbol.nl, ',<CR>')

vim.cmd('nnoremap ' .. get_key_code(keycodes.symbol.cmd_nav.open) .. ' :')
vim.cmd('vnoremap ' .. get_key_code(keycodes.symbol.cmd_nav.open) .. ' :')

vim.cmd('nnoremap ' .. get_key_code(keycodes.cmd_nav.mru) .. ' :<Up>')

map('c', keycodes.cmd_nav.l, '<Left>')
map('c', keycodes.cmd_nav.next, '<C-n>')
map('c', keycodes.cmd_nav.prev, '<C-p>')
map('c', keycodes.cmd_nav.r, '<Right>')
