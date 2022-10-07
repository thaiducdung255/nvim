local map = require('_utils').map
local keycodes = require('_keymap')

local dap = require('dap')

dap.adapters.node2 = {
   type    = 'executable',
   command = 'node',
   args    = { os.getenv('HOME') .. '/.config/nvim/debug-adapters/vscode-node-debug2/out/src/nodeDebug.js' },
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

map('n', keycodes.dap.continue, [[:lua require'dap'.continue()<CR>]])
map('n', keycodes.dap.toggle_break_point, [[:lua require'dap'.toggle_breakpoint()<CR>]])
map('n', keycodes.dap.step_over, [[:lua require'dap'.step_over()<CR>]])
map('n', keycodes.dap.step_into, [[:lua require'dap'.step_into()<CR>]])
map('n', keycodes.dap.step_out, [[:lua require'dap'.step_out()<CR>]])

map('n', keycodes.dap.disconnect, ':lua require"dap".disconnect({ terminateDebuggee = true });require"dap".close()<CR>')
map('n', keycodes.dap.open_repl, ':lua require"dap".repl.open()<CR>')
map('n', keycodes.dap.hover, ':lua require"dap.ui.widgets".hover()<CR>')
map('n', keycodes.dap.hover, [[:lua require"dap.ui.variables".visual_hover()<CR>]])
map('n', keycodes.dap.hover, [[:lua require"dap.ui.variables".hover()<CR>]])