require('recorder').setup {
   slots    = { 'a', 'b' },
   clear    = true,
   logLevel = vim.log.levels.OFF,
   mapping  = {
      startStopRecording = 'q',
      playMacro          = 'Q',
      editMacro          = '<LEADER>cq',
      switchSlot         = '<LEADER>sq'
   }
}
