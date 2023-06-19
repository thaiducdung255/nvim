local hydra    = require('_hydra')
local cmd      = require('hydra.keymap-util').cmd
local gitsigns = require('gitsigns')


local function toggle_zen_mode()
   gitsigns.toggle_linehl()
   gitsigns.toggle_deleted()
end

local keymap = {
   body  = '<LEADER>g',
   heads = {
      ['n-hunk'] = { key = 'n', fn = gitsigns.next_hunk, exit = false },
      ['p-hunk'] = { key = 'e', fn = gitsigns.prev_hunk, exit = false },
      reset      = { key = 'u', fn = gitsigns.reset_hunk, exit = false },
      Reset      = { key = 'U', fn = gitsigns.reset_buffer },
      stage      = { key = 's', fn = gitsigns.stage_hunk, exit = false },
      Stage      = { key = 'S', fn = gitsigns.stage_buffer },
      zen        = { key = '>', fn = toggle_zen_mode, exit = false },
      preview    = { key = '.', fn = gitsigns.preview_hunk_inline, exit = false },
      open       = { key = '<cr>', fn = cmd 'DiffviewOpen' },
      his        = { key = '<tab>', fn = cmd 'DiffviewFileHistory' },
   }
}

hydra.create({
   name = 'Git',
   keymap = keymap,
   conf = {
      wait = true,
      timeout = 8000,
      on_exit = function()
         gitsigns.toggle_linehl(false)
         gitsigns.toggle_deleted(false)
      end
   }
})
