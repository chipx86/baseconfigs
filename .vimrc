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

"----------------------------------------------------------
" Load/install/configure plugins
"----------------------------------------------------------

call plug#begin('~/.vim/plugged')


" Abolish: Smarter substitutions
" URL: https://github.com/tpope/tpope-vim-abolish
" Usage:
"     Substitution:
"         Instead of:
"
"             :%s/foo/bar/g
"             :%s/Foo/Bar/g
"             :%s/FOO/BAR/g
"
"         You can do:
"
"             :%Subvert/foo/bar/g
"
"         And instead of:
"
"             :%s/facility/building/g
"             :%s/Facility/Building/g
"             :%s/FACILITY/BUILDING/g
"             :%s/facilities/buildings/g
"             :%s/Facilities/Buildings/g
"             :%s/FACILITIES/BUILDINGS/g
"
"         You can do:
"
"             :%Subvert/facilit{y,ies}/building{,s}/g
"
"     Shortcuts:
"         "crs" - Convert text on cursor to snake_case
"         "crm" - Convert text on cursor to MixedCase
"         "crc" - Convert text on cursor to camelCase
"         "cru" - Convert text on cursor to UPPER_CASE
"         "cr-" - Convert text on cursor to dash-case
"         "cr." - Convert text on cursor to dot.case
"         "cr " - Convert text on cursor to space case
"         "crt" - Convert text on cursor to Title Case
"
Plug 'tpope/tpope-vim-abolish'


"
" Airline: Statusline plugin
" URL: https://github.com/vim-airline/vim-airline
"
Plug 'vim-airline/vim-airline', {'tag': 'v0.7-124-gca6ab34'}
source $HOME/.vim/config/plugins/airline.vim


" bufexplorer
source $HOME/.vim/config/plugins/bufexplorer.vim


"
" CAW: VIM comment plugin
" URL: https://github.com/tyru/caw.vim
" Usage:
"     Manage comments at the beginning of a line, respecting indentation:
"         "gci"  - comment
"         "gcui" - uncomment
"         "gcc"  - toggle
"
"     Manage comments at the beginning of a line (column 0):
"         "gcI"  - comment
"         "gcuI" - uncomment
"
"     Manage comments at the end of a line (when inserting, 4 spaces will be
"     added):
"         "gca"  - comment
"         "gcua" - uncomment
"
"     Wrap lines in a comment (one comment per line):
"         "gcw"  - comment
"         "gcuw" - uncomment
"
"     Add a new comment on the next line and begin typing:
"         "gco"
"
"     Add a new comment on the previous line line and begin typing:
"         "gcO"
"
Plug 'tyru/caw.vim'


"
" CtrlP: Fuzzy completion for buffers and files
" URL: https://github.com/ctrlpvim/ctrlp.vim
" Usage:
"     "Control-B" - Search for buffers
"     "Control-P" - Search for files
"
Plug 'ctrlpvim/ctrlp.vim'
source $HOME/.vim/config/plugins/ctrlp.vim


"
" Dash: Uses Dash.app to look up API docs.
" URL: https://github.com/rizzatti/dash.vim
" Usage:
"     ":Dash" - Look up docs for the current word.
"
Plug 'rizzatti/dash.vim'
source $HOME/.vim/config/plugins/dash.vim


"
" Fugitive: Git utilities for Vim
" URL: https://github.com/tpope/vim-fugitive
"
Plug 'tpope/vim-fugitive'


"
" Flog
" URL: https://github.com/rbong/vim-flog
"
Plug 'rbong/vim-flog'
"source $HOME/.vim/config/plugins/vim-flog.vim


"
" Funcoo: Functional Object Oriented VimL (used by other plugins)
" URL: https://github.com/rizzatti/funcoo.vim
"
Plug 'rizzatti/funcoo.vim'


"
" GitGutter
" URL: https://github.com/airblade/vim-gitgutter
"
Plug 'airblade/vim-gitgutter'
source $HOME/.vim/config/plugins/vim-gitgutter.vim


"
" Gundo: Undo manager
" URL: https://github.com/sjl/gundo.vim
" Usage:
"     "\g" - Open the Gundo panel.
"
source $HOME/.vim/config/plugins/gundo.vim
Plug 'sjl/gundo.vim'


"
" Indent Guides: Displays indentation levels
" URL: https://github.com/nathanaelkane/vim-indent-guides
" Usage:
"     "\ig" - Toggle showing indentation levels.
"
Plug 'nathanaelkane/vim-indent-guides'
source $HOME/.vim/config/plugins/vim-indentation-guides.vim


"
" vim-multiple-cursor: Create and interact with multiple cursors
" URL: https://github.com/terryma/vim-multiple-cursors
" Usage:
"     "Control-N": Highlight the current word and create a cursor. Repeat
"                  to search for the next occurrence. When ready, use "i"
"                  or "s" or anything else to edit all selected words.
"
Plug 'terryma/vim-multiple-cursors'


"
" vim-python-pep8-indent: Modify Python indentation for better PEP-8.
" URL: https://github.com/Vimjas/vim-python-pep8-indent
"
Plug 'Vimjas/vim-python-pep8-indent'


"
" vimproc: Interactive command execution (used by other plugins)
" URL: https://github.com/Shougo/vimproc.vim
"
Plug 'Shougo/vimproc.vim', {'do': 'make'}


call plug#end()


"----------------------------------------------------------
" Load all the other config files.
"----------------------------------------------------------

"    Include some files
source $HOME/.vim/config/filetypes.vim
source $HOME/.vim/config/folding.vim
source $HOME/.vim/config/netrw.vim
source $HOME/.vim/config/tabs.vim
source $HOME/.vim/config/ui.vim
"source $HOME/.vim/config/macros/changelogs.vim
source $HOME/.vim/config/macros/text.vim
"source $HOME/.vim/conf/plugins/neocomplcache.vim
"source $HOME/.vim/conf/plugins/unite.vim


"----------------------------------------------------------
" Load plugins via pathogen.
"----------------------------------------------------------

call pathogen#infect()
call pathogen#helptags()
