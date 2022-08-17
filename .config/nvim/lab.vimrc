""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                       "EXPERIMENTS"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove trailing whitespace in the whole file
nnoremap <leader>dw :%s/\s\+$//e<CR>

" Windows resizing
nnoremap <leader>a <c-w>10<
nnoremap <leader>d <c-w>10>
nnoremap <leader>s <c-w>10-
nnoremap <leader>w <c-w>10+

" vim-go settings
" Enagle gopls in vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" GoDef in split/vsplit/tab windows
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

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

