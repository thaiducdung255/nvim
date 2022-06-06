require('spectre').setup({
   color_devicons     = true,
   line_sep_start     = '┌-----------------------------------------',
   result_padding     = '¦   ',
   line_sep           = '└-----------------------------------------',
   highlight          = {
      ui      = 'String',
      search  = 'DiffChange',
      replace = 'DiffDelete'
   },
   mapping            = {
      ['toggle_line'] = {
         map  = 'dd',
         cmd  = '<cmd>lua require(\'spectre\').toggle_line()<CR>',
         desc = 'toggle current item'
      },
      ['enter_file'] = {
         map  = '<CR>',
         cmd  = '<cmd>lua require(\'spectre.actions\').select_entry()<CR>',
         desc = 'goto current file'
      },
      ['send_to_qf'] = {
         map  = '<LEADER>q',
         cmd  = '<cmd>lua require(\'spectre.actions\').send_to_qf()<CR>',
         desc = 'send all item to quickfix'
      },
      ['replace_cmd'] = {
         map  = '<LEADER>c',
         cmd  = '<cmd>lua require(\'spectre.actions\').replace_cmd()<CR>',
         desc = 'input replace vim command'
      },
      ['show_option_menu'] = {
         map  = '<LEADER>o',
         cmd  = '<cmd>lua require(\'spectre\').show_options()<CR>',
         desc = 'show option'
      },
      ['run_replace'] = {
         map  = '<LEADER>R',
         cmd  = '<cmd>lua require(\'spectre.actions\').run_replace()<CR>',
         desc = 'replace all'
      },
      ['change_view_mode'] = {
         map  = '<LEADER>v',
         cmd  = '<cmd>lua require(\'spectre\').change_view()<CR>',
         desc = 'change result view mode'
      },
      ['toggle_ignore_case'] = {
         map  = 'ti',
         cmd  = '<cmd>lua require(\'spectre\').change_options(\'ignore-case\')<CR>',
         desc = 'toggle ignore case'
      },
      ['toggle_ignore_hidden'] = {
         map  = 'th',
         cmd  = '<cmd>lua require(\'spectre\').change_options(\'hidden\')<CR>',
         desc = 'toggle search hidden'
      },
   },
   find_engine        = {
      ['rg'] = {
         cmd = 'rg',
         args = {
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
         },
         options = {
            ['ignore-case'] = {
               value = '--ignore-case',
               icon  = '[I]',
               desc  = 'ignore case'
            },
            ['hidden'] = {
               value = '--hidden',
               desc  = 'hidden file',
               icon  = '[H]'
            },
         }
      },
      ['ag'] = {
         cmd = 'ag',
         args = {
            '--vimgrep',
            '-s'
         },
         options = {
            ['ignore-case'] = {
               value = '-i',
               icon  = '[I]',
               desc  = 'ignore case'
            },
            ['hidden'] = {
               value = '--hidden',
               desc  = 'hidden file',
               icon  = '[H]'
            },
         },
      },
   },
   replace_engine     = {
      ['sed'] = {
         cmd  = 'sed',
         args = nil
      },
      options = {
         ['ignore-case'] = {
            value = '--ignore-case',
            icon  = '[I]',
            desc  = 'ignore case'
         },
      }
   },
   default            = {
      find = {
         cmd     = 'rg',
         options = { 'ignore-case' }
      },
      replace = {
         cmd = 'sed'
      }
   },
   replace_vim_cmd    = 'cdo',
   is_open_target_win = true, --open file on opener window
   is_insert_mode     = false, -- start open panel on is_insert_mode
})

Nmap(Keycodes.spectre.n_open, [[:lua require('spectre').open()<CR>]])
Vmap(Keycodes.spectre.v_open, [[:lua require('spectre').open_visual()<CR>]])
Nmap(Keycodes.spectre.open_file_search, [[viw:lua require('spectre').open_file_search()<CR>]])
