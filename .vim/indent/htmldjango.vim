if exists("b:did_indent")
    finish
endif

unlet! b:did_indent

setlocal indentexpr=

let b:did_indent = 1
