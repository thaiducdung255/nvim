return {
   sys = {
      config = {
         hot_reload = {
            ascii = 'so',
         },
      },
      symbol = {
         cmd_nav = {
            open = {
               ascii = '<CR>'
            },
            mru = {
               ascii = '<LEADER>cc',
            },
            l = {
               ascii   = '<M-u>',
               colemak = '<C-h>',
            },
            next = {
               ascii   = '<M-i>',
               colemak = '<C-n>',
            },
            prev = {
               ascii   = '<M-o>',
               colemak = '<C-e>',
            },
            r = {
               ascii   = '<M-p>',
               colemak = '<C-i>',
            },
         },
         nl = {
            ascii = ',,',
         },
      },
      nav = {
         r = {
            ascii   = '<LEADER>l',
            colemak = '<LEADER>i'
         },
         l = {
            ascii = '<LEADER>h',
         },
         u = {
            ascii   = '<LEADER>k',
            colemak = '<LEADER>e'
         },
         d = {
            ascii   = '<LEADER>j',
            colemak = '<LEADER>n'
         },
      },
      w_resize = {
         v_inc = {
            ascii   = '<C-k>',
            colemak = '<C-e>'
         },
         v_desc = {
            ascii   = '<C-j>',
            colemak = '<C-n>',
         },
         h_inc = {
            ascii   = '<C-l>',
            colemak = '<C-o>'
         },
         h_desc = {
            ascii   = '<C-h>',
            colemak = '<C-h>'
         },
      },
      w_split = {
         v = {
            ascii   = '<LEADER>sk',
            colemak = '<LEADER>se'
         },
         h = {
            ascii   = '<LEADER>sj',
            colemak = '<LEADER>sn'
         },
      },
      buf = {
         next = {
            ascii   = 'L',
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
            ascii   = 'J',
            colemak = 'N'
         },
         next = {
            ascii   = 'K',
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
            ascii   = 'gn',
            colemak = 'gk',
         },
         prev_pos = {
            ascii   = 'gm',
            colemak = 'gm',
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
            ascii   = 'N',
            colemak = 'm',
         },
      },
      custom_V = {
         ascii = 'V',
      },
      custom_super_v = {
         ascii = '<LEADER>v'
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
            ascii   = ';j',
            colemak = ';n'
         },
         square = {
            ascii   = ';k',
            colemak = ';e'
         },
         curly = {
            ascii   = ';l',
            colemak = ';i'
         },
         angle = {
            ascii = ';h',
         },
         temp_quote = {
            ascii = ';c',
         },
         double_quote = {
            ascii = ';;',
         },
         alt_double_quote = {
            ascii = '"'
         },
         single_quote = {
            ascii = '\'',
         },
         temp_val = {
            ascii = ';v',
         }
      },
      bracket_ins = {
         parent = {
            ascii   = 'sj',
            colemak = 'sn'
         },
         square = {
            ascii   = 'sk',
            colemak = 'se'
         },
         curly = {
            ascii   = 'sl',
            colemak = 'si'
         },
         angle = {
            ascii   = 'sh',
            colemak = 'sh'
         },
         s_quote = {
            ascii = 's;',
         },
         d_quote = {
            ascii = 'sO',
         },
         temp_quote = {
            ascii   = 's\'',
            colemak = 's\''
         },
      },
      cmd_nav = {
         l = {
            ascii   = '<M-u>',
            colemak = '<M-l>',
         },
         r = {
            ascii   = '<M-p>',
            colemak = '<M-;>',
         },
         next = {
            ascii   = '<M-i>',
            colemak = '<M-u>',
         },
         prev = {
            ascii   = '<M-o>',
            colemak = '<M-y>',
         },
         mru = {
            ascii = '<LEADER>cc',
         },
      },
   },
   bufferline = {
      buf_pick = {
         ascii = 'gb',
      },
      buf_del = {
         ascii = 'gB',
      },
   },
   comment = {
      line = {
         ascii = ';;',
      },
      vline = {
         ascii = 'go',
      },
      block = {
         ascii = '*',
      },
      vblock = {
         ascii = '*',
      }
   },
   easy_align = {
      eq_align = {
         ascii = 'ae',
      },
      align = {
         ascii = 'aa',
      },
   },
   custom_fns = {
      ascii   = '',
      colemak = ''
   },
   git_signs = {
      next_hunk = {
         ascii   = '<LEADER>gj',
         colemak = '<LEADER>gn'
      },
      prev_hunk = {
         ascii   = '<LEADER>gk',
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
         ascii = 'F',
      },
      word = {
         ascii = '<LEADER>w',
      },
      char2 = {
         ascii = '<LEADER>o',
      },
      word_line = {
         ascii = 'f',
      },
      pattern = {
         ascii = '<LEADER><ESC>',
      },
      line = {
         ascii = '<LEADER><LEADER>',
      },
   },
   lazy_git = {
      exec = {
         ascii = '<LEADER>lg',
      },
   },
   diff_view = {
      open = {
         ascii = '<LEADER>gg'
      },
      close = {
         ascii = '<C-q>'
      },
      common = {
         select_next_entry = {
            ascii = '<TAB>'
         },
         select_prev_entry = {
            ascii = '<S-TAB>'
         },
         next_entry = {
            ascii = 'j',
         },
         prev_entry = {
            ascii = 'k',
         },
         goto_file = {
            ascii = 'o',
         },
         goto_file_split = {
            ascii = 'O',
         },
         goto_file_tab = {
            ascii = '<C-o>',
         },
         scroll_view_up = {
            ascii = 'M'
         },
         scroll_view_down = {
            ascii = 'm'
         },
         focus_files = {
            ascii = '<LEADER>e'
         },
         toggle_files = {
            ascii = '<LEADER>b'
         },
         cycle_layout = {
            ascii = 'i'
         },
      },
      view = {
         focus_files = {
            ascii = '<LEADER>e',
         },
         toggle_files = {
            ascii = '<LEADER>b',
         },
         cycle_layout = {
            ascii = '<LEADER>cl',
         },
         prev_conflict = {
            ascii = '<LEADER>cn',
         },
         next_conflict = {
            ascii = '<LEADER>ce',
         },
         conflict_choose_ours = {
            ascii = '<LEADER>co',
         },
         conflict_choose_theirs = {
            ascii = '<LEADER>ct',
         },
         conflict_choose_base = {
            ascii = '<LEADER>cb',
         },
         conflict_choose_all = {
            ascii = '<LEADER>ca',
         },
         conflict_choose_none = {
            ascii = '<LEADER>cc',
         },
      },
      diff1 = {},
      diff2 = {},
      diff3 = {
         diff_get_ours = {
            ascii = '2do',
         },
         diff_get_theirs = {
            ascii = '3do',
         },
      },
      diff4 = {
         diff_get_base = {
            ascii = '1do',
         },
         diff_get_ours = {
            ascii = '2do',
         },
         diff_get_theirs = {
            ascii = '3do',
         },
      },
      fp = {
         select_entry = {
            ascii = '<CR>',
         },
         toggle_stage_entry = {
            ascii = 's',
         },
         stage_all = {
            ascii = 'S',
         },
         unstage_all = {
            ascii = 'u',
         },
         restore_entry = {
            ascii = 'x',
         },
         open_commit_log = {
            ascii = 'l',
         },
         listing_style = {
            ascii = '<LEADER>ls',
         },
         toggle_flatten_dirs = {
            ascii = '<LEADER>fd',
         },
         refresh_files = {
            ascii = 'r',
         },
         prev_conflict = {
            ascii = '<LEADER>cn',
         },
         next_conflict = {
            ascii = '<LEADER>ce',
         },
      },
      fhp = {
         opions = {
            ascii = '?'
         },
         open_in_diffview = {
            ascii = 'o'
         },
         copy_hash = {
            ascii = 'y'
         },
         open_commit_log = {
            ascii = 'l'
         },
         open_all_folds = {
            ascii = 'zA'
         },
         close_all_folds = {
            ascii = 'zF'
         },
         select_entry = {
            ascii = '<CR>'
         },
      },
      op = {
         select_entry = {
            ascii = '<Tab>'
         },
         close = {
            ascii = 'q'
         }
      },
   },
   lsp = {
      def_nav = {
         ascii = 'gd',
      },
      signature_help = {
         ascii = '<LEADER>sh',
      },
      hover = {
         ascii = 'g.',
      },
      code_action = {
         ascii = 'ca',
      },
      rename = {
         ascii = 'gr',
      },
      goto_impl = {
         ascii = 'gi',
      },
   },
   lsp_saga = {
      preview_def = {
         ascii = 'dp',
      },
      hover_doc = {
         ascii = 'd.',
      },
      lsp_finder = {
         ascii = '<LEADER>gi',
      },
      lsp_diag_next = {
         ascii   = '<LEADER>fj',
         colemak = '<LEADER>fn'
      },
      lsp_diag_prev = {
         ascii   = '<LEADER>fk',
         colemak = '<LEADER>fe'
      },
   },
   dap = {
      continue = {
         ascii = '<LEADER>dc',
      },
      toggle_break_point = {
         ascii = '<LEADER>db',
      },
      step_over = {
         ascii   = '<LEADER>do',
         colemak = '<LEADER>do',
      },
      step_into = {
         ascii   = '<LEADER>dn',
         colemak = '<LEADER>dn',
      },
      step_out = {
         ascii = '<LEADER>dm',
      },
      disconnect = {
         ascii = '<LEADER>dt',
      },
      open_repl = {
         ascii = 'd<CR>',
      },
      hover = {
         ascii = 'd<ESC>',
      },
   },
   nvim_tree = {
      edit = {
         ascii   = { '<CR>', 'o', 'l' },
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
         ascii   = 'K',
         colemak = 'E'
      },
      last_sibling = {
         ascii   = 'J',
         colemak = 'N'
      },
      toggle_ignored = {
         ascii = 'Z',
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
         ascii   = '<LEADER>e',
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
      toggle_line = {
         ascii = 'dd'
      },
      enter_file = {
         ascii = '<CR>'
      },
      send_to_qf = {
         ascii = '<LEADER>q'
      },
      replace_cmd = {
         ascii = '<LEADER>c'
      },
      show_option_menu = {
         ascii = '<LEADER>o'
      },
      run_replace = {
         ascii = '<LEADER>R'
      },
      change_view_mode = {
         ascii = '<LEADER>v'
      },
      toggle_ignore_case = {
         ascii = 'ti'
      },
      toggle_ignore_hidden = {
         ascii = 'th'
      },
   },
   switch = {
      exec = {
         ascii = 'S',
      },
   },
   cmp = {
      select_next_item = {
         ascii = '<Tab>'
      },
      select_prev_item = {
         ascii = '<S-Tab>'
      },
      scroll_docs_up = {
         ascii   = '<C-k>',
         colemak = '<C-e>'
      },
      scroll_docs_down = {
         ascii   = '<C-j>',
         colemak = '<C-n>'
      },
      confirm = {
         ascii = '<CR>'
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
      buf_fuzzy_find = {
         ascii = '<LEADER>ss',
      },
      lsp_type_def = {
         ascii = 'td',
      },
      cmd = {
         ascii = 'cm',
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
         ascii = 'gR',
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
      repo = {
         ascii = '<LEADER>.',
      },
      undo = {
         ascii = '<LEADER>u',
      },
   },
   toggle_term = {
      h_open = {
         ascii = '<C-Enter>',
      },
      v_open = {
         ascii = '<S-Enter>',
      },
   },
   ts = {
      rename = {
         ascii = 'gr',
      },
      def_nav = {
         ascii = 'gdn',
      },
      usage_next = {
         ascii   = 'grj',
         colemak = 'grn'
      },
      usage_prev = {
         ascii   = 'grk',
         colemak = 'gre'
      },
      list_defs = {
         ascii = 'gdN',
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
         ascii   = 'm',
         colemak = 'l',
      },
      toggle_max_vertical = {
         ascii   = 'M',
         colemak = 'L',
      },
   },
   vsnip = {
      expand = {
         ascii = '<Space>',
      },
      jump_next = {
         ascii   = '<C-k>',
         colemak = '<C-e>'
      },
      jump_prev = {
         ascii   = '<C-j>',
         colemak = '<C-n>'
      },
      select_text = {
         ascii   = '',
         colemak = ''
      },
      cut_text = {
         ascii   = '',
         colemak = ''
      },
   },
   ufo = {
      open_all = {
         ascii = 'zA'
      },
      close_all = {
         ascii = 'zF'
      },
   },
}
