" An example for a vimrc file.
"
" Original Maintainer:	Bram Moolenaar <Bram@vim.org>
" Present Maintainer:   Allen Zhong <allenZ@mail.atr.me>
" Last change:	2015 Feb 16
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

call pathogen#infect()
call pathogen#helptags()

set encoding=UTF-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set formatoptions=tcrqn
set autoindent
"set cindent
set smarttab
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backupdir=~/.vim/backup,/tmp		" keep a backup file
endif
set history=80		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set wrapscan
set number

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
"if has('mouse')
"  set mouse=a
"endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
syntax on
set hlsearch
if &t_Co > 2 || has("gui_running")
  "set background=light
  "colorscheme solarized
  color dracula
else
  set background=dark
  colorscheme solarized
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  autocmd FileType c set omnifunc=ccomplete#Complete
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  set magic

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" winmanager   
  let g:NERDTree_title = "[NERDTree]"
  function! NERDTree_Start()
      exe 'NERDTree'
  endfunction
  function! NERDTree_IsValid()
      return 1
  endfunction

  let g:winManagerWindowLayout = 'NERDTree'
  "let g:winManagerWindowLayout='NERDTree|BufExplorer'
  "let g:winManagerWindowLayout = 'FileExplorer|TagList'
  "let g:winManagerWindowLayout = 'FileExplorer'
  let g:winManagerWidth = 25
  let g:defaultExplorer = 1
  nmap wm :WMToggle<cr>
  "nmap <C-W><C-F> :FirstExplorerWindow<cr>
  "nmap <C-W><C-B> :BottomExplorerWindow<cr>
  "autocmd BufWinEnter \[Buf\ List\] setl nonumber
