--==============================================================================--
                                  --COLOR SCHEME--
--==============================================================================--
vim.cmd([[
  "Credit joshdick
  "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
  "If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
  "(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
  if (empty($TMUX))
    if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
      set termguicolors
    endif
  endif

  set background=dark
  let g:one_allow_italics = 1
  colorscheme one

  " Customize vim-one color scheme background color
  "   one#highlight(group, fg, bg, attribute)
  call one#highlight('Normal', '', '22262E', 'none')
  call one#highlight('Conceal', '', '22262E', '')
  call one#highlight('ErrorMsg', '', '22262E', '')
  call one#highlight('Folded', '', '22262E', '')
  call one#highlight('PMenuSbar', '', '22262E', '')
  call one#highlight('Search', '22262E', '', '')
  call one#highlight('TabLineSel', '22262E', '', '')
  call one#highlight('SignColumn', '', '22262E', '')
  call one#highlight('Error', '', '22262E', '')
  call one#highlight('Todo', '', '22262E', '')
  call one#highlight('SpellBad', '', '22262E', '')
  call one#highlight('SpellLocal', '', '22262E', '')
  call one#highlight('SpellCap', '', '22262E', '')
  call one#highlight('SpellRare',    '', '22262E', '')

  " Customize nvim-cmp syntax highlighting
  " gray
  highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
  " blue
  highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
  highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
  " light blue
  highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindField guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
  " pink
  highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
  highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
  " orange
  highlight! CmpItemKindKeyword guibg=NONE guifg=#FC9303
  highlight! CmpItemKindProperty guibg=NONE guifg=#FC9303
  highlight! CmpItemKindUnit guibg=NONE guifg=#FC9303
]])
