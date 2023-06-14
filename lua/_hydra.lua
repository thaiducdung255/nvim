local M = {}

function M.conf(opts)
   local default_opts = {
      color = 'red',
      position = 'middle-right',
      wait = false,
   }

   opts = opts or {}
   opts.color = opts.color or default_opts.color
   opts.position = opts.position or default_opts.position
   opts.wait = opts.wait or default_opts.wait

   local result = {
      timeout        = 4000,
      color          = opts.color,
      invoke_on_body = true,
      foreign_key    = 'run',
      hint           = {
         border   = 'rounded',
         position = opts.position
      }
   }

   if (opts.wait) then
      result.on_key = function()
         vim.wait(50)
      end
   end

   return result
end

function M.head_conf(exit)
   return {
      exit   = exit == nil or exit == true,
      silent = true,
      nowait = true
   }
end

return M
