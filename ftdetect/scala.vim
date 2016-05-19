function! Scala_setting()
setf scala
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=0
endfunction

au BufNewFile,BufRead *.scala :call Scala_setting()

