"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                           "CONFIGURATIONS"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" These settings here are default in neovim
if !has('nvim')
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
set tabstop=4 " Number of columns (whitespaces) that a <Tab> char in the file counts for
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


" Configure netrw directory browser (deprecated since I'm using NERDTree)
"let g:netrw_sort_by = "name"
"let g:netrw_sizestyle = "h" " Show file size in human readable format
"let g:netrw_banner = 0 " You can still show the banner by pressing I
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25

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


" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
    \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

