" This config file is divided in the following sessions:
" 2. Configurations
" 3. Color Scheme
" 4. Key Mapping
" 5. Functions
" 6. Experiments (things that I'm still testing or playing around)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                           "CONFIGURATIONS"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" These settings here are default in neovim
if !has('nvim')
    " Syntax highlighting
    "syntax on

    " Indentation options
    set autoindent
    filetype plugin indent on

    " Allow backspace to work properly in Insert mode (see :help 'backspace')
    set backspace=indent,eol,start

    " Set swap files folder
    set directory=~/.vim/tmp//,.
endif

" Editor viewing options
let base16colorspace=256
set number " Show line numbers
set laststatus=2 " Always show status line
set nowrap " Disable line wraping by default
set noshowmode " Let vim-airline handle this
set colorcolumn=150 " Draw a vertical line at specified column (will make screen redrawing slower)

" Indentation options
set tabstop=4 " Number of columns (whitespaces) that a <Tab> in the file counts for
set softtabstop=4 " Number of columns a tab keypress or a backspace keypress worth
set shiftwidth=4 " Number of columns a level of indentation worth
set expandtab " Means that inserting a <Tab> will replace it by a number of whitespaces as defined in tabstop

" Indentation options specifically for Go files
autocmd FileType go setlocal tabstop=2
autocmd FileType go setlocal softtabstop=2
autocmd FileType go setlocal shiftwidth=2
autocmd FileType go setlocal noexpandtab

" Remove automatic line breaker
set formatoptions-=tc

" Configure netrw directory browser
let g:netrw_sort_by = "name"
let g:netrw_sizestyle = "h" " Show file size in human readable format
let g:netrw_banner = 0 " You can still show the banner by pressing I
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Use <cWORD> to expand paths when using gx mapping. It'll make it expand full
" URLs including its parameters (e.g. www.example.com/foo?bar=0). Be aware
" that there is side-effects.
let g:netrw_gx="<cWORD>"

" Window split behaviour
set splitright
set splitbelow

" Visual block (<c-v>) expand beyond end of line
set virtualedit=block

" gvim options
set guioptions-=T " Remove toolbar
set guioptions-=m " Remove menu bar
set guioptions-=L " Remove left-hand scroll bar
set guioptions-=r " Remove right-hand scroll bar

" A buffer becomes hidden when it is abandoned (that means you can change to another buffer without having to save the
" current one. You'll still be asked to save before leaving with :q
set hidden



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                    "COLOR SCHEME"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                    "KEY MAPPING"

" Before adding a keymap, check if a key is being currently set, for example:
" :verbose imap <tab>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prefix key for commands.
let mapleader=","
let maplocalleader = "\\"

" Force quit all (without saving)
nnoremap <leader>zq :qa!<cr>

" Save and quit all
nnoremap <leader>zz :wqa<cr>

" Convert entire word to upper case
nnoremap <leader>up viwU
inoremap <leader>up <esc>viwUi

" Convert entire word to lower case
nnoremap <leader>lo viwu
inoremap <leader>lo <esc>viwui

" Open .vimrc to edit
nnoremap <leader>ev :tabedit ~/.vimrc<cr>

" Source your .vimrc file so changes take effect immediately
nnoremap <leader>sv :source $MYVIMRC<cr>

" Navigate through windows (h - left, j - down, k - up, l - right, q - quit window)
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <leader>q <c-w>q

" Split window horizontally
nnoremap <leader>hs :split<cr>

" Split window vertically
nnoremap <leader>vs :vsplit<cr>

" List all existing buffers using fzf
nnoremap <leader>ls :Buffers<cr>

" Go to next buffer
nnoremap <space> :bn<cr>

" Go to previous buffer
nnoremap <c-space> :bp<cr>

" Go to alternate file
nnoremap <leader>af <c-^>

" Yank to clipboard instead of "0
vnoremap <leader>cc "*y:echo "Text copied to \"* register"<cr>
nnoremap <leader>cc "*yy:echo "Text copied to \"* register"<cr>

" Copy the content of yanked/deleted text to clipboard
nnoremap <leader>cy :let @*=@"<cr>:echo "Yanked text copied to clipboard"<cr>

" Search and replace the word under the cursor
nnoremap <leader>r :%substitute/<c-r><c-a>//cg<left><left><left>

" Sort selection.
xnoremap <leader>s :'<,'>sort<cr>

" Clear search highlight without disabling highlight
nnoremap <esc> :noh<return><esc>

" Toggle directory browser
nnoremap <leader>nt :NERDTreeToggle<cr>

" Show directory browser
nnoremap <leader>ex :NERDTreeMirror<cr>:NERDTreeFocus<cr>

