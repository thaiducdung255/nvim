local keyboard_layout = os.getenv('KEYBOARD_LAYOUT')

local function map(lhs, rhs, mode, isSilentOff)
   local options = { noremap = true, silent = true }

   lhs = Get_key_code(lhs)

   if  isSilentOff == true then options.silent = false end

   vim.keymap.set(mode, lhs, rhs, options)
end

function Get_key_code(lhs)
   if lhs.ascii and lhs.colemak then
      if keyboard_layout == 'colemak' then
         return lhs.colemak
      end

      return lhs.ascii
   end

   if lhs.ascii then
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

if keyboard_layout == 'colemak' then
   Nvmap('s', 'd')
   Nvmap('j', 'y')
   Nvmap('k', 'i')
   Nvmap('i', 'o')
   Nvmap(';', 'p')

   Nvmap('n', 'j')
   Nvmap('e', 'k')
   Nvmap('i', 'l')
end
