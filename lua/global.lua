local function map(lhs, rhs, mode, isSilentOff)
   local options = { noremap = true, silent = true }
   local vimMode = 'n'

   if lhs.ascii and lhs.colemak then
      if os.getenv('KEYBOARD_LAYOUT') == 'colemak' then
         lhs = lhs.colemak
      else
         lhs = lhs.ascii
      end
   end

   if  isSilentOff == true then options.silent = false end

   if mode then vimMode = mode end

   vim.keymap.set(vimMode, lhs, rhs, options)
end

function Nmap(lhs, rhs, isSilentOff)
   map(lhs, rhs, 'n', isSilentOff)
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
   mappings = {
      nav_right = {
         ascii   = '<LEADER>l',
         colemak = '<LEADER>o',
      },
      nav_up = {
         ascii   = '<LEADER>k',
         colemak = '<LEADER>u',
      },
      nav_left = {
         ascii   = '<LEADER>h',
         colemak = '<LEADER>h',
      },
      nav_down = {
         ascii   = '<LEADER>j',
         colemak = '<LEADER>n',
      },
      v_inc_win_size = {

      },
      v_desc_win_size = {

      },
      h_inc_win_size = {

      },
      h_desc_win_size = {

      },
   },
}
