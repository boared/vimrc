""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                    "KEY MAPPING"

" Before adding a keymap, check if a key is being currently set, for example:
" :verbose imap <tab>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prefix key for commands.
let mapleader=","
let maplocalleader = "\\"



"""""""""""""""""""""""""""
" Plugin related Mappings "
"""""""""""""""""""""""""""

" Toggle directory browser tree
nnoremap <leader>tt :NERDTreeToggle<cr>

" Open directory browser tree
nnoremap <leader>ot :NERDTreeMirror<cr>:NERDTreeFocus<cr>

" Focus on browser tree
nnoremap <leader>tf :NERDTreeFocus<cr>



"""""""""""""""""""""""""""
"    General Mappings     "
"""""""""""""""""""""""""""

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

" Open folder containing .vimrc files
nnoremap <leader>ev :tabedit ~/.config/nvim/<cr>

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
"nnoremap <c-space> :bp<cr>

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
nnoremap <esc> :noh<cr><esc>

" Toggle line number. Useful when selecting a block of text with the mouse and
" want to avoid copy line numbers.
nnoremap <leader>tn :set number! number?<cr>

" Toggle line wrap
nnoremap <leader>tw :set wrap! wrap?<cr>

