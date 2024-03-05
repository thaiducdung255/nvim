local map = require('_utils').map

local keycodes = {
   symbol = {
      cmd_nav = {
         open = '<CR>',
      },
      nl = ',,',
   },
   w_nav = {
      r = '<LEADER>i',
      l = '<LEADER>h',
      u = '<LEADER>e',
      d = '<LEADER>n'
   },
   w_split = {
      v = '<LEADER>se',
      h = '<LEADER>sn'
   },
   buf = {
      next = 'gn',
      prev = 'ge',
   },
   tab = {
      new           = '<LEADER>t',
      duplicate_buf = '<LEADER>T',
      prev          = 'N',
      next          = 'E'
   },
   file = {
      quit     = '<LEADER>q',
      undo     = 'U',
      next_pos = 'I',
      prev_pos = 'H',
   },
   term = {
      esc = '<ESC>',
   },
   search_nav = {
      next = '<Tab>',
      prev = '<S-Tab>',
   },
   clipboard = {
      paste = 'p',
   },
   cursor_nav = {
      first = 'gh',
      last  = 'gi',
   },
   custom_V = 'V',
   custom_super_v = '<LEADER>v',
   case_mod = {
      pascal = ';o',
      upper  = ';u',
      lower  = ';y',
   },
   quote_mod = {
      single   = ';c',
      template = ';v',
   },
   auto_pair = {
      parent           = ';n',
      square           = ';e',
      curly            = ';i',
      angle            = ';h',
      temp_quote       = ';c',
      double_quote     = ';;',
      alt_double_quote = '"',
      single_quote     = '\'',
      temp_val         = ';v',
   },
   bracket_ins = {
      parent     = 'sn',
      square     = 'se',
      curly      = 'si',
      angle      = 'sh',
      s_quote    = 's;',
      d_quote    = 'sO',
      temp_quote = 's\''
   },
   cmd_nav = {
      l    = '<M-l>',
      r    = '<M-;>',
      next = '<M-u>',
      prev = '<M-y>',
      mru  = '<LEADER>cc',
   },
}

-- window cmds
---- nav cmds
map('n', keycodes.w_nav.r, '<C-w>l')
map('n', keycodes.w_nav.u, '<C-w>k')
map('n', keycodes.w_nav.d, '<C-w>j')
map('n', keycodes.w_nav.l, '<C-w>h')

---- split cmds
map('n', keycodes.w_split.h, ':split<CR>')
map('n', keycodes.w_split.v, ':vsplit<CR>')
---------------------------------------------------------------------------------------------------
-- buffer cmds
map('n', keycodes.buf.next, ':bn<CR>')
map('n', keycodes.buf.prev, ':bp<CR>')
---------------------------------------------------------------------------------------------------

-- tabs cmds
map('n', keycodes.tab.new, ':tabnew<CR>')
map('n', keycodes.tab.duplicate_buf, ':tab split<CR>')
map('n', keycodes.tab.prev, ':tabprev<CR>')
map('n', keycodes.tab.next, ':tabnext<CR>')
---------------------------------------------------------------------------------------------------

-- file cmds
map('n', keycodes.file.quit, ':q<CR>')

---- undo
map('n', keycodes.file.undo, '<C-r>')

---- mru file nav cmds
map('n', keycodes.file.next_pos, '<C-i>')
map('n', keycodes.file.prev_pos, '<C-o>')

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

---- toggle upper/lower/camel case
map('i', keycodes.case_mod.upper, '<ESC>vbUea')
map('i', keycodes.case_mod.lower, '<ESC>vbuea')
map('i', keycodes.case_mod.pascal, '<ESC>b~ea')

---- qoutes change cmds
map('n', keycodes.quote_mod.single, 'f`r\'f`r\'F\'')
map('n', keycodes.quote_mod.template, 'f\'r`f\'r`F`')

---- auto pairs cmds
map('i', keycodes.auto_pair.parent, '()<left>')
map('i', keycodes.auto_pair.square, '[]<left>')
map('i', keycodes.auto_pair.curly, '{}<ESC>i')
map('i', keycodes.auto_pair.angle, '<><left>')
map('i', keycodes.auto_pair.temp_quote, '``<left>')
map('i', keycodes.auto_pair.double_quote, '""<left>')
map('i', keycodes.auto_pair.alt_double_quote, '""<left>')
map('i', keycodes.auto_pair.single_quote, '\'\'<left>')
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

vim.cmd('nnoremap ' .. keycodes.symbol.cmd_nav.open .. ' :')
vim.cmd('vnoremap ' .. keycodes.symbol.cmd_nav.open .. ' :')

vim.cmd('nnoremap ' .. keycodes.cmd_nav.mru .. ' :<Up>')

map('c', keycodes.cmd_nav.l, '<Left>')
map('c', keycodes.cmd_nav.next, '<C-n>')
map('c', keycodes.cmd_nav.prev, '<C-p>')
map('c', keycodes.cmd_nav.r, '<Right>')
