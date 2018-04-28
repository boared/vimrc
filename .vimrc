" This config file is divided in the following sessions:
" 1. Plugins
" 2. Configurations
" 3. Color Scheme
" 4. Key Mapping
" 5. Functions
" 6. Experiments (things that I'm still testing or playing around)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                       "PLUGINS"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" Text outlining and task management for Vim based on Emacs' Org-Mode
Plug 'jceb/vim-orgmode'

" Use CTRL-A/CTRL-X to increment dates, times, and more (orgmode related)
Plug 'tpope/vim-speeddating'

" Define a different filetype syntax on regions of a buffer (orgmode related)
Plug 'inkarkat/vim-SyntaxRange'

" Calendar vimscript (orgmode related)
Plug 'mattn/calendar-vim'

" Univeral Text Linking - Execute URLs, footnotes, open emails, organize ideas (orgmode related)
Plug 'vim-scripts/utl.vim'

" repeat.vim: enable repeating supported plugin maps with "." (orgmode related)
Plug 'tpope/vim-repeat'

" Vim plugin that displays tags in a window, ordered by scope (orgmode related)
Plug 'majutsushi/tagbar'

" Lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" Themes for vim-airline (:help airline)
Plug 'vim-airline/vim-airline-themes'

" A git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

call plug#end()

" vim-airline settings
let g:airline_theme='dark'

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

" Indentation options
set softtabstop=4
set shiftwidth=4
set expandtab

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

" Use <cWORD> to expand paths when using gx mapping. It'll make it expand full
" URLs including its parameters (e.g. www.example.com/foo?bar=0). Be aware
" that there is side-effects.
let g:netrw_gx="<cWORD>"



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                    "COLOR SCHEME"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme less

" Color scheme for statusline
"highlight slNormal   term=none cterm=none ctermfg=black ctermbg=lightgrey gui=none guifg=Black guibg=LightGrey
"highlight slModified cterm=bold ctermfg=lightgrey ctermbg=red gui=bold guifg=LightGrey guibg=Red

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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prefix key for commands.
let mapleader=","
let maplocalleader = "\\"

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
nnoremap <leader>ev :e ~/.vimrc<cr>

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
nnoremap <space> :bn<cr>

" Go to previous buffer
nnoremap <s-space> :bp<cr>

" Delete current buffer
nnoremap <leader>bd :bd<cr>

" Go to alternate file
nnoremap <leader>af <c-^>

" Yank to clipboard instead of "0
vnoremap <leader>cc "*y:echo "Text copied to \"* register"<cr>
nnoremap <leader>cc "*yy:echo "Text copied to \"* register"<cr>

" Delete from the cursor to the beginning of line
nnoremap <leader>db v0d

" Delete from the cursor to the end of line
nnoremap <leader>df v$hd

" Search and replace the word under the cursor
nnoremap <leader>r :%substitute/<c-r><c-a>//cg<left><left><left>

" Sort selection.
xnoremap <leader>s :'<,'>sort<cr>

" Toggle directory browser
nnoremap <leader>ex :call ToggleNetrw()<cr>

" Toggle line number. Useful when selecting a block of text with the mouse and
" want to avoid copy line numbers.
nnoremap <leader>tn :set number! number?<cr>

" Toggle line wrap
nnoremap <leader>tw :set wrap! wrap?<cr>

" Toggle search highlight
nnoremap <leader>shi :set hlsearch! hlsearch?<cr>

" Move between tabs (not working in vim terminal, probably because my iTerm2
" capture <c-tab> to change its own tabs)
nnoremap <c-tab> gt
nnoremap <s-c-tab> gT


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                        "FUNCTIONS"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This function replaces :Lexplore toggle which is bugged. :Lexplore might show multiple explorers
" when you change dir and trigger toggle again.
" source: https://www.reddit.com/r/vim/comments/6jcyfj/toggle_lexplore_properly/djdmsal/
let g:NetrwIsOpen=0

" Select all text
nnoremap <leader>sall ggVG

function! ToggleNetrw() abort
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

