let g:switch_mapping=":"

let jsAndTsOptions = 
   \[
      \['true', 'false'],
      \['toUpperCase', 'toLowerCase'],
      \['toString', 'toISOString'],
      \['new Date()', 'Date.now()'],
      \['resolve', 'reject'],
      \['string', 'String', 'Promise<string>', 'Promise<String>'],
      \['number', 'Number', 'Promise<number>', 'Promise<Number>'],
      \['boolean', 'Boolean', 'Promise<boolean>', 'Promise<Boolean>'],
      \['string', 'String', 'Promise<string>', 'Promise<String>'],
      \['object', 'Object', 'Promise<object>', 'Promise<Object>'],
      \['null', 'undefined', 'NaN'],
      \['||', '&&'],
      \['==', '!=='],
      \[' >', ' <'],
      \['let ', 'const '],
      \['++', ' += 1'],
      \['--', ' -= 1'],
      \['export', 'export default'],
      \['console.log', 'process.stdout.write'],
      \['JSON.parse', 'JSON.stringify'],
      \['.map', '.reduce', '.filter', '.forEach'],
      \{
         \'const\s\(\k\+\)\s=\s(\(\k\+\))\s=>': 'function \1(\2)',
         \'(\(\k\+\))': '(!\1)',
         \'(!\(\k\+\))': '(\1)',
         \'{\(\k\+\)}': '{ \1 }',
      \}
   \]

autocmd FileType javascript let g:switch_custom_definitions = jsAndTsOptions
autocmd FileType typescript let g:switch_custom_definitions = jsAndTsOptions
autocmd FileType typescriptreact let g:switch_custom_definitions = jsAndTsOptions
