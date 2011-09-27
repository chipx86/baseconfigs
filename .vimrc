" Vim
" An example for a vimrc file.
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"             for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc

set term=xterm

"set cpo="aABceFst"
set nohlsearch
set nocompatible	" Use Vim defaults (much better!)
set bs=2		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			                " than 50 lines of registers
set history=50        " keep 50 lines of command line history
set ruler             " show the cursor position all the time
set nobackup
set showmatch
set showmode
set laststatus=2
set report=0
set noerrorbells
set vb t_vb=
set nostartofline
set tabstop=4
"set shiftwidth=2
set splitbelow
set statusline=[%{ListedBufNumber()}]\ %f\ %(\ %M%R%H)%)\ ascii(%b)\ hex(0x%B)%=Pos=<%l\,%c%V>\ %P
set dictionary=/usr/dict/words
set magic
set mouse=a
set hidden
set listchars=tab:>>,trail:?,eol:$
set wildignore=*.aux,*.bak,*.dvi,*.gz,*.idx,*.log,*.ps,*.swp,*.tar,*.zip,*.old,*.lo,*.o,*.a,*.la,*.class
set ttyfast
set wildmenu
set noincsearch
set sw=4
set ts=8
set suffixes=.aux,.bak,.dvi,.gz,.idx,.log,.ps,.swp,.tar,.zip,.o,.la,.lo,.lib,.a,.so

" Always use the current buffer's directory as the active directory.
set autochdir

" Make searches case-insensitive if the search terms are all lower-case.
set ignorecase
set smartcase

set scrolloff=2

set iskeyword=@,48-57,_,192-255,-,.,@-@
set shortmess=atI

" Show the filename and path in the titlebar.
set title

" Integrate with ack
set grepprg=ack\ -a


"autocmd!
" Set a nice little type-correction thingy :)
iab aslo       also
iab bianry     binary
iab bianries   binaries
iab charcter   character
iab charcters  characters
iab exmaple    example
iab exmaples   examples
iab shoudl     should
iab seperate   separate
iab teh        the
iab taht       that
iab tpyo       typo
iab tehy       they
iab ahve       have
iab wrold      world
iab wrodl      world
iab wordl      world
iab owrld      world
iab ture       true
iab unsgined   unsigned
iab unsigend   unsigned
iab unsignd    unsigned
iab Timre      Timer
iab timre      timer

" Fix control-* keys
nmap    <ESC>[5^    <C-PageUp>
nmap    <ESC>[6^    <C-PageDown>

" I18N support
if v:lang =~ "^ja_JP"
	set fileencodings=euc-jp
	set guifontset=-misc-fixed-medium-r-normal--14-*-*-*-*-*-*-*
endif
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
	set fileencodings=utf-8
endif

" Remaps
noremap <C-G> 2<C-G>

" Make Control-E/Y viewport scrolling move 3 lines at a time.
nnoremap <C-e> <C-e><C-e><C-e>
nnoremap <C-y> <C-y><C-y><C-y>

" Make < and > block indent shifting not lose selection
vnoremap < <gv
vnoremap > >gv

if !has("gui_running")
  set background=dark
else
  set background=light
endif

"----------------------------------------------------------
" Macros
"----------------------------------------------------------
"   Multi-session copy and paste
nmap _Y :.w! ~/.vi_tmp<CR>
vmap _Y :w! ~/.vi_tmp<CR>
nmap _P :r ~/.vi_tmp<CR>

"   ,ve  =  edit ~/.vimrc
map ,ve     :e ~/.vimrc<CR>
"   ,vu  =  source ~/.vimrc
map ,vu     :so ~/.vimrc<CR>

map E e<RIGHT>

"    I use , as a prefix for all sorts of maps. Restore this in normal mode
noremap g, ,

"    If I accidentally hit :W, I want it to translate to :w
nmap :W :w

" Write a file as root, in case I forgot to sudo to root before editing.
map :sudow :w !sudo tee %

"    If I hit Control-Z, go to a shell instead of suspending
map <C-Z> :shell<CR>

" Remap Control-Space to do code completion
inoremap <Nul> <C-x><C-o>

" FuzzyFinderTextMate -
" http://github.com/jamis/fuzzyfinder_textmate/tree/master
map <C-F> :FuzzyFinderTextMate<CR>

" NERDTree
map <C-\> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$']

" TagList
map <C-_> :TlistToggle<CR>

" BufExplorer
map <C-_> :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Enable_Fold_Column = 0


function! ListedBufNumber()
	let l:curNum = bufnr("%")
	let l:count = 1
	for i in range(1, bufnr("$"))
		if buflisted(i) && getbufvar(i, "&modifiable")
			if i == l:curNum
				return l:count
			endif
			let l:count = l:count + 1
		endif
	endfor

	return "u" . l:curNum
endfunction

"----------------------------------------------------------
" Misc. Stuff
"----------------------------------------------------------

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost * if line("'\"") | exe "'\"" | endif
endif

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq


augroup cprog
  " Remove all cprog autocommands
  au!

  " When starting to edit a file:
  "   For *.c and *.h files set formatting of comments and set C-indenting on.
  "   For other files switch it off.
  "   Don't change the order, it's important that the line with * comes first.
  autocmd BufRead *       set formatoptions=tcql nocindent comments&
  autocmd BufRead *.c,*.h set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
augroup END

augroup gzip
  " Remove all gzip autocommands
  au!

  " Enable editing of gzipped files
  "	  read:	set binary mode before reading the file
  "		uncompress text in buffer after reading
  "	 write:	compress file after writing
  "	append:	uncompress file, append, compress file
  autocmd BufReadPre,FileReadPre	*.gz set bin
  autocmd BufReadPost,FileReadPost	*.gz let ch_save = &ch|set ch=2
  autocmd BufReadPost,FileReadPost	*.gz '[,']!gunzip
  autocmd BufReadPost,FileReadPost	*.gz set nobin
  autocmd BufReadPost,FileReadPost	*.gz let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost	*.gz execute ":doautocmd BufReadPost " . expand("%:r")

  autocmd BufWritePost,FileWritePost	*.gz !mv <afile> <afile>:r
  autocmd BufWritePost,FileWritePost	*.gz !gzip <afile>:r

  autocmd FileAppendPre			*.gz !gunzip <afile>
  autocmd FileAppendPre			*.gz !mv <afile>:r <afile>
  autocmd FileAppendPost		*.gz !mv <afile> <afile>:r
  autocmd FileAppendPost		*.gz !gzip <afile>:r
augroup END

" Stuff for Mutt
"au BufNewFile,BufRead ~/.mutt/*   set ft=muttrc
"au BufNewFile,BufRead /tmp/mutt*  set ft=muttrc


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  " set hlsearch
endif

"    Include some files
source $HOME/.vim/misc.vim
source $HOME/.vim/filetypes.vim
source $HOME/.vim/folding.vim
source $HOME/.vim/tabs.vim
