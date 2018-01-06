" vim color file
" Maintainer:  Eder Perez <eder.a.perez@gmail.com>
"
" Based upon Brian Nelson's color scheme Less.

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "less"

hi Comment             term=bold cterm=bold ctermfg=darkgrey ctermbg=0 gui=italic guifg=#777777
hi! link Constant      Normal
hi! link Defined       Normal
hi! link Directory     Normal
hi! link Error         Normal
hi! link Function      Normal
hi! link Identifier    Normal
hi! link Include       Normal
hi LineNr              term=bold cterm=bold ctermfg=darkgrey guifg=DarkGrey
hi ModeMsg             term=bold cterm=bold ctermfg=white ctermbg=blue gui=bold guifg=White guibg=Blue
hi MoreMsg             term=bold cterm=bold ctermfg=darkgreen gui=bold guifg=DarkGreen
hi Normal              term=none cterm=none ctermfg=7 ctermbg=0 gui=none guifg=LightGray guibg=Black
hi! link PreProc       Normal
hi Question            term=standout cterm=bold ctermfg=green gui=bold guifg=Green
hi Search              term=reverse ctermfg=white  ctermbg=blue guifg=white guibg=Blue
hi! link Special       String 
hi! link Statement     Normal
hi! link StorageClass  Normal
hi String              term=none cterm=none ctermfg=3 ctermbg=0 gui=none guifg=#cccc00 guibg=Black
hi Todo                term=standout cterm=none ctermfg=0 ctermbg=7 guifg=Black guibg=White
hi! link Type          Normal

hi! link Boolean         Constant 
hi! link Character       String
hi! link Conditional     Statement
hi! link Debug           Special
hi! link Delimiter       Special
hi! link Exception       Statement
hi! link Float           Number
hi! link Keyword         Normal
hi! link Label           Statement
hi! link Macro           Include
hi! link Number          Constant
hi! link Operator        Statement
hi! link PreCondit       PreProc
hi! link Repeat          Statement
hi! link SpecialChar     Special
hi! link SpecialComment  Special
hi! link Structure       Type
hi! link Tag             Special
hi! link Typedef         Type

" Color scheme for Netrw directory browser
"hi netrwCompress term=NONE cterm=NONE gui=NONE ctermfg=10 guifg=green  ctermbg=0 guibg=black
"hi netrwData	  term=NONE cterm=NONE gui=NONE ctermfg=9 guifg=blue ctermbg=0 guibg=black
"hi netrwHdr	  term=NONE cterm=NONE,italic gui=NONE guifg=SeaGreen1
"hi netrwLex	  term=NONE cterm=NONE,italic gui=NONE guifg=SeaGreen1
"hi netrwYacc	  term=NONE cterm=NONE,italic gui=NONE guifg=SeaGreen1
"hi netrwLib	  term=NONE cterm=NONE gui=NONE ctermfg=14 guifg=yellow
"hi netrwObj	  term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
"hi netrwTilde	  term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
"hi netrwTmp	  term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
"hi netrwTags	  term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
"hi netrwDoc	  term=NONE cterm=NONE gui=NONE ctermfg=220 ctermbg=27 guifg=yellow2 guibg=Blue3
hi netrwSymLink  term=none cterm=bold ctermfg=green gui=bold guifg=Green
