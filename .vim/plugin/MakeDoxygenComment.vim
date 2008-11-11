if exists("loaded_MakeDoxygenComment")
    finish
endif
let loaded_MakeDoxygenComment = 1

if !exists("g:MakeDoxygenComment_briefTag")
    let g:MakeDoxygenComment_briefTag=" "
endif
if !exists("g:MakeDoxygenComment_paramTag")
    let g:MakeDoxygenComment_paramTag="@param "
endif
if !exists("g:MakeDoxygenComment_returnTag")
    let g:MakeDoxygenComment_returnTag="@return "
endif
if !exists("g:MakeDoxygenComment_blockHeader")
    let g:MakeDoxygenComment_blockHeader=""
endif
if !exists("g:MakeDoxygenComment_blockFooter")
    let g:MakeDoxygenComment_blockFooter=""
endif

function! <SID>MakeDoxygenComment()
    mark d
    exec "normal {"
    exec "normal o/**" . g:MakeDoxygenComment_blockHeader ."\<cr>" . g:MakeDoxygenComment_briefTag
    let l:synopsisLine=line(".")
    let l:synopsisCol=col(".")
    let l:nextParamLine=l:synopsisLine+2
    exec "normal a\<cr>\<cr>\<cr>\<cr>\<cr>" . g:MakeDoxygenComment_returnTag . "\<cr>\<bs>" . g:MakeDoxygenComment_blockFooter . "*/"
    exec "normal `d"
    let l:line=getline(line("."))
    let l:startPos=match(l:line, "(")
    let l:matchIndex=match(l:line,"\\i\\+\s*[,)]",l:startPos)
    let l:foundParam=0
    while (l:matchIndex >= 0)
        let l:foundParam=1
        exec "normal " . (l:matchIndex + 1) . "|"
        let l:param=expand("<cword>")
        exec l:nextParamLine
        exec "normal O" . g:MakeDoxygenComment_paramTag . l:param . "  "
        let l:nextParamLine=l:nextParamLine+1

        exec "normal `d"
        "echo "l:startPos before: " . l:startPos
        "echo "l:matchIndex = " . l:matchIndex
        "echo "strlen=" . strlen(l:param)
        "echo "total=" . (l:matchIndex+strlen(l:param)+1)
        let l:startPos=(l:matchIndex+strlen(l:param)+1)
        "echo "l:startPos after: " . l:startPos
        let l:matchIndex=match(line,"\\i\\+\s*[,)]",l:startPos)
    endwhile

    exec l:nextParamLine
    exec "normal dj"
    if (l:foundParam < 1)
        exec "normal dd"
    endif
    exec l:synopsisLine
    exec "normal " . l:synopsisCol . "|"
    startinsert!
endfunction

command! -nargs=0 Dox :call <SID>MakeDoxygenComment()
