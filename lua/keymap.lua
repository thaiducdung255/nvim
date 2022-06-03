Keycodes = {
   sys = {
      symbol = {
         cmd_nav = {
            mru = {
               ascii = '<LEADER>cc',
            },
            l = {
               ascii = '<M-u>',
               colemak = '<M-l>',
            },
            next = {
               ascii = '<M-i>',
               colemak = '<M-u>',
            },
            prev = {
               ascii = '<M-o>',
               colemak = '<M-y>',
            },
            r = {
               ascii = '<M-p>',
               colemak = '<M-;>',
            },
         },
         open_cmd = {
            ascii = '<CR>',
         },
         nl = {
            ascii = ',,',
         },
         exclamation = {
            ascii = ';q',
         },
         at_sign = {
            ascii = ';w',
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
         },
         equal = {
            ascii = ';x',
         },
         dangle = {
            ascii = ';;z',
         },
         plus = {
            ascii = ';;x',
         },
      },
      nav = {
         r = {
            ascii = '<LEADER>l',
            colemak = '<LEADER>i'
         },
         l = {
            ascii = '<LEADER>h',
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
            colemak = '<C-o>'
         },
         v_desc = {
            ascii = '<C-h>',
         },
         h_inc = {
            ascii = '<C-j>',
            colemak = '<C-n>'
         },
         h_desc = {
            ascii = '<C-k>',
            colemak = '<C-e>'
         },
      },
      w_split = {
         v = {
            ascii = '<LEADER>sk',
            colemak = '<LEADER>se'
         },
         h = {
            ascii = '<LEADER>sj',
            colemak = '<LEADER>sn'
         },
      },
      buf = {
         next = {
            ascii = 'L',
            colemak = 'I',
         },
         prev = {
            ascii = 'H',
         },
         del = {
            ascii = 'gq',
         },
      },
      tab = {
         new = {
            ascii = '<LEADER>t',
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
         },
         write = {
            ascii = 'ss',
         },
         undo = {
            ascii = 'U',
         },
         next_pos = {
            ascii = '<LEADER>gn',
         },
         prev_pos = {
            ascii = '<LEADER>gm',
         },
      },
      term = {
         esc = {
            ascii = '<ESC>',
         },
      },
      search_nav = {
         next = {
            ascii = '<Tab>',
         },
         prev = {
            ascii = '<S-Tab>',
         },
      },
      clipboard = {
         paste = {
            ascii = 'p',
         },
      },
      cursor_nav = {
         l = {
            ascii = 'jj',
            colemak = 'NN',
         },
         r = {
            ascii = 'kk',
            colemak = 'EE',
         },
         first = {
            ascii = 'ga',
         },
         last = {
            ascii = 'gf',
         },
      },
      scroll = {
         u = {
            ascii = 'M',
         },
         d = {
            ascii = 'N',
            colemak = 'm',
         },
      },
      custom_V = {
         ascii = '<LEADER>v',
      },
      register = {
         ascii = '<LEADER>r',
      },
      case_mod = {
         pascal = {
            ascii = ';o',
         },
         upper = {
            ascii = ';u',
         },
         lower = {
            ascii = ';y',
         },
      },
      quote_mod = {
         single = {
            ascii = ';c',
         },
         template = {
            ascii = ';v',
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
         },
         temp_quote = {
            ascii = ';c',
         },
         temp_val = {
            ascii = ';v',
         }
      },
      bracket_ins = {
         parent = {
            ascii = 'sj',
            colemak = 'sn'
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
            colemak = 'sh'
         },
         s_quote = {
            ascii = 's;',
         },
         d_quote = {
            ascii = 'sO',
         },
         temp_quote = {
            ascii = 's\'',
            colemak = 's\''
         },
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
         },
      },
   },
   bufferline = {
      buf_pick = {
         ascii = '<LEADER>gb',
      },
      buf_del = {
         ascii = '<LEADER>gB',
      },
   },
   comment = {
      line = {
         ascii = ';;',
      },
      v_mode = {
         ascii = 'cm',
      }
   },
   easy_align = {
      eq_align = {
         ascii = 'ge',
      },
      align = {
         ascii = 'ga',
      },
   },
   custom_fns = {
      ascii = '',
      colemak = ''
   },
   git_signs = {
      next_hunk = {
         ascii = '<LEADER>gj',
         colemak = '<LEADER>gn'
      },
      prev_hunk = {
         ascii = '<LEADER>gk',
         colemak = '<LEADER>ge'
      },
      unstage_hunk = {
         ascii = '<LEADER>gu',
      },
      reset_hunk = {
         ascii = 'gv',
      },
      reset_buf = {
         ascii = 'gV',
      },
      preview_hunk = {
         ascii = 'gp',
      },
      diff_this = {
         ascii = 'gP',
      },
      set_loc_list = {
         ascii = 'gz',
      },
      select_hunk = {
         ascii = '<LEADER>ih',
      },
   },
   hop = {
      char1_line = {
         ascii = 'f',
      },
      word = {
         ascii = '<LEADER>w',
      },
      char2 = {
         ascii = '<LEADER>d',
      },
      pattern = {
         ascii = '<LEADER><LEADER>',
      },
      line = {
         ascii = '<LEADER><ESC>',
      },
   },
   lazy_git = {
      exec = {
         ascii = '<LEADER>gg',
      },
   },
   lsp_saga = {
      preview_def = {
         ascii = 'dp',
      },
      lsp_finder = {
         ascii = '<LEADER>gi',
      },
      lsp_diag_next = {
         ascii = '<LEADER>fj',
         colemak = '<LEADER>fn'
      },
      lsp_diag_prev = {
         ascii = '<LEADER>fk',
         colemak = '<LEADER>fe'
      },
   },
   dap = {
      continue = {
         ascii = 'dc',
      },
      toggle_break_point = {
         ascii = 'db',
      },
      step_over = {
         ascii = 'do',
         colemak = ';o',
      },
      step_into = {
         ascii = 'dn',
      },
      step_out = {
         ascii = 'dm',
      },
      disconnect = {
         ascii = 'dt',
      },
      open_repl = {
         ascii = 'd<CR>',
      },
      hover = {
         ascii = 'd<LEADER>',
      },
   },
   nvim_tree = {
      edit = {
         ascii = { '<CR>', 'o', 'l' },
         colemak = { '<CR>', 'i' },
      },
      cd = {
         ascii = {},
      },
      vsplit = {
         ascii = {},
      },
      split = {
         ascii = {},
      },
      tabnew = {
         ascii = {},
      },
      prev_sibling = {
         ascii = {},
      },
      next_sibling = {
         ascii = {},
      },
      parent_node = {
         ascii = {},
      },
      close_node = {
         ascii = { 'h' },
      },
      preview = {
         ascii = '<Tab>',
      },
      first_sibling = {
         ascii = 'K',
         colemak = 'E'
      },
      last_sibling = {
         ascii = 'J',
         colemak = 'N'
      },
      toggle_ignored = {
         ascii = 'I',
      },
      toggle_dotfiles = {
         ascii = 'H',
      },
      refresh = {
         ascii = 'R',
      },
      create = {
         ascii = 'a',
      },
      remove = {
         ascii = 'd',
      },
      rename = {
         ascii = 'r',
      },
      full_rename = {
         ascii = {},
      },
      cut = {
         ascii = 'x',
      },
      copy = {
         ascii = 'c',
      },
      paste = {
         ascii = 'p',
      },
      copy_name = {
         ascii = 'y',
      },
      copy_path = {
         ascii = 'Y',
      },
      copy_absolute_path = {
         ascii = {},
      },
      prev_git_item = {
         ascii = { 'ge' },
      },
      next_git_item = {
         ascii = { 'gn' },
      },
      dir_up = {
         ascii = {},
      },
      close = {
         ascii = 'q',
      },
      toggle_help = {
         ascii = '?',
      },
      toggle_open = {
         ascii = '<LEADER>e',
         colemak = 'T',
      },
      toggle_refresh = {
         ascii = '<LEADER>E',
      },
   },
   packer = {
      install = {
         ascii = '<LEADER>pi',
      },
      clean = {
         ascii = '<LEADER>pc',
      },
      sync = {
         ascii = '<LEADER>ps',
      },
      update = {
         ascii = '<LEADER>pu',
      },
   },
   rest = {
      run = {
         ascii = '<LEADER><CR>',
      },
      curl = {
         ascii = '<LEADER><TAB>',
      },
   },
   spectre = {
      n_open = {
         ascii = '<LEADER>S',
      },
      v_open = {
         ascii = '<LEADER>W',
      },
      open_file_search = {
         ascii = '<LEADER>G',
      },
   },
   switch = {
      exec = {
         ascii = 'S',
      },
   },
   telescope = {
      files = {
         ascii = '<LEADER>ff',
      },
      old_files = {
         ascii = '<LEADER>fr',
      },
      bufs = {
         ascii = '<LEADER>fb',
      },
      str_grep = {
         ascii = '<LEADER>fS',
      },
      live_grep = {
         ascii = '<LEADER>fs',
      },
      tele_taby = {
         ascii = '<LEADER>f;',
      },
      buf_fuzzy_find = {
         ascii = '<LEADER>ss',
      },
      lsp_type_def = {
         ascii = 'td',
      },
      cmd = {
         ascii = '<LEADER>cm',
      },
      cmd_his = {
         ascii = '<LEADER>ch',
      },
      keymap = {
         ascii = '<LEADER>mp',
      },
      highlight = {
         ascii = '<LEADER>sc',
      },
      lsp_doc_sym = {
         ascii = '<LEADER>ds',
      },
      lsp_doc_diag = {
         ascii = 'gD',
      },
      lsp_ref = {
         ascii = 'gr',
      },
      git_branch = {
         ascii = '<LEADER>gb',
      },
      git_diff = {
         ascii = '<LEADER>gd',
      },
      git_bcommit = {
         ascii = '<LEADER>gv',
      },
      git_commit = {
         ascii = '<LEADER>gc',
      },
      git_status = {
         ascii = '<LEADER>gs',
      },
      eslint_diag = {
         ascii = '<LEADER>zz',
      },
   },
   toggle_term = {
      h_open = {
         ascii = '<LEADER>;',
      },
      v_open = {
         ascii = '<LEADER>:',
      },
   },
   ts = {
      rename = {
         ascii = 'gR',
      },
      def_nav = {
         ascii = 'gnd',
      },
      usage_next = {
         ascii = 'grj',
         colemak = 'grn'
      },
      usage_prev = {
         ascii = 'grk',
         colemak = 'gre'
      },
      list_defs = {
         ascii = 'gnD',
      },
      list_defs_toc = {
         ascii = 'gt',
      },
      outer_block = {
         ascii = '<LEADER>bo',
      },
      inner_block = {
         ascii = '<LEADER>bi',
      },
      inner_class = {
         ascii = '<LEADER>ci',
      },
      outer_class = {
         ascii = '<LEADER>co',
      },
   },
   undo_tree = {
      show = {
         ascii = '<LEADER>u',
      },
   },
   dadbod = {
      exec_query = {
         ascii = '',
      },
      save_query = {
         ascii = '',
      },
   },
   maximizer = {
      toggle_max = {
         ascii = 'm',
         colemak = 'l',
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
