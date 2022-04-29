local function map(lhs, rhs, mode, isSilentOff)
   local options = { noremap = true, silent = true }

   lhs = Get_key_code(lhs)

   if  isSilentOff == true then options.silent = false end

   vim.keymap.set(mode, lhs, rhs, options)
end

function Get_key_code(lhs)
   if lhs.ascii and lhs.colemak then
      local keyboard_layout = os.getenv('KEYBOARD_LAYOUT')

      if keyboard_layout == 'colemak' then
         return lhs.colemak
      end

      return lhs.ascii
   end

   return lhs
end

function Nmap(lhs, rhs, isSilentOff)
   map(lhs, rhs, 'n', isSilentOff)
end

function NOmap(lhs, rhs, isSilentOff)
   map(lhs, rhs, { 'n', 'o' }, isSilentOff)
end

function Cmap(lhs, rhs, isSilentOff)
   map(lhs, rhs, 'c', isSilentOff)
end

function Imap(lhs, rhs, isSilentOff)
   map(lhs, rhs, 'i', isSilentOff)
end

function Tmap(lhs, rhs, isSilentOff)
   map(lhs, rhs, 't', isSilentOff)
end

function Vmap(lhs, rhs, isSilentOff)
   map(lhs, rhs, 'v', isSilentOff)
end

function Icmap(lhs, rhs, isSilentOff)
   map(lhs, rhs, { 'i', 'c' }, isSilentOff)
end

function Map(lhs, rhs, isSilentOff)
   map(lhs, rhs, { 'i', 'n', 'c', 'v' }, isSilentOff)
end

function Inmap(lhs, rhs, isSilentOff)
   map(lhs, rhs, { 'i', 'n' }, isSilentOff)
end

function Nvmap(lhs, rhs, isSilentOff)
   map(lhs, rhs, { 'n', 'v' }, isSilentOff)
end

function Invmap(lhs, rhs, isSilentOff)
   map(lhs, rhs, { 'i', 'n', 'v' }, isSilentOff)
end

function Omap(lhs, rhs, isSilentOff)
   map(lhs, rhs, 'o', isSilentOff)
end

DATA_PATH   = vim.fn.stdpath('data')
CACHE_PATH  = vim.fn.stdpath('cache')

