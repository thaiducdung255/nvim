local function map(lhs, rhs, mode, opts)
   local options = { noremap = true, silent = true }
   local vimMode = mode
   if opts then options = vim.tbl_extend('force', options, opts) end
   if mode == nil then vimMode = 'n' end
   vim.api.nvim_set_keymap(vimMode, lhs, rhs, options)
end

function Nmap(lhs, rhs, opts)
   map(lhs, rhs, 'n', opts)
end

function Imap(lhs, rhs, opts)
   map(lhs, rhs, 'i', opts)
end

function Tmap(lhs, rhs, opts)
   map(lhs, rhs, 't', opts)
end

function Vmap(lhs, rhs, opts)
   map(lhs, rhs, 'v', opts)
end

function Inmap(lhs, rhs, opts)
   map(lhs, rhs, 'i', opts)
   map(lhs, rhs, 'n', opts)
end

function Nvmap(lhs, rhs, opts)
   map(lhs, rhs, 'n', opts)
   map(lhs, rhs, 'v', opts)
end

function Invmap(lhs, rhs, opts)
   map(lhs, rhs, 'n', opts)
   map(lhs, rhs, 'v', opts)
   map(lhs, rhs, 'i', opts)
end

O = {
   -- @usage pass a table with your desired languages
   treesitter = {
      ensure_installed = "all",
      ignore_install = {"haskell"},
      highlight = {enabled = true},
      playground = {enabled = true},
      rainbow = {enabled = false}
   },

   python = {
      linter      = '',
      -- @usage can be 'yapf', 'black'
      formatter   = '',
      autoformat  = false,
      isort       = false,
      diagnostics = {virtual_text = true, signs = true, underline = true}
   },
   lua = {
      -- @usage can be 'lua-format'
      formatter   = '',
      autoformat  = false,
      diagnostics = {virtual_text = true, signs = true, underline = true}
   },
   sh = {
      -- @usage can be 'shellcheck'
      linter      = '',
      -- @usage can be 'shfmt'
      formatter   = '',
      autoformat  = false,
      diagnostics = {virtual_text = true, signs = true, underline = true}
   },
   tsserver = {
      -- @usage can be 'eslint'
      linter      = '',
      -- @usage can be 'prettier'
      formatter   = '',
      autoformat  = false,
      diagnostics = {virtual_text = true, signs = true, underline = true}
   },
   json = {
      -- @usage can be 'prettier'
      formatter   = '',
      autoformat  = false,
      diagnostics = {virtual_text = true, signs = true, underline = true}
   },
   -- css = {formatter = '', autoformat = false, virtual_text = true},
   -- json = {formatter = '', autoformat = false, virtual_text = true}
}

DATA_PATH   = vim.fn.stdpath('data')
CACHE_PATH  = vim.fn.stdpath('cache')
