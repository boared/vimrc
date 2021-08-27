""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                       "PLUGINS"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" nvim-treesitter wraps the Neovim treesitter API to provide functionnalities such as highlighting and
" incremental selection, and a command to easily install parsers.
"
" * To update a parser run :TSUpdate {language} or :TSUpdate to update all parsers
" * To check for problems run :checkhealth nvim_treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Run :TSUpdate after installing/updating

" Adaptation of Atom's one-light and one-dark colorschemes
Plug 'rakr/vim-one'

" A tree explorer plugin for vim (:help NERDTree)
Plug 'preservim/nerdtree'

" Adds syntax for nerdtree on most common file extensions.
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Lean & mean status/tabline for vim that's light as air (:help airline)
Plug 'vim-airline/vim-airline'

" Themes for vim-airline (:help airline)
Plug 'vim-airline/vim-airline-themes'

" Add icons to plugins (:help devicons)
" Need to install a Nerd font compatible first, like https://github.com/ryanoasis/nerd-fonts
Plug 'ryanoasis/vim-devicons'




"""""""""""""""""""""""""""
     "EXPERIMENTATIONS"
"""""""""""""""""""""""""""

" A highly extendable fuzzy finder over lists
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Adds Go language support for Vim
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Provides Rust file detection, syntax highlighting, formatting, Syntastic integration, and more. (:help rust)
"Plug 'rust-lang/rust.vim'

" JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation.
"Plug 'pangloss/vim-javascript'

" Coc is an intellisense engine for vim8 & neovim (:help coc-nvim)
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy finder plugin (:help fzf-vim)
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'

" A git wrapper so awesome, it should be illegal (:help fugitive)
"Plug 'tpope/vim-fugitive'

call plug#end()




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                 "PLUGIN SETTINGS"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nvim-treesitter settings
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  --ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    --disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF


" vim-airline settings
let g:airline_theme='one'


" vim-devicons settings
set guifont=Hack_Nerd_Font_Mono:h12 " If that doesn't do the trick, set your terminal's font instead
let g:airline_powerline_fonts = 1 " Only if vim-airline is being used


" rust.vim settings
"let g:rustfmt_autosave = 1


" coc-nvim settings
" Highlight // comments in json files (useful for coc configuration file)
"autocmd FileType json syntax match Comment +\/\/.\+$+

" Navigate completion list with <Tab> and <S-Tab>
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

