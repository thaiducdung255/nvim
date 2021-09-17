vim.g.switch_mapping = '<CR>'

vim.g.jsAndTsOptions = {
   { 'string',      'String',       'Promise<string>',   'Promise<String>' },
   { 'number',      'Number',       'Promise<number>',   'Promise<Number>' },
   { 'boolean',     'Boolean',      'Promise<boolean>',  'Promise<Boolean>' },
   { 'string',      'String',       'Promise<string>',   'Promise<String>' },
   { 'object',      'Object',       'Promise<object>',   'Promise<Object>' },
   { '.map',        '.reduce',      '.filter',           '.forEach' },
   { 'null',        'undefined',    'NaN' },
   { 'true',        'false' },
   { 'toUpperCase', 'toLowerCase' },
   { 'toString',    'toISOString' },
   { 'new Date()',  'Date.now()' },
   { 'resolve',     'reject' },
   { '||',          '&&' },
   { '==',          '!==' },
   { ' >',          ' <' },
   { 'let ',        'const ' },
   { '++',          ' += 1' },
   { '--',          ' -= 1' },
   { 'export',      'export default' },
   { 'console.log', 'process.stdout.write' },
   { 'JSON.parse',  'JSON.stringify' },
}

vim.cmd('autocmd FileType javascript,typescript,typescriptreact let g:switch_custom_definitions = jsAndTsOptions')
