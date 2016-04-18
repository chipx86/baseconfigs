" Disable the embedded syntax feature of newer syntax/rst.vim for a few reasons:
" - It doesn't work with both "c" and "cpp" active simultaneously, since both
"   rely on including syntax/c.vim, and the double inclusion of this file
"   causes problems.
" - It requires a fairly new Vim, and we'd like to support older ones, too.
" - It marks the block with NoSpell, which we don't want.
" - It's easier to disable the support in syntax/rst.vim entirely than to
"   partially use it and work around its limitations.
function! DisableRstSyntaxCodeList()
    if exists ("g:rst_syntax_code_list") && len(g:rst_syntax_code_list) > 0
        echoerr "Disabling g:rst_syntax_code_list; use g:rstEmbeddedLangs"
    endif
    let g:rst_syntax_code_list = []
endfunction

call DisableRstSyntaxCodeList()

" NOTE: Embedding java causes spell checking to be disabled, because
" the syntax file for java monkeys with the spell checking settings.
let g:rstEmbeddedLangs = ["c", "cpp", "html", "python", "sh", "vim",
\                         "django", "diff", "html+django", "javascript"]

" Special-case C because Vim's syntax highlighting for cpp
" is based on the C highlighting, and it doesn't like to
" have both C and CPP active at the same time.  Map C highlighting
" to CPP to avoid this problem.
let g:rstLangAliases = {
\    'c': 'cpp',
\    'html+django': 'htmldjango',
\}

" -------------------------------------------------------------
" Setup for reStructuredText.
" -------------------------------------------------------------
function! SetupRstSyntax()
    " Layout embedded source as follows:
    " .. code-block:: lang
    "     lang-specific source code here.
    " ..
    function! s:EmbedCodeBlock(lang, synGroup)
        if a:lang == ""
            let region = "rstCodeBlock"
            let regex = ".*"
        else
            let region = "rstDirective" . substitute(a:lang, '+', '', '')
            let regex = a:lang
        endif
        silent! syn clear region
        let cmd  = 'syntax region ' . region
        let cmd .= ' matchgroup=rstDirective fold'
        let cmd .= ' start="^\z(\s*\)\.\.\s\+'
        let cmd .= '\%(sourcecode\|code-block\|code\)::\s\+'
        let cmd .= regex . '\s*$"'
        " @todo Don't forget to highlight :options: lines
        " such as :linenos:
        let cmd .= ' skip="\n\z1\s\|\n\s*\n"'
        let cmd .= ' end="$"'
        if a:synGroup != ""
            let cmd .= " contains=@" . a:synGroup
        endif
        execute cmd
        execute 'syntax cluster rstDirectives add=' . region
    endfunction

    call DisableRstSyntaxCodeList()
    " Handle unspecified languages first.
    call s:EmbedCodeBlock("", "")
    let includedLangs = {}
    for lang in g:rstEmbeddedLangs
        let synLang = get(g:rstLangAliases, lang, lang)
        let synGroup = "rst" . synLang
        if !has_key(includedLangs, synLang)
            silent! call SyntaxInclude(synGroup, synLang)
            let includedLangs[synLang] = 1
        endif
        call s:EmbedCodeBlock(lang, synGroup)
    endfor

    " Re-synchronize syntax highlighting from start of file.
    syntax sync fromstart
endfunction
command! -bar SetupRstSyntax call SetupRstSyntax()

SetupRstSyntax
