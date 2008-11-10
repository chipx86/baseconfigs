" drc_stubs.vim: stub/abbrevations for the C language
"  Author   : Charles E. Campbell, Jr.
"  Copyright: 1999
" Use at your own risk.
"inoremap `	<Esc>:call DrChipCStubs()<CR>a

function! DrChipCStubs()
 let wrd=expand("<cWORD>")

 if     wrd == "if"
  exe "norm! bdWaif ()\<CR>{\<CR>}\<Esc>kklll"
 elseif wrd == "i"
  exe "norm! xaif ()\<CR>{\<CR>}\<Esc>kklll"

 elseif wrd == "else"
  exe "norm! bdWaelse\<CR>{\<CR>}\<Esc>O \<c-h>\<Esc>"
 elseif wrd == "el"
  exe "norm! xaelse\<CR>{\<CR>}\<Esc>O \<c-h>\<Esc>"

 elseif wrd == "elif"
  exe "norm! bdWaelse if ()\<CR>{\<CR>}\<Esc>k$kF("
 elseif wrd == "ei"
  exe "norm! xaelse if ()\<CR>{\<CR>}\<Esc>k$kF("

 elseif wrd == "for"
  exe "norm! bdWafor (;;)\<CR>{\<CR>}\<Esc>k$kF("
 elseif wrd == "f"
  exe "norm! xafor (;;)\<CR>{\<CR>}\<Esc>k$kF("

 elseif wrd == "while"
  exe "norm! bdWawhile ()\<CR>{\<CR>}\<Esc>k$kF("
 elseif wrd == "w"
  exe "norm! xawhile ()\<CR>{\<CR>}\<Esc>k$kF("

 elseif wrd == "switch"
  exe "norm! bdWaswitch ()\<CR>{\<CR>}\<Esc>k$kF("
 elseif wrd == "s"
  exe "norm! xaswitch ()\<CR>{\<CR>}\<Esc>k$kF("

 elseif wrd == "case"
  exe "norm! bdWacase :\<CR>{\<CR>\<TAB>break;\<CR>\<BS>}\<Esc>kkkhf:h"
 elseif wrd == "c"
  exe "norm! xacase :\<CR>{\<CR>\<TAB>break;\<CR>\<BS>}\<Esc>kkkhf:h"

 elseif wrd == "default"
  exe "norm! bdWadefault:\<CR>{\<CR>\<TAB>\<CR>break;\<CR>\<BS>}\<Esc>kk"
 elseif wrd == "d"
  exe "norm! xadefault:\<CR>{\<CR>\<TAB>\<CR>break;\<CR>\<BS>}\<Esc>kk"

 elseif wrd == "do"
  exe "norm! bdWado\<CR>{\<CR>\<TAB>\<CR>\<BS>} while();\<Esc>k"

 elseif wrd == "Edbg"
  exe "norm! bdWaEdbg((\"\<Esc>ma[[?)\<CR>%BdwP`apa()\"));\<Esc>F("
 elseif wrd == "E"
  exe "norm! xaEdbg((\"\<Esc>ma[[?)\<CR>%BdwP`apa()\"));\<Esc>F("

 elseif wrd == "Rdbg"
  exe "norm! bdWaRdbg((\"\<Esc>ma[[?)\<CR>%BdwP`apa\"));\<Esc>F\"h"
 elseif wrd == "Rdbg"
  exe "norm! xaRdbg((\"\<Esc>ma[[?)\<CR>%BdwP`apa\"));\<Esc>F\"h"

 elseif wrd == "Dprintf"
  exe "norm! bdWaDprintf((1,\"\"));\<Esc>4h"
 elseif wrd == "D"
  exe "norm! xaDprintf((1,\"\"));\<Esc>4h"
 else
  exe "norm! a`\<Esc>"
 endif
endfunction
