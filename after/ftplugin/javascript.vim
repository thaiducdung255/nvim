" Preserve existing doge settings.
let b:doge_patterns = get(b:, 'doge_patterns', {})
let b:doge_supported_doc_standards = get(b:, 'doge_supported_doc_standards', [])
if index(b:doge_supported_doc_standards, 'js') < 0
   call add(b:doge_supported_doc_standards, 'js')
endif

" Set the new doc standard as default.
let b:doge_doc_standard = 'js'

" Ensure we do not overwrite an existing doc standard.
if !has_key(b:doge_patterns, 'js')
   let b:doge_patterns['js'] = [
            \  {
            \    'nodeTypes': ['NODE_TYPE_A', 'NODE_TYPE_B'],
            \    'parameters': {
            \      'format': '@param {name} !description',
            \    },
            \    'template': [
            \    ],
            \  },
            \]
endif
