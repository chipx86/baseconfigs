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
set modelines=5  " MacOS X will set to 0, so ensure we're at a sane default.
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
set wildignore=*.aux,*.bak,*.dvi,*.gz,*.idx,*.log,*.ps,*.swp,*.tar,*.zip,*.old,*.lo,*.o,*.a,*.la,*.class,.*.sw*,*.pyc,*.orig,*.rej
set ttyfast
set wildmenu
set noincsearch
set sw=4
set ts=4
set suffixes=.aux,.bak,.dvi,.gz,.idx,.log,.ps,.swp,.tar,.zip,.o,.la,.lo,.lib,.a,.so

" Enable persistent undo state.
set undofile
set undodir=~/.vim/undodir

" Use 256-colors
set t_Co=256

" Always use the current buffer's directory as the active directory.
set autochdir

" Use relative line numbers
set relativenumber

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

" Save a shift key when going into command mode.
map ; :

" Make Control-E/Y viewport scrolling move 3 lines at a time.
nnoremap <C-e> <C-e><C-e><C-e>
nnoremap <C-y> <C-y><C-y><C-y>

" Make < and > block indent shifting not lose selection
vnoremap < <gv
vnoremap > >gv

" Add some friendlier page up/down movements. These are for the MacOS
" character codes (which come across as Escape).
nnoremap <Esc>J <PageDown>
nnoremap <Esc>K <PageUp>

"----------------------------------------------------------
" Macros
"----------------------------------------------------------
"   Multi-session copy and paste
nmap _Y :.w! ~/.vi_tmp<CR>
vmap _Y :w! ~/.vi_tmp<CR>
nmap _P :r ~/.vi_tmp<CR>

" Clipboard support on MacOS X
vmap <C-c> :w !pbcopy<CR><CR>

"   ,ve  =  edit ~/.vimrc
map ,ve     :e ~/.vimrc<CR>
"   ,vu  =  source ~/.vimrc
map ,vu     :so ~/.vimrc<CR>

map E e<RIGHT>

" Yanv to EOL.
map Y y$

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
"map <C-F> :FuzzyFinderTextMate<CR>


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

"    Include some files
source $HOME/.vim/config/filetypes.vim
source $HOME/.vim/config/folding.vim
source $HOME/.vim/config/netrw.vim
source $HOME/.vim/config/tabs.vim
source $HOME/.vim/config/ui.vim
"source $HOME/.vim/config/macros/changelogs.vim
source $HOME/.vim/config/macros/text.vim
source $HOME/.vim/config/plugins/airline.vim
source $HOME/.vim/config/plugins/ctrlp.vim
source $HOME/.vim/config/plugins/dash.vim
source $HOME/.vim/config/plugins/gundo.vim
source $HOME/.vim/config/plugins/nerd-commenter.vim
"source $HOME/.vim/conf/plugins/neocomplcache.vim
"source $HOME/.vim/conf/plugins/unite.vim
source $HOME/.vim/config/plugins/vim-gitgutter.vim
source $HOME/.vim/config/plugins/vim-indentation-guides.vim

" Load any and all plugins registered with pathogen.
call pathogen#infect()
call pathogen#helptags()
