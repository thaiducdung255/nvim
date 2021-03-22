nnoremap <silent><LEADER>el 0v$:DB<CR>

function! s:connectToMongoDB()
  call inputsave()
  let host = input('host: ')
  call inputrestore()
  call inputsave()

  let db_name = input('db name: ')
  call inputrestore()
  call inputsave()
  redraw

  let db_url = host . ':27017/' . db_name

  execute('let g:db="mongodb://' . db_url . '"')
  echo "connected to mongodb: " . db_url
endfunction

command! Mongo call <SID>connectToMongoDB()