Keycodes = {
   sys = {
      nav = {
         r = {
            ascii = '<LEADER>l',
            colemak = '<LEADER>i'
         },
         l = {
            ascii = '<LEADER>h',
            colemak = '<LEADER>h'
         },
         u = {
            ascii = '<LEADER>k',
            colemak = '<LEADER>e'
         },
         d = {
            ascii = '<LEADER>j',
            colemak = '<LEADER>n'
         },
      },
      w_resize = {
         v_inc = {
            ascii = '<C-l>',
            colemak = '<C-i>'
         },
         v_desc = {
            ascii = '<C-h>',
            colemak = '<C-h>'
         },
         h_inc = {
            ascii = '<C-k>',
            colemak = '<C-e>'
         },
         h_desc = {
            ascii = '<C-j>',
            colemak = '<C-n>'
         },
      },
      w_split = {
         v = {
            ascii = '<LEADER>sk',
            colemak = '<LEADER>re'
         },
         h = {
            ascii = '<LEADER>sj',
            colemak = '<LEADER>rn'
         },
      },
      buf = {
         next = {
            ascii = 'L',
            colemak = 'I',
         },
         prev = {
            ascii = 'H',
            colemak = 'H',
         },
         del = {
            ascii = 'gq',
            colemak = 'dq',
         },
      },
      tab = {
         new = {
            ascii = '<LEADER>t',
            colemak = '<LEADER>g'
         },
         prev = {
            ascii = 'J',
            colemak = 'N'
         },
         next = {
            ascii = 'K',
            colemak = 'E'
         },
      },
      file = {
         quit = {
            ascii = '<LEADER>q',
            colemak = '<LEADER>q',
         },
         write = {
            ascii = 'ss',
            colemak = 'rr',
         },
         undo = {
            ascii = 'U',
            colemak = 'L',
         },
         next_pos = {
            ascii = 'gn',
            colemak = 'dk',
         },
         prev_pos = {
            ascii = 'gm',
            colemak = 'dm',
         },
      },
      term = {
         esc = {
            ascii = '<ESC>',
            colemak = '<ESC>',
         },
      },
      search_nav = {
         next = {
            ascii = '<Tab>',
            colemak = '<Tab>'
         },
         prev = {
            ascii = '<S-Tab>',
            colemak = '<S-Tab>'
         },
      },
      clipboard = {
         paste = {
            ascii = 'p',
            colemak = ';',
         },
      },
      cursor_nav = {
         l = {
            ascii = 'jj',
            colemak = 'nn'
         },
         r = {
            ascii = 'kk',
            colemak = 'ee'
         },
         first = {
            ascii = 'ga',
            colemak = 'da'
         },
         last = {
            ascii = 'gf',
            colemak = 'dt'
         },
      },
      scroll = {
         u = {
            ascii = 'M',
            colemak = 'M'
         },
         d = {
            ascii = 'N',
            colemak = 'K'
         },
      },
      custom_V = {
         ascii = '<LEADER>v',
         colemak = '<LEADER>v'
      },
      register = {
         ascii = '<LEADER>r',
         colemak = '<LEADER>p'
      },
      case_mod = {
         pascal = {
            ascii = ';o',
            colemak = ';y'
         },
         upper = {
            ascii = ';u',
            colemak = ';l'
         },
         lower = {
            ascii = ';i',
            colemak = ';u'
         },
      },
      quote_mod = {
         single = {
            ascii = ';c',
            colemak = ';c'
         },
         template = {
            ascii = ';v',
            colemak = ';v'
         },
      },
      auto_pair = {
         parent = {
            ascii = ';j',
            colemak = ';n'
         },
         square = {
            ascii = ';k',
            colemak = ';e'
         },
         curly = {
            ascii = ';l',
            colemak = ';i'
         },
         angle = {
            ascii = ';h',
            colemak = ';h'
         },
         temp_quote = {
            ascii = ';c',
            colemak = ';c'
         },
         temp_val = {
            ascii = ';v',
            colemak = ';v',
         }
      },
      bracket_ins = {
         parent = {
            ascii = 'sj',
            colemak = 'rn'
         },
         square = {
            ascii = 'sk',
            colemak = 'se'
         },
         curly = {
            ascii = 'sl',
            colemak = 'si'
         },
         angle = {
            ascii = 'sh',
            colemak = 'rh'
         },
         s_quote = {
            ascii = 's;',
            colemak = 'r;'
         },
         d_quote = {
            ascii = 'sO',
            colemak = 'rO'
         },
         temp_quote = {
            ascii = 's\'',
            colemak = 's\''
         },
      },
      key_mod = {
         symbol = {
            exclamation = {
               ascii = ';q',
               colemak = ';q',
            },
            at_sign = {
               ascii = ';w',
               colemak = ';w',
            },
            sharp = {
               ascii = ';e',
               colemak = ';f',
            },
            dollar = {
               ascii = ';r',
               colemak = ';p',
            },
            percent = {
               ascii = ';t',
               colemak = ';g',
            },
            power = {
               ascii = ';a',
               colemak = ';a',
            },
            _and = {
               ascii = ';s',
               colemak = ';r',
            },
            star = {
               ascii = ';d',
               colemak = ';s',
            },
            open_parent = {
               ascii = ';f',
               colemak = ';t',
            },
            close_parent = {
               ascii = ';g',
               colemak = ';d',
            },
            minus = {
               ascii = ';z',
               colemak = ';z',
            },
            equal = {
               ascii = ';x',
               colemak = ';x',
            },
            dangle = {
               ascii = ';;z',
               colemak = ';;z',
            },
            plus = {
               ascii = ';;x',
               colemak = ';;x',
            },
            nl = {
               ascii = ',,',
               colemak = ',,',
            }
         },
         cmd_nav = {
            l = {
               ascii = '<M-u>',
               colemak = '<M-l>',
            },
            r = {
               ascii = '<M-p>',
               colemak = '<M-;>',
            },
            next = {
               ascii = '<M-i>',
               colemak = '<M-u>',
            },
            prev = {
               ascii = '<M-o>',
               colemak = '<M-y>',
            },
            mru = {
               ascii = '<LEADER>cc',
               colemak = '<LEADER>cc',
            },
         },
      },
   },
   bufferline = {
      buf_pick = {
         ascii = '<LEADER>gb',
         colemak = '<LEADER>db',
      },
      buf_del = {
         ascii = '<LEADER>gB',
         colemak = '<LEADER>qB',
      },
   },
   comment = {
      line = {
         ascii = ';;',
         colemak = ';;',
      },
      v_mode = {
         ascii = 'zz',
         colemak = 'zz',
      }
   },
   easy_align = {
      eq_align = {
         ascii = 'ge',
         colemak = 'df',
      },
      align = {
         ascii = 'ga',
         colemak = 'da',
      },
   },
   custom_fns = {
      ascii = '',
      colemak = ''
   },
   git_signs = {
      next_hunk = {
         ascii = '<LEADER>gj',
         colemak = '<LEADER>dn'
      },
      prev_hunk = {
         ascii = '<LEADER>gk',
         colemak = '<LEADER>de'
      },
      unstage_hunk = {
         ascii = '<LEADER>gu',
         colemak = '<LEADER>dl'
      },
      reset_hunk = {
         ascii = 'gv',
         colemak = 'dv'
      },
      reset_buf = {
         ascii = '<LEADER>gV',
         colemak = '<LEADER>dV'
      },
      preview_hunk = {
         ascii = 'gp',
         colemak = 'd;'
      },
      diff_this = {
         ascii = 'gP',
         colemak = 'd:'
      },
      set_loc_list = {
         ascii = 'gz',
         colemak = 'dz'
      },
      select_hunk = {
         ascii = 'ih',
         colemak = 'uh'
      },
   },
   hop = {
      char1_line = {
         ascii = 'f',
         colemak = 't'
      },
      word = {
         ascii = '<LEADER>w',
         colemak = '<LEADER>w'
      },
      char2 = {
         ascii = '<LEADER>d',
         colemak = '<LEADER>s'
      },
      pattern = {
         ascii = '<LEADER><LEADER>',
         colemak = '<LEADER><LEADER>'
      },
      line = {
         ascii = '<LEADER><ESC>',
         colemak = '<LEADER><ESC>'
      },
   },
   lazy_git = {
      exec = {
         ascii = '<LEADER>gg',
         colemak = '<LEADER>dd'
      },
   },
   lsp_saga = {
      preview_def = {
         ascii = 'dp',
         colemak = 's;'
      },
      lsp_finder = {
         ascii = 'gi',
         colemak = 'du'
      },
      lsp_diag_next = {
         ascii = 'fj',
         colemak = 'tn'
      },
      lsp_diag_prev = {
         ascii = 'fk',
         colemak = 'te'
      },
   },
   dap = {
      continue = {
         ascii = 'dc',
         colemak = 'sc'
      },
      toggle_break_point = {
         ascii = 'db',
         colemak = 'sb'
      },
      step_over = {
         ascii = 'do',
         colemak = 'sy'
      },
      step_into = {
         ascii = 'dn',
         colemak = 'sk'
      },
      step_out = {
         ascii = 'dm',
         colemak = 'sm'
      },
      disconnect = {
         ascii = 'dt',
         colemak = 'sg'
      },
      open_repl = {
         ascii = 'd<CR>',
         colemak = 's<CR>'
      },
      hover = {
         ascii = 'd<LEADER>',
         colemak = 's<LEADER>'
      },
   },
   nvim_tree = {
      edit = {
         ascii = '',
         colemak = ''
      },
      cd = {
         ascii = '',
         colemak = ''
      },
      vsplit = {
         ascii = '',
         colemak = ''
      },
      split = {
         ascii = '',
         colemak = ''
      },
      tabnew = {
         ascii = '',
         colemak = ''
      },
      prev_sibling = {
         ascii = '',
         colemak = ''
      },
      next_sibling = {
         ascii = '',
         colemak = ''
      },
      parent_node = {
         ascii = '',
         colemak = ''
      },
      close_node = {
         ascii = '',
         colemak = ''
      },
      preview = {
         ascii = '',
         colemak = ''
      },
      first_sibling = {
         ascii = '',
         colemak = ''
      },
      last_sibling = {
         ascii = '',
         colemak = ''
      },
      toggle_ignored = {
         ascii = '',
         colemak = ''
      },
      toggle_dotfiles = {
         ascii = '',
         colemak = ''
      },
      refresh = {
         ascii = '',
         colemak = ''
      },
      create = {
         ascii = '',
         colemak = ''
      },
      remove = {
         ascii = '',
         colemak = ''
      },
      rename = {
         ascii = '',
         colemak = ''
      },
      full_rename = {
         ascii = '',
         colemak = ''
      },
      cut = {
         ascii = '',
         colemak = ''
      },
      copy = {
         ascii = '',
         colemak = ''
      },
      paste = {
         ascii = '',
         colemak = ''
      },
      copy_name = {
         ascii = '',
         colemak = ''
      },
      copy_path = {
         ascii = '',
         colemak = ''
      },
      copy_absolute_path = {
         ascii = '',
         colemak = ''
      },
      prev_git_item = {
         ascii = '',
         colemak = ''
      },
      next_git_item = {
         ascii = '',
         colemak = ''
      },
      dir_up = {
         ascii = '',
         colemak = ''
      },
      close = {
         ascii = '',
         colemak = ''
      },
      toggle_help = {
         ascii = '',
         colemak = ''
      },
      toggle_open = {
         ascii = '',
         colemak = ''
      },
      toggle_refresh = {
         ascii = '',
         colemak = ''
      },
   },
   packer = {
      install = {
         ascii = '',
         colemak = ''
      },
      clean = {
         ascii = '',
         colemak = ''
      },
      sync = {
         ascii = '',
         colemak = ''
      },
      update = {
         ascii = '',
         colemak = ''
      },
   },
   rest = {
      run = {
         ascii = '',
         colemak = ''
      },
      curl = {
         ascii = '',
         colemak = ''
      },
   },
   spectre = {
      n_open = {
         ascii = '',
         colemak = ''
      },
      v_open = {
         ascii = '',
         colemak = ''
      },
      open_file_search = {
         ascii = '',
         colemak = ''
      },
   },
   switch = {

   },
   telescope = {
      files = {
         ascii = '',
         colemak = ''
      },
      old_files = {
         ascii = '',
         colemak = ''
      },
      bufs = {
         ascii = '',
         colemak = ''
      },
      str_grep = {
         ascii = '',
         colemak = ''
      },
      live_grep = {
         ascii = '',
         colemak = ''
      },
      tele_taby = {
         ascii = '',
         colemak = ''
      },
      buf_fuzzy_find = {
         ascii = '',
         colemak = ''
      },
      lsp_type_def = {
         ascii = '',
         colemak = ''
      },
      cmd = {
         ascii = '',
         colemak = ''
      },
      cmd_his = {
         ascii = '',
         colemak = ''
      },
      keymap = {
         ascii = '',
         colemak = ''
      },
      highlight = {
         ascii = '',
         colemak = ''
      },
      lsp_doc_sym = {
         ascii = '',
         colemak = ''
      },
      lsp_doc_diag = {
         ascii = '',
         colemak = ''
      },
      lsp_ref = {
         ascii = '',
         colemak = ''
      },
      git_branch = {
         ascii = '',
         colemak = ''
      },
      git_diff = {
         ascii = '',
         colemak = ''
      },
      git_bcommit = {
         ascii = '',
         colemak = ''
      },
      git_commit = {
         ascii = '',
         colemak = ''
      },
      git_status = {
         ascii = '',
         colemak = ''
      },
      eslint_diag = {
         ascii = '',
         colemak = ''
      },
   },
   toggle_term = {
      h_open = {
         ascii = '',
         colemak = ''
      },
      v_open = {
         ascii = '',
         colemak = ''
      },
   },
   ts = {
      def_nav = {
         ascii = '',
         colemak = ''
      },
      usage_next = {
         ascii = '',
         colemak = ''
      },
      usage_prev = {
         ascii = '',
         colemak = ''
      },
      list_defs = {
         ascii = '',
         colemak = ''
      },
      list_defs_toc = {
         ascii = '',
         colemak = ''
      },
      outer_block = {
         ascii = '',
         colemak = ''
      },
      inner_block = {
         ascii = '',
         colemak = ''
      },
      inner_class = {
         ascii = '',
         colemak = ''
      },
      outer_class = {
         ascii = '',
         colemak = ''
      },
   },
   undo_tree = {
      show = {
         ascii = '',
         colemak = ''
      },
   },
   dadbod = {
      exec_query = {
         ascii = '',
         colemak = ''
      },
      save_query = {
         ascii = '',
         colemak = ''
      },
   },
   maximizer = {
      toggle_max = {
         ascii = '',
         colemak = ''
      },
   },
   vsnip = {
      expand = {
         ascii = '',
         colemak = ''
      },
      jump_next = {
         ascii = '',
         colemak = ''
      },
      jump_prev = {
         ascii = '',
         colemak = ''
      },
      select_text = {
         ascii = '',
         colemak = ''
      },
      cut_text = {
         ascii = '',
         colemak = ''
      },
   }
}
