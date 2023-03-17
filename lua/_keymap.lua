return {
   sys = {
      config = {
         hot_reload = 'so',
      },
      symbol = {
         cmd_nav = {
            open = '<CR>',
            mru = '<LEADER>cc',
            l = '<C-h>',
            next = '<C-n>',
            prev = '<C-e>',
            r = '<C-i>',
         },
         nl = ',,',
      },
      nav = {
         r = '<LEADER>i',
         l = '<LEADER>h',
         u = '<LEADER>e',
         d = '<LEADER>n'
      },
      w_resize = {
         v_inc = '<C-e>',
         v_desc = '<C-n>',
         h_inc = '<C-o>',
         h_desc = '<C-h>'
      },
      w_split = {
         v = '<LEADER>se',
         h = '<LEADER>sn'
      },
      buf = {
         next = 'I',
         prev = 'H',
         del = 'gq',
      },
      tab = {
         new = '<LEADER>t',
         prev = 'N',
         next = 'E'
      },
      file = {
         quit = '<LEADER>q',
         write = 'ss',
         undo = 'U',
         next_pos = 'gk',
         prev_pos = 'gm',
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
         first = 'ga',
         last = 'gf',
      },
      scroll = {
         u = 'M',
         d = 'm',
      },
      custom_V = 'V',
      custom_super_v = '<LEADER>v',
      case_mod = {
         pascal = ';o',
         upper = ';u',
         lower = ';y',
      },
      quote_mod = {
         single = ';c',
         template = ';v',
      },
      auto_pair = {
         parent = ';n',
         square = ';e',
         curly = ';i',
         angle = ';h',
         temp_quote = ';c',
         double_quote = ';;',
         alt_double_quote = '"',
         single_quote = '\'',
         temp_val = ';v',
      },
      bracket_ins = {
         parent = 'sn',
         square = 'se',
         curly = 'si',
         angle = 'sh',
         s_quote = 's;',
         d_quote = 'sO',
         temp_quote = 's\''
      },
      cmd_nav = {
         l = '<M-l>',
         r = '<M-;>',
         next = '<M-u>',
         prev = '<M-y>',
         mru = '<LEADER>cc',
      },
   },
   bufferline = {
      buf_pick = 'gb',
      buf_del = 'gB',
   },
   comment = {
      line = ';;',
      vline = 'go',
      block = '*',
      vblock = '*',
   },
   easy_align = {
      eq_align = 'ae',
      align = 'aa',
   },
   git_signs = {
      next_hunk = '<LEADER>gn',
      prev_hunk = '<LEADER>ge',
      unstage_hunk = '<LEADER>gu',
      reset_hunk = 'gv',
      reset_buf = 'gV',
      preview_hunk = 'gp',
      diff_this = 'gP',
      set_loc_list = 'gz',
      select_hunk = '<LEADER>ih',
   },
   hop = {
      char1_line = 'F',
      word_line = 'f',
      word = '<LEADER>w',
      char2 = '<LEADER>o',
      pattern = '<LEADER><ESC>',
      line = '<LEADER><LEADER>',
   },
   lazy_git = {
      exec = '<LEADER>lg',
   },
   diff_view = {
      open = '<LEADER>gg',
      close = '<ESC>',
      common = {
         select_next_entry = '<TAB>',
         select_prev_entry = '<S-TAB>',
         next_entry = 'j',
         prev_entry = 'k',
         goto_file = 'o',
         goto_file_split = 'O',
         goto_file_tab = '<C-o>',
         scroll_view_up = 'M',
         scroll_view_down = 'm',
         focus_files = '<LEADER>e',
         toggle_files = '<LEADER>b',
         cycle_layout = 'i'
      },
      view = {
         focus_files = '<LEADER>e',
         toggle_files = '<LEADER>b',
         cycle_layout = '<LEADER>cl',
         prev_conflict = '<LEADER>cn',
         next_conflict = '<LEADER>ce',
         conflict_choose_ours = '<LEADER>co',
         conflict_choose_theirs = '<LEADER>ct',
         conflict_choose_base = '<LEADER>cb',
         conflict_choose_all = '<LEADER>ca',
         conflict_choose_none = '<LEADER>cc',
      },
      diff1 = {},
      diff2 = {},
      diff3 = {
         diff_get_ours = '2do',
         diff_get_theirs = '3do',
      },
      diff4 = {
         diff_get_base = '1do',
         diff_get_ours = '2do',
         diff_get_theirs = '3do',
      },
      fp = {
         select_entry = '<CR>',
         toggle_stage_entry = 's',
         stage_all = 'S',
         unstage_all = 'u',
         restore_entry = 'x',
         open_commit_log = 'l',
         listing_style = '<LEADER>ls',
         toggle_flatten_dirs = '<LEADER>fd',
         refresh_files = 'r',
         prev_conflict = '<LEADER>cn',
         next_conflict = '<LEADER>ce',
      },
      fhp = {
         opions = '?',
         open_in_diffview = 'o',
         copy_hash = 'y',
         open_commit_log = 'l',
         open_all_folds = 'zA',
         close_all_folds = 'zF',
         select_entry = '<CR>'
      },
      op = {
         select_entry = '<Tab>',
         close = 'q'
      },
   },
   lsp = {
      signature_help = '<LEADER>sh',
      hover = 'dp',
      code_action = 'ca',
      rename = 'gr',
      n_diag = '<LEADER>dn',
      p_diag = '<LEADER>de',
   },
   dap = {
      continue = '<LEADER>dc',
      toggle_break_point = '<LEADER>dB',
      step_over = '<LEADER>do',
      step_into = '<LEADER>di',
      step_out = '<LEADER>dm',
      disconnect = '<LEADER>dT',
      open_repl = 'd<CR>',
      hover = 'd<ESC>',
   },
   nvim_tree = {
      edit = { '<CR>', 'i' },
      cd = {},
      vsplit = {},
      split = {},
      tabnew = {},
      prev_sibling = {},
      next_sibling = {},
      parent_node = {},
      close_node = { 'h' },
      preview = '<Tab>',
      first_sibling = 'E',
      last_sibling = 'N',
      toggle_ignored = 'Z',
      toggle_dotfiles = 'H',
      refresh = 'R',
      create = 'a',
      remove = 'd',
      rename = 'r',
      full_rename = {},
      cut = 'x',
      copy = 'c',
      paste = 'p',
      copy_name = 'y',
      copy_path = 'Y',
      copy_absolute_path = {},
      prev_git_item = 'ge',
      next_git_item = 'gn',
      dir_up = {},
      close = 'q',
      toggle_help = '?',
      toggle_open = 'T',
      toggle_refresh = '<LEADER>E',
   },
   packer = {
      install = '<LEADER>pi',
      clean = '<LEADER>pc',
      sync = '<LEADER>ps',
      update = '<LEADER>pu',
   },
   rest = {
      run = '<LEADER><CR>',
      curl = '<LEADER><TAB>',
   },
   spectre = {
      n_open = '<LEADER>S',
      v_open = '<LEADER>W',
      open_file_search = '<LEADER>G',
      toggle_line = 'dd',
      enter_file = '<CR>',
      send_to_qf = '<LEADER>q',
      replace_cmd = '<LEADER>c',
      show_option_menu = '<LEADER>o',
      run_replace = '<LEADER>R',
      change_view_mode = '<LEADER>v',
      toggle_ignore_case = 'ti',
      toggle_ignore_hidden = 'th'
   },
   cmp = {
      select_next_item = '<Tab>',
      select_prev_item = '<S-Tab>',
      scroll_docs_up = '<C-e>',
      scroll_docs_down = '<C-n>',
      confirm = '<CR>'
   },
   telescope = {
      files = '<LEADER>ff',
      old_files = '<LEADER>r',
      bufs = '<LEADER>fb',
      live_grep = '<LEADER>fs',
      buf_fuzzy_find = '<LEADER>ss',
      lsp_type_def = 'g.',
      cmd = 'cm',
      cmd_his = '<LEADER>ch',
      keymap = '<LEADER>mp',
      highlight = '<LEADER>sc',
      lsp_doc_sym = '<LEADER>ds',
      lsp_doc_diag = 'gD',
      lsp_ref = 'gR',
      git_branch = '<LEADER>gb',
      git_diff = '<LEADER>gd',
      git_bcommit = '<LEADER>gv',
      git_commit = '<LEADER>gc',
      git_status = '<LEADER>gs',
      eslint_diag = '<LEADER>zz',
      repo = '<LEADER>.',
      undo = '<LEADER>u',
   },
   toggle_term = {
      h_open = '<C-Enter>',
      v_open = '<S-Enter>',
   },
   ts = {
      rename = 'gr',
      def_nav = 'gdn',
      usage_next = 'grn',
      usage_prev = 'gre',
      list_defs = 'gdN',
      list_defs_toc = 'gt',
      outer_block = '<LEADER>bo',
      inner_block = '<LEADER>bi',
      inner_class = '<LEADER>ci',
      outer_class = '<LEADER>co',
   },
   dadbod = {
      exec_query = '<Space><CR>',
      save_query = '<Space><Tab>',
   },
   vim_database = {
      toggle_query    = '<LEADER>dq',
      toggle_db       = '<LEADER>db',
      list_tables_fzf = '<LEADER>dt',
   },
   maximizer = {
      toggle_max = 'l',
      toggle_max_vertical = 'L',
   },
   vsnip = {
      expand = '<Space>',
      jump_next = '<C-e>',
      jump_prev = '<C-n>',
      select_text = '',
      cut_text = ''
   },
   ufo = {
      open_all = 'zA',
      close_all = 'zF'
   },
   glance = {
      go_to_def = 'gd',
      go_to_impl = 'gi',
      go_to_ref = 'gR',
      go_to_type_def = 'gt',
      actions = {
         next = 'n',
         prev = 'e',
         n_loc = '<Tab>',
         p_loc = '<S-Tab>',
         scroll_up_win = 'E',
         scroll_down_win = 'N',
         close_win = '<ESC>',
         close_win_alt = 'q',
         enter_win = '<C-CR>',
         open_vsplit = 'v',
         open_hsplit = 's',
         open_tab = 't',
         open = '<CR>',
      },
   },
   codeium = {
      accept = '<C-CR>',
      cycle_next = '<C-n>',
      cycle_prev = '<C-p>',
      clear = '<C-q>',
   }
}
