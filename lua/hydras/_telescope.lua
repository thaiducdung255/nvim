local hydra       = require('_hydra')
local tls_builtin = require('telescope.builtin')
local telescope   = require('telescope')
local map         = require('_utils').map

local function repo()
   return telescope.extensions.repo.list {
      fd_opts = { '--no-ignore-vcs' },
      search_dirs = { '~/Projects', '~/Downloads', '~/.config' },
   }
end

local function lsp_functions()
   tls_builtin.treesitter({ symbols = 'function' })
end

local keymap = {
   body    = 'f',
   buf_fzf = '?',
   heads   = {
      Gcm          = { key = '<tab>', fn = tls_builtin.git_commits },
      gcm          = { key = '<cr>', fn = tls_builtin.git_bcommits },
      file         = { key = 'f', fn = tls_builtin.find_files },
      ['mr-file']  = { key = 'r', fn = tls_builtin.oldfiles },
      buf          = { key = 'b', fn = tls_builtin.buffers },
      ripgrep      = { key = 's', fn = tls_builtin.live_grep },
      tsitter      = { key = 'd', fn = lsp_functions },
      ['type-def'] = { key = 't', fn = tls_builtin.lsp_type_definitions },
      cmd          = { key = 'c', fn = tls_builtin.commands },
      ['cmd-his']  = { key = 'C', fn = tls_builtin.command_history },
      map          = { key = 'm', fn = tls_builtin.keymaps },
      hi           = { key = 'h', fn = tls_builtin.highlights },
      branch       = { key = 'g', fn = tls_builtin.git_branches },
      repo         = { key = '.', fn = repo },
      undo         = { key = 'u', fn = telescope.extensions.undo.undo },
      ['mr-cmd']   = { key = ',', fn = tls_builtin.resume },
   }
}

hydra.create({
   name   = 'FD',
   keymap = keymap
})

map('n', keymap.buf_fzf, tls_builtin.current_buffer_fuzzy_find)
