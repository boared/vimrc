--==============================================================================--
                                    --PLUGINS--
--==============================================================================--
vim.cmd([[
  call plug#begin('~/.local/share/nvim/plugged')
  
  " A collection of common configurations for Neovim's built-in language server
  " client. This repo handles automatically launching and initializing language
  " servers that are installed on your system.
  Plug 'neovim/nvim-lspconfig'
  
  " An auto completion framework that aims to provide a better completion
  " experience with neovim's built-in LSP
  Plug 'nvim-lua/completion-nvim'
  
  " nvim-treesitter wraps the Neovim treesitter API to provide functionnalities
  " such as highlighting and incremental selection, and a command to easily
  " install parsers.
  "
  " * To update a parser run :TSUpdate {language} or :TSUpdate to update all parsers
  " * To check for problems run :checkhealth nvim_treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'
  
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
  " Need to install a Nerd font compatible first,
  " e.g., https://github.com/ryanoasis/nerd-fonts
  Plug 'ryanoasis/vim-devicons'


  "========================="
       "EXPERIMENTATIONS"
  "========================="
  
  " A highly extendable fuzzy finder over lists
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  
  " Adds Go language support for Vim
  "Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  
  " Provides Rust file detection, syntax highlighting, formatting, Syntastic
  " integration, and more. (:help rust)
  "Plug 'rust-lang/rust.vim'
  
  " Coc is an intellisense engine for vim8 & neovim (:help coc-nvim)
  "Plug 'neoclide/coc.nvim', {'branch': 'release'}
  
  " Fuzzy finder plugin (:help fzf-vim)
  "Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  "Plug 'junegunn/fzf.vim'
  
  call plug#end()
]])



--==============================================================================--
                                --PLUGIN SETTINGS--
--==============================================================================--

--==============================--
--   nvim-lspconfig settings    --
--==============================--


--==============================--
--   nvim-treesitter settings   --
--==============================--
local ts_configs = require('nvim-treesitter.configs')
ts_configs.setup {
  ensure_installed = "maintained",

  -- Leverage treesitter for syntax highlighting
  highlight = {
    enable = true, -- false will disable the whole extension
  },

  -- Increment selection of block of code
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      node_decremental = "grm",
      scope_incremental = "grc",
    },
  },

  -- Treesitter's concrete syntax tree visualization
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
}


--==============================--
--   vim-airline settings       --
--==============================--
vim.g.airline_theme = 'one'


--==============================--
--   vim-devicons settings      --
--==============================--
vim.opt.guifont = { Hack_Nerd_Font_Mono = 'h12' } -- You may set your terminal's font instead
vim.g.airline_powerline_fonts = 1 -- Only if vim-airline is being used


--==============================--
--   rust.vim settings          --
--==============================--
--vim.g.rustfmt_autosave = 1


--==============================--
--   coc-nvim settings          --
--==============================--
-- Highlight // comments in json files (useful for coc configuration file)
-- vim.cmd([[autocmd FileType json syntax match Comment +\/\/.\+$+]])

-- Navigate completion list with <Tab> and <S-Tab>
--vim.cmd([[
--"inoremap <silent><expr> <TAB>
--"      \ pumvisible() ? "\<C-n>" :
--"      \ <SID>check_back_space() ? "\<TAB>" :
--"      \ coc#refresh()
--"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
--
--"function! s:check_back_space() abort
--"  let col = col('.') - 1
--"  return !col || getline('.')[col - 1]  =~# '\s'
--"endfunction
--]])

--vim.g.coc_snippet_next = '<tab>'
