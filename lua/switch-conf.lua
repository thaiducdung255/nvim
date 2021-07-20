vim.g.switch_mapping = '<CR>'

vim.g.jsAndTsOptions = {
   { 'true', 'false' },
   { 'toUpperCase', 'toLowerCase' },
   { 'toString', 'toISOString' },
   {'new Date()', 'Date.now()'},
   {'resolve', 'reject'},
   {'string', 'String', 'Promise<string>', 'Promise<String>'},
   {'number', 'Number', 'Promise<number>', 'Promise<Number>'},
   {'boolean', 'Boolean', 'Promise<boolean>', 'Promise<Boolean>'},
   {'string', 'String', 'Promise<string>', 'Promise<String>'},
   {'object', 'Object', 'Promise<object>', 'Promise<Object>'},
   {'null', 'undefined', 'NaN'},
   {'||', '&&'},
   {'==', '!=='},
   {' >', ' <'},
   {'let ', 'const '},
   {'++', ' += 1'},
   {'--', ' -= 1'},
   {'export', 'export default'},
   {'console.log', 'process.stdout.write'},
   {'JSON.parse', 'JSON.stringify'},
   {'.map', '.reduce', '.filter', '.forEach'},
}

vim.cmd('autocmd FileType javascript let g:switch_custom_definitions = jsAndTsOptions')
vim.cmd('autocmd FileType typescript let g:switch_custom_definitions = jsAndTsOptions')
vim.cmd('autocmd FileType typescriptreact let g:switch_custom_definitions = jsAndTsOptions')
