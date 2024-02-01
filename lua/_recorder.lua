require('recorder').setup {
   slots    = { 'a', 'b' },
   clear    = true,
   logLevel = vim.log.levels.OFF,
   mapping  = {
      startStopRecording = 'Q',
      playMacro          = 'q',
      editMacro          = '<LEADER>cq',
      switchSlot         = '<LEADER>sq'
   }
}
