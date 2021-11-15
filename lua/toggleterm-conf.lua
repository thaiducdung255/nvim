require('toggleterm').setup{
   open_mapping    = [[<Space>;]],
   hide_numbers    = true,
   shade_filetypes = {},
   shade_terminals = true,
   shading_factor  = '1',
   start_in_insert = false,
   insert_mappings = false,
   persist_size    = true,
   direction       = 'horizontal',
   close_on_exit   = true,
   shell           = vim.o.shell,
   size = function(term)
      if term.direction == 'horizontal' then
         return 15
      elseif term.direction == 'vertical' then
         return vim.o.columns * 0.4
      end
   end,
   float_opts = {
      border   = 'single',
      width    = 200,
      height   = 100,
      winblend = 3,
      highlights = {
         border     = 'Normal',
         background = 'Normal',
      }
   }
}
