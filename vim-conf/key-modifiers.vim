" js auto convert ops
inoremap ,, ,<CR>
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" auto insert brackets alternatives
inoremap ;j ()<ESC>i
inoremap ;k []<ESC>i
inoremap ;l {}<ESC>i
inoremap ;h ``<ESC>i
inoremap ;a =>
inoremap ;v ${}<ESC>i

" number modifiers
inoremap ;q 1
inoremap ;w 2
inoremap ;e 3
inoremap ;r 4
inoremap ;t 5
inoremap ;y 6
inoremap ;u 7
inoremap ;i 8
inoremap ;o 9
inoremap ;p 0

nnoremap 'q 1
nnoremap 'w 2
nnoremap 'e 3
nnoremap 'r 4
nnoremap 't 5
nnoremap 'y 6
nnoremap 'u 7
nnoremap 'i 8
nnoremap 'o 9
nnoremap 'p 0

vnoremap 'q 1
vnoremap 'w 2
vnoremap 'e 3
vnoremap 'r 4
vnoremap 't 5
vnoremap 'y 6
vnoremap 'u 7
vnoremap 'i 8
vnoremap 'o 9
vnoremap 'p 0


" special symbol modifiers
inoremap 'q !
inoremap 'w @
inoremap 'e #
inoremap 'r $
inoremap 't %
inoremap 'y ^
inoremap 'u &
inoremap 'i *
inoremap 'o (
inoremap 'p )
