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
inoremap ;: ``<ESC>i
inoremap ;f =>
inoremap ;v ${}<ESC>i

" number modifiers
inoremap ;q 1
inoremap ;w 2
inoremap ;e 3
inoremap ;r 4
inoremap ;t 5
inoremap ;a 6
inoremap ;s 7
inoremap ;d 8
inoremap ;f 9
inoremap ;g 0
inoremap ;z -
inoremap ;x =

nnoremap <C-q> 1
nnoremap <C-w> 2
nnoremap <C-e> 3
nnoremap <C-r> 4
nnoremap <C-t> 5
nnoremap <C-a> 6
nnoremap <C-s> 7
nnoremap <C-d> 8
nnoremap <C-f> 9
nnoremap <C-g> 0

vnoremap <C-q> 1
vnoremap <C-w> 2
vnoremap <C-e> 3
vnoremap <C-r> 4
vnoremap <C-t> 5
vnoremap <C-a> 6
vnoremap <C-s> 7
vnoremap <C-d> 8
vnoremap <C-f> 9
vnoremap <C-g> 0


" special symbol modifiers
inoremap ;Q !
inoremap ;W @
inoremap ;E #
inoremap ;R $
inoremap ;T %
inoremap ;A ^
inoremap ;S &
inoremap ;D *
inoremap ;F (
inoremap ;G )
inoremap ;Z _
inoremap ;X +
