vim.cmd [[function! SynStack()
   if !exists("*synstack")
      return
   endif

   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
   endfunc

   nnoremap <LEADER>sy :call SynStack()<CR>
]]

require('themes/' .. vim.g.theme)
