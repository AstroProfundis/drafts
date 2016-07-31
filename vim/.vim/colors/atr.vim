" Maintainer: Allen Zhong <moeallenz@gmail.com>
" Contributor: Felipe Contreras <felipe.contreras@gmail.com>
"
" References:
" http://vimcasts.org/episodes/creating-colorschemes-for-vim/
" :runtime syntax/hitest.vim
" https://github.com/gerw/vim-HiLinkTrace
" Forked from felipec

if &t_Co != 256 && ! has("gui_running")
  echomsg "err: please use GUI or a 256-color terminal (so that t_Co=256 could be set)"
  finish
endif

set background=dark

hi clear

if version > 580
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "atr"

if exists("b:current_syntax")
  if b:current_syntax == "diff"
    syn match diffFileId "^diff.*"
    syn match diffFile "^index .*"
    syn match diffOldFile "^--- .*"
    syn match diffNewFile "^+++ .*"
  elseif b:current_syntax == "vim"
    syn match vimHiGuiRgb contained "#\x\{3\}\>"
  endif
endif

" General colors
hi Normal    guifg=#eeeeee    ctermfg=255    guibg=#121212    ctermbg=232    gui=NONE
hi Cursor    guifg=NONE    guibg=#bbddee    ctermbg=153    gui=NONE
hi MatchParen    guibg=#5566aa    ctermbg=61

" UI colors
hi ErrorMsg    guifg=#000000    ctermfg=0    guibg=#ffcc88    ctermbg=222    gui=bold
hi Folded    guifg=#8888ff    ctermfg=105    guibg=#121212    ctermbg=232    gui=bold
hi FoldColumn    guifg=#8888ff    ctermfg=105    guibg=#121212    ctermbg=232    gui=bold
hi NonText    guifg=#888888    ctermfg=102    guibg=#121212    ctermbg=232    gui=NONE
hi Search    guifg=#6600aa    ctermfg=55    guibg=#ddbbee    ctermbg=183    gui=underline
hi IncSearch    ctermfg=235    ctermbg=186    cterm=NONE    guifg=#272822    guibg=#e6db74    gui=NONE
hi SpellBad    guisp=#bb5555
hi SpellCap    guisp=#5555bb
hi SpellRare    guisp=#bb55bb
hi SpellLocal    ctermfg=232    guifg=#121212    guisp=#55bbbb
hi LineNr    guifg=#bbbb88    ctermfg=144
hi CursorLineNr    guifg=#eeff88    ctermfg=228    gui=bold
hi CursorLine    guibg=#232323    ctermbg=235    cterm=NONE
hi CursorColumn    guibg=#232323    ctermbg=235
hi Visual    guibg=#444444    ctermbg=238
hi Pmenu    guifg=#221133    ctermfg=235    guibg=#ddbbee    ctermbg=183
hi PmenuSbar    ctermbg=238
hi PmenuSel    guifg=#ddbbee    ctermfg=183    guibg=#221133    ctermbg=235
hi SignColumn    guifg=#88ffff    guibg=#232323
hi StatusLine    ctermfg=231    ctermbg=241    cterm=bold    guifg=#f8f8f2    guibg=#64645e    gui=bold
hi StatusLineNC    ctermfg=231    ctermbg=241    cterm=NONE    guifg=#f8f8f2    guibg=#64645e    gui=NONE
hi Directory    ctermfg=141    ctermbg=NONE    cterm=NONE    guifg=#ae81ff    guibg=NONE    gui=NONE
hi Folded    ctermfg=242    ctermbg=235    cterm=NONE    guifg=#75715e    guibg=#272822    gui=NONE
hi Title    ctermfg=255    cterm=bold    guifg=#eeeeee    gui=bold

" Syntax highlighting
hi Comment    guifg=#808080    ctermfg=244    gui=italic

"" Constants
hi Constant    guifg=#ff87a5    ctermfg=211    gui=NONE
hi String    guifg=#70b870    ctermfg=71    gui=italic
hi Boolean    guifg=#ff9696    ctermfg=217    gui=bold

hi Identifier    guifg=#ae81ff    ctermfg=147    gui=NONE
hi Function    guifg=#ffdb6e    ctermfg=222    gui=bold
hi Float    ctermfg=211    ctermbg=NONE    cterm=NONE    guifg=#ff87a5    guibg=NONE    gui=NONE
hi Label    ctermfg=186    ctermbg=NONE    cterm=NONE    guifg=#e6db74    guibg=NONE    gui=NONE
hi Operator    ctermfg=122    ctermbg=NONE    cterm=NONE    guifg=#6effcf    guibg=NONE    gui=NONE

