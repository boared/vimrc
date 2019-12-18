" This config file is divided in the following sessions:
" 1. Plugins
" 2. Configurations
" 3. Color Scheme
" 4. Key Mapping
" 5. Functions
" 6. Mini Tutorials
" 7. Experiments (things that I'm still testing or playing around)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                       "PLUGINS"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'

" Provides Rust file detection, syntax highlighting, formatting, Syntastic integration, and more. (:help rust)
Plug 'rust-lang/rust.vim'

" Fuzzy finder plugin (:help fzf-vim)
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Coc is an intellisense engine for vim8 & neovim (:help coc-nvim)
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Lean & mean status/tabline for vim that's light as air (:help airline)
Plug 'vim-airline/vim-airline'

" Themes for vim-airline (:help airline)
Plug 'vim-airline/vim-airline-themes'

" A git wrapper so awesome, it should be illegal (:help fugitive)
Plug 'tpope/vim-fugitive'

" Syntax checking hacks for vim (:help syntastic)
"Plug 'vim-syntastic/syntastic'

" Vim plugin that displays tags in a window, ordered by scope (:help tagbar)
"Plug 'majutsushi/tagbar'

" An Interface to WEB APIs.
"Plug 'mattn/webapi-vim'

" Text outlining and task management for Vim based on Emacs' Org-Mode
"Plug 'jceb/vim-orgmode'

" Use CTRL-A/CTRL-X to increment dates, times, and more (orgmode related)
"Plug 'tpope/vim-speeddating'

" Define a different filetype syntax on regions of a buffer (orgmode related)
"Plug 'inkarkat/vim-SyntaxRange'

" Calendar vimscript (orgmode related)
"Plug 'mattn/calendar-vim'

" Univeral Text Linking - Execute URLs, footnotes, open emails, organize ideas (orgmode related)
"Plug 'vim-scripts/utl.vim'

" repeat.vim: enable repeating supported plugin maps with "." (orgmode related)
"Plug 'tpope/vim-repeat'

call plug#end()

" rust.vim settings
let g:rustfmt_autosave = 1

" syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" vim-airline settings
let g:airline_theme='dark'

" coc-nvim settings
" Highlight // comments in json files (useful for coc configuration file)
autocmd FileType json syntax match Comment +\/\/.\+$+

" Navigate completion list with <Tab> and <S-Tab>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                           "CONFIGURATIONS"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" These settings here are default in neovim
if !has('nvim')
    " Syntax highlighting
    syntax on

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
set colorcolumn=120 " Draw a vertical line at specified column (will make screen redrawing slower)

" Indentation options
set softtabstop=4
set shiftwidth=4
set expandtab

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

" Use <cWORD> to expand paths when using gx mapping. It'll make it expand full
" URLs including its parameters (e.g. www.example.com/foo?bar=0). Be aware
" that there is side-effects.
let g:netrw_gx="<cWORD>"

" A buffer becomes hidden when it is abandoned (that means you can change to another buffer without having to save the
" current one. You'll still be asked to save before leaving with :q 
set hidden


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                    "COLOR SCHEME"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme kuroi

function! OverridenHighlights() abort
    " Color scheme for Netrw directory browser
    "highlight netrwCompress term=NONE cterm=NONE gui=NONE ctermfg=10 guifg=green  ctermbg=0 guibg=black
    "highlight netrwData     term=NONE cterm=NONE gui=NONE ctermfg=9 guifg=blue ctermbg=0 guibg=black
    "highlight netrwHdr      term=NONE cterm=NONE,italic gui=NONE guifg=SeaGreen1
    "highlight netrwLex      term=NONE cterm=NONE,italic gui=NONE guifg=SeaGreen1
    "highlight netrwYacc     term=NONE cterm=NONE,italic gui=NONE guifg=SeaGreen1
    "highlight netrwLib      term=NONE cterm=NONE gui=NONE ctermfg=14 guifg=yellow
    "highlight netrwObj      term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
    "highlight netrwTilde    term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
    "highlight netrwTmp      term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
    "highlight netrwTags     term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
    "highlight netrwDoc      term=NONE cterm=NONE gui=NONE ctermfg=220 ctermbg=27 guifg=yellow2 guibg=Blue3
    highlight netrwSymLink  term=none cterm=bold ctermfg=green gui=bold guifg=Green
endfunction

augroup OverridenColors
    autocmd!
    autocmd ColorScheme * call OverridenHighlights()
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                    "KEY MAPPING"

" Before adding a keymap, check if a key is being currently set, for example:
" :verbose imap <tab>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prefix key for commands.
let mapleader=","
let maplocalleader = "\\"

" Duplicate line/selection
"nnoremap <c-d> yyp
"inoremap <c-d> <esc>yypi
"vnoremap <c-d> ykp

" Swap current and next lines
"nnoremap <c-b> ddp
"inoremap <c-b> <esc>ddpi

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

" Delete from the cursor to the beginning of line
nnoremap <leader>db v0d

" Delete from the cursor to the end of line
nnoremap <leader>df v$hd

" Search and replace the word under the cursor
nnoremap <leader>r :%substitute/<c-r><c-a>//cg<left><left><left>

" Sort selection.
xnoremap <leader>s :'<,'>sort<cr>

" Clear search highlight without disabling highlight
nnoremap <esc> :noh<return><esc>

" Toggle directory browser
"nnoremap <leader>ex :call ToggleNetrw()<cr>
nnoremap <leader>ex :NERDTreeToggle<cr>

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
nnoremap <leader>sall ggVG

" [coc-nvim] Use <cr> to confirm complete
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" [coc-nvim] Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                        "FUNCTIONS"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This function replaces :Lexplore toggle which is bugged. :Lexplore might show multiple explorers
" when you change dir and trigger toggle again.
" source: https://www.reddit.com/r/vim/comments/6jcyfj/toggle_lexplore_properly/djdmsal/
let g:NetrwIsOpen=0
function! ToggleNetrw() abort
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout! " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                       "EXPERIMENTS"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy the content of yanked/deleted text to clipboard
nnoremap <leader>cy :let @*=@"<cr>:echo "Yanked text copied to clipboard"<cr>

nnoremap <F8> :TagbarToggle<cr>

" Break a line where the cursor is in normal mode (hit c-j, need to find another key cause c-j is move to bottom window)
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
" Remap keys for gotos
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
"nmap <silent> <leader>gm <Plug>(coc-rename)
nmap <F6> <Plug>(coc-refactor)

" Format code
vmap <leader>p <Plug>(coc-format-selected)
nmap <leader>p <Plug>(coc-format-selected)


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

