" An example for a vimrc file.
"
" Original Maintainer:  Bram Moolenaar <Bram@vim.org>
" Present Maintainer:   Allen Zhong <allenZ@mail.atr.me>
"
" To use it, copy it to
"     for Unix and OS/2:    ~/.vimrc
"     for Amiga:            s:.vimrc
"     for MS-DOS and Win32: $VIM\_vimrc
"     for OpenVMS:          sys$login:.vimrc

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

call pathogen#infect()
call pathogen#helptags()

set encoding=UTF-8
set fileencodings=ucs-bom,utf-8,gb2312,gb18030,gbk,cp936,euc-jp,euc-kr,latin1
" Use Unix as the standard file type
set ffs=unix,dos,mac
set formatoptions=tcrqn
set smarttab
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup " do not keep a backup file, use versions instead
else
  set backupdir=~/.vim/backup,/tmp " keep a backup file
endif
set history=80 " keep 80 lines of command line history
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set wrapscan
set linespace=0 " No extra spaces between rows
set number
set showmatch
set ignorecase " Case insensitive search
set smartcase " Case sensitive when uc present
set pastetoggle=<F9> " pastetoggle (sane indentation on pastes)

" Visualize tabs, trailing whitespaces and funny characters
" http://www.reddit.com/r/programming/comments/9wlb7/proggitors_do_you_like_the_idea_of_indented/c0esam1
" https://wincent.com/blog/making-vim-highlight-suspicious-characters
set list
set listchars=nbsp:¬,trail:$,tab:>-,extends:»,precedes:«

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Arrow Key Fix
" https://github.com/spf13/spf13-vim/issues/780
if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
  inoremap <silent> <C-[>OC <RIGHT>
endif

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
  set mousehide
endif

" keyboard shortcuts
let mapleader = '\'
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>l :Align
nmap <leader>a :Ack
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR><CR>
nmap <leader>] :TagbarToggle<CR>
nmap <leader><space> :call whitespace#strip_trailing()<CR>
nmap <leader>g :GitGutterToggle<CR>
nmap <leader>c <Plug>Kwbd
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
"nnoremap <esc> :nohl<cr>
nnoremap <silent> <leader>q :nohlsearch <cr>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
syntax enable

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

if has("gui_running")
  set background=light
  color atr
elseif &t_Co > 2
  set t_Co=256
  set background=dark
  color atr
else
  set background=dark
  color solarized
endif

" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7
set sidescrolloff=15
set sidescroll=1

" No annoying sound on errors
set noerrorbells
set novisualbell
set timeoutlen=500

" Cursor Highlighting
" Ref: https://gist.github.com/pera/2624765#gistcomment-1277417

set updatetime=3000
let g:boostmove = 0
au CursorMoved * call BoostMoveON()
au CursorMovedI * call BoostMoveON()
au CursorHold * call BoostMoveOFF()
au CursorHoldI * call BoostMoveOFF()

function BoostMoveON()
    if (g:boostmove == 0)
        set updatetime=200
        let g:boostmove = 1
        setlocal nocursorline
        setlocal nocursorcolumn
    endif
endfunction

function BoostMoveOFF()
    if g:boostmove == 1
        set updatetime=3000
        let g:boostmove = 0
        setlocal cursorline
        setlocal cursorcolumn
    endif
endfunction

let python_highlight_all = 1
let python_highlight_builtins = 1
let python_highlight_exceptions = 1
let python_print_as_function = 1
let python_highlight_indent_errors = 1
let python_highlight_space_errors = 1
let python_highlight_file_headers_as_comments = 1

let g:cpp_class_scope_highlight = 1

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" Automatic closing of quotes
let delimitMate_expand_cr = 1

" Status line
if exists("g:loaded_statline_plugin")
  set laststatus=2
  let g:lightline = {
      \  'colorscheme': 'jellybeans',
      \  'active': {
      \    'left': [['mode', 'paste', 'readonly'],
      \             ['fugitive', 'filename', 'modified']],
      \    'right': [['lineinfo'],
      \              ['formatops', 'percent'],
      \              ['fileformat', 'fileencoding', 'filetype']]
      \  },
      \  'component': {
      \    'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \    'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
      \    'formatops': '%{&fo}'
      \   },
      \  'component_visible_condition': {
      \    'readonly': '(&filetype!="help"&& &readonly)',
      \    'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \    'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
      \  }
      \ }
endif
let g:loaded_statline_plugin = 1

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

  " For all text files set 'textwidth' to 80 characters.
  autocmd FileType text setlocal textwidth=80

  " Instead of reverting the cursor to the last position in the buffer, we
  " set it to the first line when editing a git commit message
  au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

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
  set autoindent " always set autoindenting on
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
let g:NERDSpaceDelims = 1
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

if has("autocmd")
  autocmd StdinReadPre * let s:std_in=1
  "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
  " automatically rebalance windows on vim resize
  autocmd VimResized * :wincmd =
endif

" Fix Cursor in TMUX
if exists('$TMUX')
  set ttymouse=xterm2
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