"function! HumanReadableFileSize() abort
"    let bytes = getfsize(expand("%:p"))
"    if bytes <= 0
"        return 0 
"    endif
"    if bytes < 1024
"        return bytes
"    elseif bytes < 1024*1024
"        return float2nr(round((bytes / 1024.0))) . "K"
"    elseif bytes < 1024*1024*1024
"        return float2nr(round(bytes / (1024.0*1024.0))) . "M"
"    else
"        return float2nr(round(bytes / (1024.0*1024.0*1024.0))) . "G"
"    endif
"endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                       "EXPERIMENTS"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Search in all files that match extension of current file from the current dir, recursively for the word under cursor
nnoremap <leader>S :execute 'lvimgrep /\<<c-r><c-w>\>/j ./**/*.' . expand('%:e')<cr>:lwindow<cr>

" Windows resizing
nnoremap <leader>a <c-w>10<
nnoremap <leader>d <c-w>10>
nnoremap <leader>s <c-w>10-
nnoremap <leader>w <c-w>10+

" Draw a vertical line at specified column (will make screen redrawing slower)
set colorcolumn=120

" Set column size after that vim will auto-break lines for you.
set textwidth=120

" TODO:
" . auto-close brackets
" . search the occurrence of a text in "all files" (all files == all buffers? all files == all files inside a root dir?)
" . have the concept of a project (like intellij project, netbeans project, whatever)
" . open remote files using netrw
" . better way to walk around buffers
" . scrolling
" . folding functions

