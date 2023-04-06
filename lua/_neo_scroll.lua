local keycodes       = require('_keymap').sys

local neoscroll      = require('neoscroll')
local neoscroll_conf = require('neoscroll.config')

neoscroll.setup({
   hide_cursor          = true,  -- Hide cursor while scrolling
   stop_eof             = true,  -- Stop at <EOF> when scrolling downwards
   respect_scrolloff    = true,  -- Stop scrolling when the cursor reaches the scrolloff margin of the file
   cursor_scrolls_alone = false, -- The cursor will keep on scrolling even if the window cannot scroll further
   easing_function      = nil,   -- Default easing function
   pre_hook             = nil,   -- Function to run before the scrolling animation starts
   post_hook            = nil,   -- Function to run after the scrolling animation ends
   performance_mode     = false, -- Disable "Performance Mode" on all buffers.
   mappings             = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', },
})

local mappings = {
   [keycodes.scroll.d] = { 'scroll', { 'vim.wo.scroll', 'true', '180' } },
   [keycodes.scroll.u] = { 'scroll', { '-vim.wo.scroll', 'true', '180' } },
}

neoscroll_conf.set_mappings(mappings)
