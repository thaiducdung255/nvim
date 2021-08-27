" Vim syntax file
" Language:	HTTP
" Maintainer:	dungtd10

if !exists("main_syntax")
  " quit when a syntax file was already loaded
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'http'
elseif exists("b:current_syntax") && b:current_syntax == "http"
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn keyword    httpMethod         GET PUT POST PATCH DELETE
syn match      httpBraces         "[{}]"
syn match      httpPath           "\/\w\+"
syn match      httpQuery          "?[0-9a-zA-Z-_=&\.]\+"
syn match      httpUrl2           "\s[a-zA-Z0-9\._-]\+"
syn match      httpUrl            "\s[a-zA-Z0-9\.]\+:[0-9]\+"
syn match      httpHeader         "[a-zA-Z-]\+:\s[a-zA-Z\/]\+"
syn region     httpComment        start="#" end="\n"
syn match      httpBodyValStr	  "\".\+\"" 
syn match      httpBodyKey	  "\s\{2,200}\"\w\+\"" 
syn match      httpBodyValNumber  "\s\d\+"

hi def         httpMethod         guifg=Red gui=bold,italic
hi def         httpHeader         guifg=#5dbbc1 gui=italic
hi def         httpComment        guifg=#7f8490 gui=italic
hi def         httpUrl            guifg=#d38aea
hi def         httpUrl2           guifg=#d38aea
hi def link    httpQuery          String
hi def link    httpBodyValStr     String
hi def         httpBraces         guifg=#deb974
hi def         httpPath           guifg=#deb974
hi def         httpBodyKey        guifg=#deb974
hi def         httpBodyValNumber  guifg=#d38aea

let b:current_syntax = "http"
if main_syntax == 'http'
  unlet main_syntax
endif
let &cpo = s:cpo_save
unlet s:cpo_save
