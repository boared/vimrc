" This file is divided in the following sessions:
" 1. Configurations
" 2. Color Scheme
" 3. Key Mapping
" 4. Functions
" 5. Experiments (things that I'm still testing or playing around)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                           "CONFIGURATIONS"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting
syntax on

" Editor viewing options
let base16colorspace=256
set number " Show line numbers
set laststatus=2 " Always show status line
set nowrap " Disable line wraping
"set cursorline " Will make redraw slow

" Indentation options
set autoindent
filetype plugin indent on
set softtabstop=4
set shiftwidth=4
set expandtab

" Allow backspace to work properly in Insert mode (see :help 'backspace')
set backspace=indent,eol,start

" Configure netrw directory browser
let g:netrw_sort_by = "exten"
let g:netrw_sizestyle = "h" " Show file size in human readable format
let g:netrw_banner = 0 " You can still show the banner by pressing I
let g:netrw_liststyle = 1 
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                    "COLOR SCHEME"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme less


function! OverridenHighlights() abort
    " Color scheme for Netrw directory browser
    "highlight netrwCompress term=NONE cterm=NONE gui=NONE ctermfg=10 guifg=green  ctermbg=0 guibg=black
    "highlight netrwData	  term=NONE cterm=NONE gui=NONE ctermfg=9 guifg=blue ctermbg=0 guibg=black
    "highlight netrwHdr	  term=NONE cterm=NONE,italic gui=NONE guifg=SeaGreen1
    "highlight netrwLex	  term=NONE cterm=NONE,italic gui=NONE guifg=SeaGreen1
    "highlight netrwYacc	  term=NONE cterm=NONE,italic gui=NONE guifg=SeaGreen1
    "highlight netrwLib	  term=NONE cterm=NONE gui=NONE ctermfg=14 guifg=yellow
    "highlight netrwObj	  term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
    "highlight netrwTilde	  term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
    "highlight netrwTmp	  term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
    "highlight netrwTags	  term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
    "highlight netrwDoc	  term=NONE cterm=NONE gui=NONE ctermfg=220 ctermbg=27 guifg=yellow2 guibg=Blue3
    highlight netrwSymLink  term=none cterm=bold ctermfg=green gui=bold guifg=Green
endfunction

augroup OverridenColors
    autocmd!
    autocmd ColorScheme * call OverridenHighlights()
augroup END



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                    "KEY MAPPING"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set a prefix key for commands.
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
nnoremap <leader>ev :e $MYVIMRC<cr>

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

" List all existing buffers
nnoremap <leader>ls :ls<cr>

" Go to next buffer
nnoremap <leader>bn :bn<cr>

" Go to previous  buffer
nnoremap <leader>bp :bp<cr>

" Go to alternate file
nnoremap <leader>af <c-^>

" Delete current buffer
nnoremap <leader>bd :bd<cr>

" Toggle directory browser
nnoremap <leader>ex :call ToggleNetrw()<cr>

" Delete from the cursor to the beginning of line
nnoremap <leader>db v0d

" Delete from the cursor to the end of line
nnoremap <leader>df v$hd

" Sort selection.
xnoremap <leader>s :'<,'>sort<cr>

" Toggle line number. Useful when selecting a block of text with the mouse and
" want to avoid copy line numbers.
nnoremap <leader>tn :set number!<cr>

" Toggle line wrap
nnoremap <leader>tw :set wrap!<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                        "FUNCTIONS"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This function replaces :Lexplore toggle which is bugged. :Lexplore might show multiple explorers
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

function! HumanReadableFileSize() abort
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return 0 
    endif
    if bytes < 1024
        return bytes
    elseif bytes < 1024*1024
        return float2nr(round((bytes / 1024.0))) . "K"
    elseif bytes < 1024*1024*1024
        return float2nr(round(bytes / (1024.0*1024.0))) . "M"
    else
        return float2nr(round(bytes / (1024.0*1024.0*1024.0))) . "G"
    endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                       "EXPERIMENTS"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Color scheme for statusline
highlight slNormal   term=none cterm=none ctermfg=black ctermbg=lightgrey gui=none guifg=Black guibg=LightGrey
highlight slModified cterm=bold ctermfg=lightgrey ctermbg=red gui=bold guifg=LightGrey guibg=Red
highlight slGitClean cterm=bold ctermfg=lightgrey ctermbg=green gui=bold guifg=LightGrey guibg=Green
highlight slGitDirty cterm=bold ctermfg=lightgrey ctermbg=red gui=bold guifg=LightGrey guibg=Red

" Custom status line
set statusline=
set statusline+=%#slNormal#
set statusline+=%(%{expand('%:t')}%) " File name
set statusline+=\  " Separator
set statusline+=%#slModified#
set statusline+=%m " [+] if file was modified
set statusline+=%#slNormal#
set statusline+=%r " [RO] if file is read-only
set statusline+=[buffer\ #%n] " Buffer number
set statusline+=%= " Start right alignment
""set statusline+=%{StatusLineGitHighlight(expand('%:h'))}
""set statusline+=%{GitStatus(expand('%:h'))==?'clean'? %#slNormal# : %#slNormal#}
"set statusline+=[%{GitBranch(expand('%:h'))}] 
"set statusline+=%#slNormal#
set statusline+=[%{HumanReadableFileSize()}] " Filesize
set statusline+=%-50(\ %l,%v\ %p%%%)
"set statusline+=[byte\ pos:\ 0x%O]
"set statusline+=[char\ vAalue:\ 0x%b]


"" Get current branch name if path contains a git repo
"function! GitBranch(path)
"    return system("echo `cd ".a:path." && git rev-parse --abbrev-ref HEAD 2>/dev/null` | tr -d '\n'")
"endfunction
"
"" Check the status of the current git repo
"function! GitStatus(path)
"    let l:status = system("echo `cd ".a:path." && git status --porcelain`")
"    if empty(l:status)
"        return "clean"
"    else
"        return "dirty"
"    endif
"endfunction
"
"function! StatusLineGitHighlight(path)
"    let l:branch = GitBranch(a:path)
"    if empty(l:branch)
"        return %#slNormal#
"    else
"        let l:status = GitStatus(a:path)
"        if l:status ==? "clean"
"            return %#slNormal#
"        elseif l:status ==? "dirty"
"            return %#slNormal#
"        else
"            return %#slNormal#
"        endif
"    endif
"endfunction

" Replace word with whatever is in register 0 (last yanked text)
" TODO: need to improve this (go to next occurrence after replacement for
" example)
"nnoremap <leader>r dw"0P
nnoremap <leader>r :%s/<c-r><c-a>/