" Toggle line number. Useful when selecting a block of text with the mouse and
" want to avoid copy line numbers.
nnoremap <leader>tn :set number! number?<cr>

" Toggle line wrap
nnoremap <leader>tw :set wrap! wrap?<cr>

" Move between tabs (not working in vim terminal, probably because my iTerm2
" capture <c-tab> to change its own tabs)
nnoremap <c-tab> gt
nnoremap <s-c-tab> gT

" Select all text
nnoremap <leader>sa ggVG

" [coc-nvim] Use <cr> to confirm complete
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" [coc-nvim] Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                        "FUNCTIONS"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <Add user defined functions here>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                       "EXPERIMENTS"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F8> :TagbarToggle<cr>

" Break a line where the cursor is in normal mode
nnoremap <leader>bl i<CR><ESC>

" Search in all files that match extension of current file from the current dir, recursively for the word under cursor
nnoremap <leader>S :execute 'lvimgrep /\<<c-r><c-w>\>/j ./**/*.' . expand('%:e')<cr>:lwindow<cr>

" Windows resizing
nnoremap <leader>a <c-w>10<
nnoremap <leader>d <c-w>10>
nnoremap <leader>s <c-w>10-
nnoremap <leader>w <c-w>10+

" clang-format tool
"nnoremap <leader>f :pyf /usr/local/opt/llvm/share/clang/clang-format.py<cr>
"vnoremap <leader>f :pyf /usr/local/opt/llvm/share/clang/clang-format.py<cr>
"inoremap <leader>f <esc>:pyf /usr/local/opt/llvm/share/clang/clang-format.py<cr><i>

" Remove trailing whitespace in the whole file
nnoremap <leader>dw :%s/\s\+$//e<CR>

" ### Tabs ###
" Open a new tab and execute the given command
":tab <cmd>
"
"" Open a new tab
":tab split
"
"" Close the current tab page
":tabc
"
"" Close all other tabs
":tabo
"
"" Lists the tabs opened and the windows they contain
":tabs
"
"" Move between tabs
":tabn " Next tab (or gt in Normal mode)
":tabp " Previous tab (or gT in Normal mode)
":tabfirst " First tab
":tablast " Last tab
":{N}tabn " N-th tab (or {N}gt in Normal mode)
"
"" Move current window to new tab
"<c-w> T
"
"" Move current tab to first position
":tabm 0
"
"" Move current tab to last position
":tabm
"
"" Move current tab to position i+1
":tabm {i}


" Auto-close brackets, etc.
"inoremap " ""<left>
"inoremap "" ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O

"""""""""""""""""""""""""""""""""""""
              "COC-VIM"
"""""""""""""""""""""""""""""""""""""
" Map <tab> for trigger completion, snippet expand and jump like VSCode
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction


" GoTo code navigation
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>ge <Plug>(coc-diagnostic-next-error)			*n_coc-diagnostic-next-error*
"nmap <silent> <leader>gm <Plug>(coc-rename)

nmap <F6> <Plug>(coc-refactor)

" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>

" Format code
"vmap <leader>p <Plug>(coc-format-selected)
"nmap <leader>p <Plug>(coc-format-selected)
"xmap <leader>f  <Plug>(coc-format-selected)

" Mappings using CoCList:
" Show all diagnostics.
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap if <Plug>(coc-funcobj-i)
"omap af <Plug>(coc-funcobj-a)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
"nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
"if exists('*complete_info')
"  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
"  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif

" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder.
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Some servers have issues with backup files, see #649.
"set nobackup
"set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


command! -nargs=0 Prettier :CocCommand prettier.formatFile








" Highlight duplicate lines.
" To execute this command, in normal mode do `:call HighlightRepeats()`
" source: https://stackoverflow.com/questions/1268032/how-can-i-mark-highlight-duplicate-lines-in-vi-editor/28690847
function! HighlightRepeats() range
  let lineCounts = {}
  let lineNum = a:firstline
  while lineNum <= a:lastline
    let lineText = getline(lineNum)
    if lineText != ""
      let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
    endif
    let lineNum = lineNum + 1
  endwhile
  exe 'syn clear Repeat'
  for lineText in keys(lineCounts)
    if lineCounts[lineText] >= 2
      exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
    endif
  endfor
endfunction

"command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()

" Read the file again if it was modified outside Vim. If there's unsaved changes in the buffer the file will not be updated.
"set autoread

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
    \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Apply syntax highlight to jinja templates
"autocmd BufNewFile,BufRead *.yml.jinja set syntax=yaml


" vim-go settings
" Enagle gopls in vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" GoDef in split/vsplit/tab windows
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
