require('recorder').setup {
   slots    = { 'a', 'b' },
   clear    = false,
   logLevel = vim.log.levels.OFF,
   mapping  = {
      startStopRecording = 'q',
      playMacro          = 'Q',
      editMacro          = 'cq',
      switchSlot         = 'sq'
   }
}