" SMALL TUTS
" <c-r><register_name> in insert or command mode paste the content of given register
" :3,15move 40 " Move the content of lines 3 through 15 to bellow line 40
" :3,15copy 40 " Copy the content of lines 3 through 15 to bellow line 40
" :let @/='Text'  " Write to register /
" search for word under cursor: in normal mode press * to search forward and # to search backward. g* and g# for non-exact word
" copy word under cursor to command line: in normal mode with the cursor over any word, type / or : then <c-r><c-w>
" gd " Go to local declaration of variable under cursor
" gD " Go to global declaration of variable under cursor
" to save your current session (open tabs, buffer, etc.) type :mksession session_name.vim (session_name.vim will be saved in the current folder)
" use source <path>/session_name.vim to restore your session
" m<char> mark current cursor position with letter <char>. '<char> go back to marked line beginning, `<char> go back to marked cursor position
" <c-n> autocomplete
" :grep /<pattern>/gj ./**/*.py search recursively in the current dir in all python files for occurrence of <pattern>
" K in normal mode with the cursor over a word run a program to lookup the word under the cursor.
" ci" means change (c) inside quotes (i"), it will delete everything inside quotes and put in edit mode
" show mapped keys by typing :map or :help index
" terminal mode: to exit terminal mode and get back to normal mode, type <c-\><c-n>
" netrw: open remote folder from inside vim - Lexplore scp://<host>//home/user/
" netrw: open remote file from inside vim - edit scp://<host>//home/user/test.txt
" macros: q<letter> start macro recording. Press q to stop recording. To execute the macro n times, type <number>@<letter>
" increment a number <c-a>
" decrement a number <c-x>
" delete a line and put the cursor in the beginning in edit mode: cc
" delete all at right side of the cursor and change to edit mode: C
" replace a word: cw or ciw

"
"	  ---			-----------------			----
"	  Map			Quick Explanation			Link
"	  ---			-----------------			----
"	   %	New file                                             |netrw-%
"	   -	Go up one directory                                  |netrw--|
"	   d	Make a directory                                     |netrw-d|
"	 <c-l>	Refresh the directory listing                        |netrw-ctrl-l|
"	   R	Rename the designated file(s)/directory(ies)         |netrw-R|
"	 <del>	Remove the file/directory                            |netrw-del|
"
"	 <F1>	Causes Netrw to issue help
"	 <cr>	Netrw will enter the directory or read the file      |netrw-cr|
"	 <c-h>	Edit file hiding list                                |netrw-ctrl-h|
"	 <c-r>	Browse using a gvim server                           |netrw-ctrl-r|
"	 <c-tab> Shrink/expand a netrw/explore window                |netrw-c-tab|
"	   a	Cycles between normal display,                       |netrw-a|
"	    	hiding (suppress display of files matching g:netrw_list_hide)
"	    	and showing (display only files which match g:netrw_list_hide)
"	   c	Make browsing directory the current directory        |netrw-c|
"	   C	Setting the editing window                           |netrw-C|
"	   D	Attempt to remove the file(s)/directory(ies)         |netrw-D|
"	   gb	Go to previous bookmarked directory                  |netrw-gb|
"	   gd	Force treatment as directory                         |netrw-gd|
"	   gf	Force treatment as file                              |netrw-gf|
"	   gh	Quick hide/unhide of dot-files                       |netrw-gh|
"	   gn	Make top of tree the directory below the cursor      |netrw-gn|
"	   i	Cycle between thin, long, wide, and tree listings    |netrw-i|
"	   I	Toggle the displaying of the banner                  |netrw-I|
"	   mb	Bookmark current directory                           |netrw-mb|
"	   mc	Copy marked files to marked-file target directory    |netrw-mc|
"	   md	Apply diff to marked files (up to 3)                 |netrw-md|
"	   me	Place marked files on arg list and edit them         |netrw-me|
"	   mf	Mark a file                                          |netrw-mf|
"	   mF	Unmark files                                         |netrw-mF|
"	   mg	Apply vimgrep to marked files                        |netrw-mg|
"	   mh	Toggle marked file suffices' presence on hiding list |netrw-mh|
"	   mm	Move marked files to marked-file target directory    |netrw-mm|
"	   mp	Print marked files                                   |netrw-mp|
"	   mr	Mark files using a shell-style |regexp|                |netrw-mr|
"	   mt	Current browsing directory becomes markfile target   |netrw-mt|
"	   mT	Apply ctags to marked files                          |netrw-mT|
"	   mu	Unmark all marked files                              |netrw-mu|
"	   mv	Apply arbitrary vim   command to marked files        |netrw-mv|
"	   mx	Apply arbitrary shell command to marked files        |netrw-mx|
"	   mX	Apply arbitrary shell command to marked files en bloc|netrw-mX|
"	   mz	Compress/decompress marked files                     |netrw-mz|
"	   o	Enter the file/directory under the cursor in a new   |netrw-o|
"	    	browser window.  A horizontal split is used.
"	   O	Obtain a file specified by cursor                    |netrw-O|
"	   p	Preview the file                                     |netrw-p|
"	   P	Browse in the previously used window                 |netrw-P|
"	   qb	List bookmarked directories and history              |netrw-qb|
"	   qf	Display information on file                          |netrw-qf|
"	   qF	Mark files using a quickfix list                     |netrw-qF|
"	   qL	Mark files using a |location-list|                     |netrw-qL|
"	   r	Reverse sorting order                                |netrw-r|
"	   s	Select sorting style: by name, time, or file size    |netrw-s|
"	   S	Specify suffix priority for name-sorting             |netrw-S|
"	   t	Enter the file/directory under the cursor in a new tab|netrw-t|
"	   u	Change to recently-visited directory                 |netrw-u|
"	   U	Change to subsequently-visited directory             |netrw-U|
"	   v	Enter the file/directory under the cursor in a new   |netrw-v|
"	    	browser window.  A vertical split is used.
"	   x	View file with an associated program                 |netrw-x|
"	   X	Execute filename under cursor via |system()|           |netrw-X|
"

" Moving around
" e Move to the end of a word.
" w Move forward to the beginning of a word.
" 3w Move forward three words.
" W Move forward a WORD (any non-whitespace characters).
" b Move backward to the beginning of a word.
" 3b Move backward three words.
" $ Move to the end of the line.
" 0 Move to the beginning of the line.
" ^ Move to the first non-blank character of the line.
" ) Jump forward one sentence.
" ( Jump backward one sentence.
" } Jump forward one paragraph.
" { Jump backward one paragraph.:
" j Jump forward one line.
" k Jump backward one line.
" H Jump to the top of the screen.
" M Jump to the middle of the screen.
" L Jump to the bottom of the screen.
" 10<PageUp> or 10<CTRL-B> Move 10 pages up.
" 5<PageDown> or 5<CTRL-F> Move 5 pages down.
" G Jump to end of file.
" 1G Jump to beginning of file (same as gg).
" 50G Jump to line 50.
" mx Set mark x at the current cursor position.
" 'x Jump to the beginning of the line of mark x.
" `x Jump to the cursor position of mark x.
" '' Return to the line where the cursor was before the latest jump. (Two single quotes.)
" `` Return to the cursor position before the latest jump (undo the jump). (Two back ticks. This is above the Tab key on some keyboards.)
" '. Jump to the last-changed line.
" % Jump to corresponding item, e.g. from an open brace to its matching closing brace. See Moving to matching braces for more.
