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

vim.fn.sign_define('DapBreakpoint', { text = '',  texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped',    { text = '壟', texthl = '', linehl = '', numhl = '' })
dap.defaults.fallback.terminal_win_cmd = '80vsplit new'

Nmap('dc', [[:lua require'dap'.continue()<CR>]])
Nmap('db', [[:lua require'dap'.toggle_breakpoint()<CR>]])
Nmap('do', [[:lua require'dap'.step_over()<CR>]])
Nmap('dn', [[:lua require'dap'.step_into()<CR>]])
Nmap('dm', [[:lua require'dap'.step_out()<CR>]])

Nmap('dt',       ':lua require"dap".disconnect({ terminateDebuggee = true });require"dap".close()<CR>')
Nmap('d<CR>',    ':lua require"dap".repl.open()<CR>')
Nmap('d<SPACE>', ':lua require"dap.ui.widgets".hover()<CR>')
Nmap('d<SPACE>', [[:lua require"dap.ui.variables".visual_hover()<CR>]])
Nmap('d<SPACE>', [[:lua require"dap.ui.variables".hover()<CR>]])
