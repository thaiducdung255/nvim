" Vim syntax file
" Language:	ENV
" Maintainer:	dungtd10

if !exists("main_syntax")
   if exists("b:current_syntax")
   finish
   endif

   let main_syntax = "env"
elseif exists("b:current_syntax") && b:current_syntax == "env"
   finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn match      envEqual   "="
syn region     envComment start="#" end="\n"
syn match      envStr     "\w\+.*"
syn match      envName    "^[A-Z_]\+"
syn match      envBool    "\(true\|false\)\+"
syn match      envNum     "-\?\d\+\.\=\d*$"

hi def         envComment guifg=#7f8490 gui=italic
hi def         envEqual   guifg=#7f8490 gui=italic
hi def link    envName    Identifier
hi def link    envStr     String
hi def link    envNum     Variable
hi def link    envBool    Operator

let b:current_syntax = "env"

if main_syntax == "env"
   unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
