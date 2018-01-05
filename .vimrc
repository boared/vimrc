"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                         "TEXT OPTIONS"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting
syntax on

" Editor viewing options
let base16colorspace=256
set number " Show line numbers
set ruler  " Show current line number, column, file percentage read at the right bottom corner.
"set cursorline " Will make redraw slow

" Indentation options
set autoindent
filetype plugin indent on
set softtabstop=4 " Show existing tab with 4 spaces width
set shiftwidth=4 " When indenting with '>', use 4 spaces width
set expandtab " Insert spaces instead of tabs, if what you want is tab, type <c-v> then press <tab>

" Allow backspace to work properly in Insert mode (see :help 'backspace')
set backspace=indent,eol,start


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                          "THEME"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
color less


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                       "KEY MAPPING"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set a prefix key for commands. Then, when you want to create new map you can easily add your pre-defined prefix by
" prefixing <leader> in command's {lhs}. For example, :map <leader>c dd will delete a line when you type ,c
let mapleader=","

" Duplicate line/selection
nnoremap <c-d> yyp
inoremap <c-d> <esc>yypi
vnoremap <c-d> ykp

" Swap current and next lines
nnoremap <c-b> ddp
inoremap <c-b> <esc>ddpi

" Convert entire word to upper case
nnoremap <c-u> viwU
inoremap <c-u> <esc>viwUi

" Convert entire word to lower case
nnoremap <c-y> viwu
inoremap <c-y> <esc>viwui

" Open you .vimrc to edit
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source your .vimrc file so changes take effect immediately
nnoremap <leader>sv :so $MYVIMRC<cr>

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

" List all existing buffers
nnoremap <leader>ls :ls<cr>

" Go to next buffer
nnoremap <leader>bn :bn<cr>
" Go to previous  buffer
nnoremap <leader>bp :bp<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                       "EXPERIMENTS"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Configure netrw directory browser
let g:netrw_banner = 0
let g:netrw_liststyle = 1 
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25


" Open netrw directory explorer when Vim starts up
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" This function replaces :Lexplore toggle which is bugged. :Lexplore might show multiple trees
" when you change dir and trigger toggle again.
" source: https://www.reddit.com/r/vim/comments/6jcyfj/toggle_lexplore_properly/djdmsal/
let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

" File browser toggle
nnoremap <leader>ex :call ToggleNetrw()<cr>

