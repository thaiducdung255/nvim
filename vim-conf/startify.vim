function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU FILES']            },
        \ { 'type': 'dir',       'header': ['   MRU DIRS'. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

let g:startify_custom_indices = ['a', 's', 'd', 'f', 'G', 'h', 'j', 'k', 'l', ':',
         \'A', 'S', 'D', 'H', 'J', 'K', 'L',
         \'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '/'
         \'Z', 'X', 'C', 'V', 'B', '<', '>', '?']
