local map = require('_utils').map

local keycodes = {
   continue           = '<LEADER>dc',
   toggle_break_point = '<LEADER>dB',
   step_over          = '<LEADER>do',
   step_into          = '<LEADER>di',
   step_out           = '<LEADER>dm',
   disconnect         = '<LEADER>dT',
   open_repl          = 'd<CR>',
   hover              = 'd<ESC>',
}

local dap = require('dap')

dap.adapters.node2 = {
   type    = 'executable',
   args    = { os.getenv('HOME') .. '/.config/nvim/debug-adapters/vscode-node-debug2/out/src/nodeDebug.js' },
   command = 'node',
}

dap.configurations.javascript = {
   {
      type       = 'node2',
      request    = 'launch',
      program    = '${workspaceFolder}/${file}',
      cwd        = vim.fn.getcwd(),
      sourceMaps = true,
      protocol   = 'inspector',
      console    = 'integratedTerminal',
   }
}

vim.fn.sign_define('DapBreakpoint', { text = '', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '壟', texthl = '', linehl = '', numhl = '' })
dap.defaults.fallback.terminal_win_cmd = '80vsplit new'

map('n', keycodes.continue, [[:lua require'dap'.continue()<CR>]])
map('n', keycodes.toggle_break_point, [[:lua require'dap'.toggle_breakpoint()<CR>]])
map('n', keycodes.step_over, [[:lua require'dap'.step_over()<CR>]])
map('n', keycodes.step_into, [[:lua require'dap'.step_into()<CR>]])
map('n', keycodes.step_out, [[:lua require'dap'.step_out()<CR>]])

map('n', keycodes.disconnect, ':lua require"dap".disconnect({ terminateDebuggee = true });require"dap".close()<CR>')
map('n', keycodes.open_repl, ':lua require"dap".repl.open()<CR>')
map('n', keycodes.hover, ':lua require"dap.ui.widgets".hover()<CR>')
map('n', keycodes.hover, [[:lua require"dap.ui.variables".visual_hover()<CR>]])
map('n', keycodes.hover, [[:lua require"dap.ui.variables".hover()<CR>]])
