local hydra       = require('hydra')
local conf        = require('_hydra')
local tls_builtin = require('telescope.builtin')
local telescope   = require('telescope')
local map         = require('_utils').map

local keymap      = {
   body    = 'f',
   buf_fzf = '?'
}

local hint        = [[
---[FD]---

_<tab>_ Gcm
_<cr>_  gcm

_f_ file
_r_ mr file
_b_ buf
_s_ ripgrep
_z_ tsitter
_t_ type def
_c_ cmd
_C_ cmd his
_m_ map
_h_ hi
_d_ symbol
_x_ diag
_g_ branch
_._ repo
_u_ undo
_,_ mr cmd
]]

local function repo()
   return telescope.extensions.repo.list {
      fd_opts = { '--no-ignore-vcs' },
      search_dirs = { '~/Projects', '~/Downloads', '~/.config' },
   }
end

hydra {
   name = 'Telescope',
   hint = hint,
   config = conf.conf(),
   body = keymap.body,
   mode = 'n',
   heads = {
      { 'f',     tls_builtin.find_files,               conf.head_conf() },
      { 'r',     tls_builtin.oldfiles,                 conf.head_conf() },
      { 'b',     tls_builtin.buffers,                  conf.head_conf() },
      { 's',     tls_builtin.live_grep,                conf.head_conf() },
      { 'z',     tls_builtin.treesitter,               conf.head_conf() },
      { 't',     tls_builtin.lsp_type_definitions,     conf.head_conf() },
      { 'c',     tls_builtin.commands,                 conf.head_conf() },
      { 'C',     tls_builtin.command_history,          conf.head_conf() },
      { 'm',     tls_builtin.keymaps,                  conf.head_conf() },
      { 'h',     tls_builtin.highlights,               conf.head_conf() },
      { 'd',     tls_builtin.lsp_document_symbols,     conf.head_conf() },
      { 'x',     tls_builtin.lsp_document_diagnostics, conf.head_conf() },
      { 'g',     tls_builtin.git_branches,             conf.head_conf() },
      { '<tab>', tls_builtin.git_commits,              conf.head_conf() },
      { '<cr>',  tls_builtin.git_bcommits,             conf.head_conf() },
      { ',',     tls_builtin.resume,                   conf.head_conf() },
      { '.',     repo,                                 conf.head_conf() },
      { 'u',     telescope.extensions.undo.undo,       conf.head_conf() },
   }
}

map('n', keymap.buf_fzf, tls_builtin.current_buffer_fuzzy_find)
