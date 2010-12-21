set nocompatible " Don't care about VI-compatibility. Must be first, causes side effects
"" Makes bundles/plugins easier to manage. 
call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set paste        " Allow pasting from OS X
set autoindent   " Keep the indent level when hitting Return
set copyindent   " copy previous indentation when auto indenting
set smartindent  " Use smart indenting (mostly useful for C/C++ files)
set cindent      " Don't indent Python really poorly
set tabstop=4    " Make tabs appear four spaces wide (default is 8 spaces)
set shiftwidth=4
set noexpandtab  " Use hard tabs please! Watch out for files with soft tabs
                 " that don't have a modeline present, especially Python
                 "                  " files.
set fo=tcoqan    " Options for formatting text (i.e. for use with gq)
colorscheme elflord
set background=dark
filetype plugin on
filetype indent on

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" if has("multi_byte")
" 	if &termencoding == ""
" 		let &termencoding = &encoding
" 	endif
	" set encoding=utf-8
	" setglobal fileencoding=utf-8 bomb
	" set fileencodings=ucs-bom,utf-8,latin1
" endif

"EXPERIMENTAL
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Remap omni-completion to CTRL+SPACE
inoremap <C-space> <C-x><C-o>
" trim trailing whitespace
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
" trim leading whitespace
autocmd BufWritePre *.py normal m`:%s/^\s\+$//e ``
" autoindent improved
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
nnoremap ; : 
nnoremap j gj
nnoremap k gk
nmap <silent> ,/ :nohlsearch<CR>
" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" END EXPER


" Fast saving
nmap <leader>w :w!<cr>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

"" Autoreload vimrc, from:
""     http://www.oreillynet.com/onlamp/blog/2006/08/make_your_vimrc_trivial_to_upd_1.html
",v brings up my .vimrc
",V reloads it -- making all changes active (have to save first)
map <leader>v :sp $MYVIMRC<CR><C-W>_
map <silent> <leader>V :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

map <F6> :execute 'NERDTreeToggle ' . getcwd()<CR>
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
:map <F4> :!cd ~/pg/loc;make<CR>

" How much history to keep around
set history=800


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch   " Find as you type
set hlsearch
set isk+=-      " Match - as part of whole word seach using * and #
set confirm " Ask to save files
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch   " Show matching parens as they come up
set ruler       " Show the column number in the status bar
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set wildmenu    " Get a cool menu for tab completing file names
set wildignore=*.swp,*.bak,*.pyc,*.class
set title       " set the terminal's title
set nocompatible " Don't care about VI-compatibility
set lz          " Don't redraw the screen in the middle of executing macros
set visualbell t_vb=
set smartcase   " Ignore case, unless caps are used in the search
behave xterm    " Just in case...
set lbr         " Wrap only at word boundaries (default is at any character)
set cursorline "Warning! Disguises commas and periods.
set showcmd     " show partial commands in status line and
                " selected characters/lines in visual mode
set mouse=r
"" Status line
set laststatus=2 "Always have a status line
set showtabline=2 " Always have a tab bar
set statusline=%2n:*%-32.32f%*\ \ %2*%r%m%*\ %=%y\%15(%l/%L:%c\ (%2p%%)%)
set pastetoggle=<F2> " toggle to turn off vim smartness while pasting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile
" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, if your computer crashes you're SOL so save often!
set hidden

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" Tab configuration
map <leader>tn :tabnew %<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <C-I> :tabprevious<cr>
map <C-O> :tabnext<cr>

"" <3 <3 <3 LustyExplorer
map <leader>e :LustyFilesystemExplorer
" Just for documentation
":LustyFilesystemExplorer
":LustyFilesystemExplorerFromHere
":LustyBufferExplorer
":LustyBufferGrep (for searching through all open buffers)
"
"<Leader>lf  - Opens filesystem explorer.
"<Leader>lr  - Opens filesystem explorer at the directory of the current file.
"<Leader>lb  - Opens buffer explorer.
"<Leader>lg  - Opens buffer grep.


command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
		let l:currentBufNum = bufnr("%")
		let l:alternateBufNum = bufnr("#")

		if buflisted(l:alternateBufNum)
				buffer #
				else
				bnext
		endif

		if bufnr("%") == l:currentBufNum
				new
		endif

		if buflisted(l:currentBufNum)
				execute("bdelete! ".l:currentBufNum)
		endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=tags;$HOME
" ctags love
" Open the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Open the tab in a vsplit
map <leader>] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <silent> <leader>f :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Process_File_Always=1
let Tlist_Show_Menu=1
let Tlist_Enable_Fold_Column=0
let g:gist_detect_filetype = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Syntax Highlighting
syntax enable   " Who wouldn't want syntax highlighting?
let python_highlight_all = 1
let python_highlight_indent_errors = 0
let python_highlight_space_errors = 0
au BufRead,BufNewFile *.js.tmpl set filetype=javascript 
au BufRead,BufNewFile *.css.tmpl set filetype=css 

au FileType python syn keyword pythonDecorator True None False self
" autocmd FileType python source ~/.vim/python_fold.vim
" autocmd FileType python set omnifunc=pythoncomplete#Complete
"" this makes python auto indent less retarded
let g:pyindent_open_paren = '&sw * 1'
let g:pyindent_nested_paren = '&sw'
let g:pyindent_continue = '&sw * 1'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other useful stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Find(name)
	let l:list=system("find . -name '".a:name."' | grep -v \".svn/\" | perl -ne 'print \"$.\\t$_\"'")
	let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
	if l:num < 1
		echo "'".a:name."' not found"
		return
	endif
	if l:num != 1
		echo l:list
		let l:input=input("Which ? (CR=nothing)\n")
		if strlen(l:input)==0
			return
		endif
		if strlen(substitute(l:input, "[0-9]", "", "g"))>0
			echo "Not a number"
			return
		endif
		if l:input<1 || l:input>l:num
			echo "Out of range"
			return
		endif
		let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
	else
	  let l:line=l:list
	endif
	let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
	execute ":e ".l:line
endfunction

"" Dumb shortcuts for finding crap
command! -nargs=1 Find :call Find("<args>")

"" Other useful shortcuts for me, alan
command! Restart :!myapachectl -k restart
command! Loc :!ls -l ~/pg/loc 
command! -nargs=1 Pf :!pf "<args>" 
command! -nargs=1 Tf :!tf "<args>" 
command! -nargs=1 Jsf !jsf "<args>" 
command! -nargs=1 Cf :!cf "<args>" | grep -v build 
command! -nargs=1 Decid :!python tools/decid.py "<args>" 
command! -nargs=1 Encid :!python tools/encid.py "<args>" 
command!  Jslint :!js -s -C %
command! Pb :!cat % | pastebinit - 
command! -nargs=1 Flakes :r !pyflakes "<args>"

"" <3 Conque
command! I :ConqueTermVSplit ipython
command! Sh :ConqueTermVSplit bash
command! Devdb :ConqueTermSplit mysql -uyelpdev -h devdb
command! Tailapperror :ConqueTermTab tail_apperror

