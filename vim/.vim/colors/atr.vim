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
hi Normal	guifg=#eeeeee	ctermfg=255	guibg=#121212	ctermbg=232 gui=none
hi Cursor	guifg=none	guibg=#bbddee	ctermbg=153	gui=none
hi MatchParen	guibg=#5566aa	ctermbg=61

" UI colors
hi ErrorMsg	guifg=#000000	ctermfg=0	guibg=#ffcc88	ctermbg=222	gui=bold
hi Folded	guifg=#8888ff	ctermfg=105	guibg=#121212	ctermbg=232	gui=bold
hi FoldColumn	guifg=#8888ff	ctermfg=105	guibg=#121212	ctermbg=232	gui=bold
hi NonText	guifg=#888888	ctermfg=102	guibg=#121212	ctermbg=232	gui=none
hi Search	guifg=#6600aa	ctermfg=55	guibg=#ddbbee	ctermbg=183	gui=underline
hi IncSearch ctermfg=235 ctermbg=186 cterm=none guifg=#272822 guibg=#e6db74 gui=none
hi SpellBad	guisp=#bb5555
hi SpellCap	guisp=#5555bb
hi SpellRare	guisp=#bb55bb
hi SpellLocal	ctermfg=232 guifg=#121212 guisp=#55bbbb
hi LineNr	guifg=#bbbb88	ctermfg=144
hi CursorLineNr	guifg=#eeff88	ctermfg=228	gui=bold
hi CursorLine	guibg=#444444	ctermbg=238
hi CursorColumn	guibg=#444444	ctermbg=238
hi Visual	guibg=#444444	ctermbg=238
hi Pmenu	guifg=#221133	ctermfg=235	guibg=#ddbbee	ctermbg=183
hi PmenuSbar ctermbg=238
hi PmenuSel	guifg=#ddbbee	ctermfg=183	guibg=#221133	ctermbg=235
hi SignColumn	guifg=#88ffff	guibg=#333
hi StatusLine ctermfg=231 ctermbg=241 cterm=bold guifg=#f8f8f2 guibg=#64645e gui=bold
hi StatusLineNC ctermfg=231 ctermbg=241 cterm=none guifg=#f8f8f2 guibg=#64645e gui=none
hi Directory ctermfg=141 ctermbg=none cterm=none guifg=#ae81ff guibg=none gui=none
hi Folded ctermfg=242 ctermbg=235 cterm=none guifg=#75715e guibg=#272822 gui=none
hi Title ctermfg=255 cterm=bold guifg=#eeeeee gui=bold

" Syntax highlighting
hi Comment	guifg=#808080	ctermfg=244	gui=italic

"" Constants
hi Constant	guifg=#ff87a5	ctermfg=211	gui=none
hi String	guifg=#70b870	ctermfg=71	gui=italic
hi Boolean	guifg=#ff9696	ctermfg=217	gui=bold

hi Identifier	guifg=#ae81ff	ctermfg=147	gui=none
hi Function	guifg=#ffdb6e	ctermfg=222	gui=bold
hi Float ctermfg=211 ctermbg=none cterm=none guifg=#ff87a5 guibg=none gui=none
hi Label ctermfg=186 ctermbg=none cterm=none guifg=#e6db74 guibg=none gui=none
hi Operator ctermfg=122 ctermbg=none cterm=none guifg=#6effcf guibg=none gui=none

hi Statement	guifg=#88ccff	ctermfg=117	gui=none
hi PreProc	guifg=#cc88ff	ctermfg=177	gui=none
hi Type	guifg=#eeff88	ctermfg=228	gui=none
hi Special	guifg=#dadada	ctermfg=253	gui=none
hi SpecialKey ctermfg=71 ctermbg=237 cterm=none guifg=#70b870 gui=none

hi Todo	guifg=#444444	ctermfg=238	guibg=#999999	ctermbg=246	gui=bold
hi Error	guifg=#000000	ctermfg=0	guibg=#ffcc88	ctermbg=222	gui=bold

hi Define ctermfg=167 ctermbg=none cterm=none guifg=#dc7373 guibg=none gui=none

hi Underlined	guifg=#88aaff	ctermfg=111	gui=underline

hi DiffAdd	guifg=#90ff99	ctermfg=120	guibg=#121212 ctermbg=232 gui=none
hi DiffDelete	guifg=#d70000	ctermfg=160	guibg=#121212 ctermbg=232 gui=none
hi DiffChange	guibg=#334455	ctermbg=238	gui=none
hi DiffText	guibg=#334455	ctermbg=238	gui=none

hi diffAdded	guifg=#55ff55	ctermfg=83	gui=none
hi diffRemoved	guifg=#ff5555	ctermfg=203	gui=none
hi diffFileId	guifg=#6600aa	ctermfg=55	guibg=#ddbbee	ctermbg=183	gui=none
hi diffFile	guifg=#999999	ctermfg=246	gui=none
hi diffOldFile	guifg=#90ff99	ctermfg=120	gui=none
hi diffNewFile	guifg=#ff9999	ctermfg=210	gui=none

hi Keyword	guifg=#88ffff	ctermfg=123

"" Languages
hi htmlTag ctermfg=195 cterm=none guifg=#beffff gui=none
hi htmlEndTag ctermfg=158 cterm=none guifg=#c9ffc9 gui=none
hi htmlTagName ctermfg=219 cterm=none guifg=#ffafff gui=none
hi htmlArg ctermfg=123 cterm=none guifg=#ff9999 gui=none
hi htmlSpecialChar ctermfg=147 cterm=none guifg=#ae81ff gui=none
hi htmlBold cterm=bold gui=bold
hi htmlItalic cterm=italic gui=italic
hi htmlUnderline cterm=underline gui=underline
hi htmlBoldItalic cterm=bold,italic gui=bold,italic
hi htmlBoldUnderline cterm=bold,underline gui=bold,underline
hi htmlUnderlineItalic cterm=italic,underline gui=italic,underline
hi htmlBoldUnderlineItalic cterm=bold,italic,underline gui=bold,italic,underline

hi javaScriptFunction ctermfg=222 cterm=none guifg=#ffdb6e gui=italic
hi javaScriptRailsFunction ctermfg=222 cterm=none guifg=#ffdb6e gui=none
hi javaScriptBraces ctermfg=none cterm=none guifg=none gui=none

hi yamlKey ctermfg=123 cterm=none guifg=#88ffff gui=none
hi yamlAnchor ctermfg=none cterm=none guifg=none gui=none
hi yamlAlias ctermfg=none cterm=none guifg=none gui=none
hi yamlDocumentHeader ctermfg=186 cterm=none guifg=#e6db74 gui=none

hi cssURL ctermfg=71 cterm=none guifg=#70b870 gui=italic
hi cssFunctionName ctermfg=222 cterm=none guifg=#ffdb6e gui=none
hi cssColor ctermfg=211 cterm=none guifg=#ff87a5 gui=none
hi cssPseudoClassId ctermfg=117 cterm=none guifg=#a1e0ff gui=none
hi cssClassName ctermfg=117 cterm=none guifg=#a1e0ff gui=none
hi cssValueLength ctermfg=211 cterm=none guifg=#ff87a5 gui=none
hi cssCommonAttr ctermfg=211 cterm=none guifg=#ff87a5 gui=none
hi cssBraces ctermfg=none cterm=none guifg=none gui=none
