vim.g.switch_mapping = Get_key_code(Keycodes.switch.exec)


vim.api.nvim_create_autocmd(
   'FileType',
   {
      pattern  = 'javascript,typescript,typescriptreact,javascriptreact',

      callback = function()
         vim.g.switch_custom_definitions = {
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
            { '===',          '!==' },
            { ' >',          ' <' },
            { 'let ',        'const ' },
            { '++',          ' += 1' },
            { '--',          ' -= 1' },
            { 'export',      'export default' },
            { 'console.log', 'process.stdout.write' },
            { 'JSON.parse',  'JSON.stringify' },
         }
      end
   }
)
