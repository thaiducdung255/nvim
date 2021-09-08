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

syn keyword    httpMethod         GET HEAD PUT POST PATCH DELETE CONNECT OPTIONS TRACE
syn match      httpBraces         "[{}\[\]]"
syn match      httpUrl            "\s[htps:\/]*[a-zA-Z0-9\.-=]\+[0-9:]*"
syn match      httpPath           "\/[a-zA-Z0-9-_\.]\+"
syn match      httpQuery          "?[0-9a-zA-Z-_=&\.:]\+"
syn match      httpHeader         "^[a-zA-Z-0-9]\+:\s[a-zA-Z0-9\/\.,-;=\*\s:\"]\+"
syn region     httpComment        start="#" end="\n"
syn match      httpBodyValStr	    "\".*\"" 
syn match      httpBodyKey	       "[\s]\{0,200}\"\w\+\":" 
syn match      httpColon          ",$"
syn match      httpNumber         "-*\d\+\.*\d*"
syn keyword    httpBoolean        true false
syn region     httpResComment     start="HTTP" end="[\n\r]\{2}"

hi def         httpMethod         guifg   =Red      gui=bold,italic
hi def         httpHeader         guifg   =#5dbbc1  gui=italic
hi def         httpUrl            guifg   =#d38aea
hi def         httpNumber         guifg   =#d38aea
hi def         httpBoolean        guifg   =#d38aea
hi def         httpBraces         guifg   =#ec7279
hi def         httpPath           guifg   =#deb974
hi def         httpColon          guifg   =#deb974
hi def         httpBodyKey        guifg   =#deb974
hi def link    httpQuery          String
hi def link    httpBodyValStr     String
hi def link    httpComment        Comment
hi def link    httpResComment        Comment

let b:current_syntax = "http"
if main_syntax == 'http'
  unlet main_syntax
endif
let &cpo = s:cpo_save
unlet s:cpo_save
