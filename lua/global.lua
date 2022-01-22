local function map(lhs, rhs, mode, isSilentOff)
   local options = { noremap = true, silent = true }
   if  isSilentOff == true then options.silent = false end
   local vimMode = 'n'
   if mode then vimMode = mode end
   vim.api.nvim_set_keymap(vimMode, lhs, rhs, options)
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
   map(lhs, rhs, 'i', isSilentOff)
   map(lhs, rhs, 'c', isSilentOff)
end

function Map(lhs, rhs, isSilentOff)
   map(lhs, rhs, 'i', isSilentOff)
   map(lhs, rhs, 'n', isSilentOff)
   map(lhs, rhs, 'v', isSilentOff)
   map(lhs, rhs, 'c', isSilentOff)
end

function Inmap(lhs, rhs, isSilentOff)
   map(lhs, rhs, 'i', isSilentOff)
   map(lhs, rhs, 'n', isSilentOff)
end

function Nvmap(lhs, rhs, isSilentOff)
   map(lhs, rhs, 'n', isSilentOff)
   map(lhs, rhs, 'v', isSilentOff)
end

function Invmap(lhs, rhs, isSilentOff)
   Inmap(lhs, rhs, isSilentOff)
   Vmap(lhs, rhs, isSilentOff)
end

function Omap(lhs, rhs, isSilentOff)
   map(lhs, rhs, 'o', isSilentOff)
end

function Map(lhs, rhs, isSilentOff)
   Invmap(lhs, rhs, isSilentOff)
   Cmap(lhs, rhs, isSilentOff)
end

DATA_PATH   = vim.fn.stdpath('data')
CACHE_PATH  = vim.fn.stdpath('cache')
