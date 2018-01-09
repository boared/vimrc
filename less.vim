" vim color file
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

