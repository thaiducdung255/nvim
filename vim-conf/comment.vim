" Comment/Uncomment settings+++++++++++++++++++++++++++++++++++++++++++++
function! Comment()
  let ext = tolower(expand('%:e'))
  if ext == 'php' || ext == 'rb' || ext == 'sh' || ext == 'py'
    silent s/^/\#/
  elseif ext == 'js' || ext == 'ts'
    silent s:^:\/\/:g
  elseif ext == 'vim'
    silent s:^:\":g
  endif
endfunction

function! Uncomment()
  let ext = tolower(expand('%:e'))
  if ext == 'php' || ext == 'rb' || ext == 'sh' || ext == 'py' || ext == 'env'
    silent s/^\s*\#//
  elseif ext == 'js' || ext == 'ts'
    silent s:^\s*\/\/::g
  elseif ext == 'vim'
    silent s:^\"::g
  endif
endfunction

map <A-z> :call Comment()<CR>j
map <A-x> :call Comment()<CR>k
map <A-c> :call Uncomment()<CR>j
map <A-v> :call Uncomment()<CR>k
