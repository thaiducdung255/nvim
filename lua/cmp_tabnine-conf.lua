local tabnine = require 'cmp_tabnine.config'

tabnine:setup {
   max_line                 = 1000,
   max_num_results          = 5,
   priority                 = 8,
   sort                     = false,
   show_prediction_strength = true,
   ignore_pattern           = '[(),[]]'
}