hi Statement    guifg=#88ccff    ctermfg=117    gui=NONE
hi PreProc    guifg=#cc88ff    ctermfg=177    gui=NONE
hi Type    guifg=#eeff88    ctermfg=228    gui=NONE
hi Special    guifg=#dadada    ctermfg=253    gui=NONE
hi SpecialKey    ctermfg=71    ctermbg=237    cterm=NONE    guifg=#70b870    gui=NONE

hi Todo    guifg=#444444    ctermfg=238    guibg=#999999    ctermbg=246    gui=bold
hi Error    guifg=#000000    ctermfg=0    guibg=#ffcc88    ctermbg=222    gui=bold

hi Define    ctermfg=167    ctermbg=NONE    cterm=NONE    guifg=#dc7373    guibg=NONE    gui=NONE

hi Underlined    guifg=#88aaff    ctermfg=111    gui=underline

hi DiffAdd    guifg=#90ff99    ctermfg=120    guibg=#121212    ctermbg=232    gui=NONE
hi DiffDelete    guifg=#d70000    ctermfg=160    guibg=#121212    ctermbg=232    gui=NONE
hi DiffChange    guibg=#334455    ctermbg=238    gui=NONE
hi DiffText    guibg=#334455    ctermbg=238    gui=NONE

hi diffAdded    guifg=#55ff55    ctermfg=83    gui=NONE
hi diffRemoved    guifg=#ff5555    ctermfg=203    gui=NONE
hi diffFileId    guifg=#6600aa    ctermfg=55    guibg=#ddbbee    ctermbg=183    gui=NONE
hi diffFile    guifg=#999999    ctermfg=246    gui=NONE
hi diffOldFile    guifg=#90ff99    ctermfg=120    gui=NONE
hi diffNewFile    guifg=#ff9999    ctermfg=210    gui=NONE

hi Keyword    guifg=#88ffff    ctermfg=123

"" Languages
hi htmlTag    ctermfg=195    cterm=NONE    guifg=#beffff    gui=NONE
hi htmlEndTag    ctermfg=158    cterm=NONE    guifg=#c9ffc9    gui=NONE
hi htmlTagName    ctermfg=219    cterm=NONE    guifg=#ffafff    gui=NONE
hi htmlArg    ctermfg=123    cterm=NONE    guifg=#ff9999    gui=NONE
hi htmlSpecialChar    ctermfg=147    cterm=NONE    guifg=#ae81ff    gui=NONE
hi htmlBold    cterm=bold    gui=bold
hi htmlItalic    cterm=italic    gui=italic
hi htmlUnderline    cterm=underline    gui=underline
hi htmlBoldItalic    cterm=bold,italic    gui=bold,italic
hi htmlBoldUnderline    cterm=bold,underline    gui=bold,underline
hi htmlUnderlineItalic    cterm=italic,underline    gui=italic,underline
hi htmlBoldUnderlineItalic    cterm=bold,italic,underline    gui=bold,italic,underline

hi javaScriptFunction    ctermfg=222    cterm=NONE    guifg=#ffdb6e    gui=italic
hi javaScriptRailsFunction    ctermfg=222    cterm=NONE    guifg=#ffdb6e    gui=NONE
hi javaScriptBraces    ctermfg=NONE    cterm=NONE    guifg=NONE    gui=NONE

hi yamlKey    ctermfg=123    cterm=NONE    guifg=#88ffff    gui=NONE
hi yamlAnchor    ctermfg=NONE    cterm=NONE    guifg=NONE    gui=NONE
hi yamlAlias    ctermfg=NONE    cterm=NONE    guifg=NONE    gui=NONE
hi yamlDocumentHeader    ctermfg=186    cterm=NONE    guifg=#e6db74    gui=NONE

hi cssURL    ctermfg=71    cterm=NONE    guifg=#70b870    gui=italic
hi cssFunctionName    ctermfg=222    cterm=NONE    guifg=#ffdb6e    gui=NONE
hi cssColor    ctermfg=211    cterm=NONE    guifg=#ff87a5    gui=NONE
hi cssPseudoClassId    ctermfg=117    cterm=NONE    guifg=#a1e0ff    gui=NONE
hi cssClassName    ctermfg=117    cterm=NONE    guifg=#a1e0ff    gui=NONE
hi cssValueLength    ctermfg=211    cterm=NONE    guifg=#ff87a5    gui=NONE
hi cssCommonAttr    ctermfg=211    cterm=NONE    guifg=#ff87a5    gui=NONE
hi cssBraces    ctermfg=NONE    cterm=NONE    guifg=NONE    gui=NONE
