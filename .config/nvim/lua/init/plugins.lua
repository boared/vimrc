--==============================================================================--
                                    --PLUGINS--
--==============================================================================--
vim.cmd([[
  call plug#begin('~/.local/share/nvim/plugged')

  " A collection of common configurations for Neovim's built-in language server
  " client. This repo handles automatically launching and initializing language
  " servers that are installed on your system.
  Plug 'neovim/nvim-lspconfig'

  " A completion engine plugin for neovim written in Lua. Completion sources are
  " installed from external repositories and "sourced".
  "
  " nvim-cmp: Completion engine plugin
  " cmp-nvim-lsp: nvim-cmp source for neovim's built-in language server client
  " cmp-vsnip: nvim-cmp source for vim-vsnip
  " vim-vsnip: VSCode(LSP)'s snippet feature in vim
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'

  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'

  " Extra rust tools for writing applications in neovim using the native lsp.
  " This plugin adds extra functionality over rust analyzer.
  "Plug 'simrat39/rust-tools.nvim'
  Plug 'simrat39/rust-tools.nvim'

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

  " Lean & mean status/tabline for vim that's light as air (:help airline)
  Plug 'vim-airline/vim-airline'

  " Themes for vim-airline (:help airline)
  Plug 'vim-airline/vim-airline-themes'

  " A highly extendable fuzzy finder over lists
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " A File Explorer For Neovim Written In Lua
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons


  "========================="
       "EXPERIMENTATIONS"
  "========================="

  " Extensions for nvim-lsp for eclipse.jdt.ls
  Plug 'mfussenegger/nvim-jdtls'

  " Debugging capabilities
  Plug 'mfussenegger/nvim-dap'

  " Preview markdown on your modern browser with synchronised scrolling and flexible configuration
  " Depends on node and yarn to be installed
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

  " Adds Go language support for Vim
  "Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  call plug#end()
]])



--==============================================================================--
                                --PLUGIN SETTINGS--
--==============================================================================--

--==============================--
--   nvim-lspconfig settings    --
--==============================--
-- See lsp.lua for language specific configurations


--==============================--
--       nvim-cmp settings      --
--==============================--
vim.cmd([[set completeopt=menu,menuone,noselect]])
local cmp = require'cmp'

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- Need Nerd Fonts installed
local cmp_kinds = {
  Class = 'פּ ',
  Color = ' ',
  Constant = ' ',
  Constructor = '華 ',
  Enum = ' ',
  EnumMember = ' ',
  Event = '  ',
  Field = ' ',
  File = ' ',
  Folder = ' ',
  Function = ' ',
  Interface = '豈 ',
  Keyword = ' ',
  Method = ' ',
  Module = ' ',
  Operator = '  ',
  Property = '  ',
  Reference = '& ',
  Snippet = ' ',
  Struct = 'ﬥ ',
  Text = ' ',
  TypeParameter = '  ',
  Unit = '  ',
  Value = '  ',
  Variable = 'χ ',
}

cmp.setup({
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
      return vim_item
    end,
  },
  enabled = function()
    -- Disable completion in comments
    local context = require 'cmp.config.context'
    -- Keep command mode completion enabled when cursor is in a comment
    if vim.api.nvim_get_mode().mode == 'c' then
      return true
    else
      return not context.in_treesitter_capture("comment")
        and not context.in_syntax_group("Comment")
    end
  end,
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})


--==============================--
--   nvim-treesitter settings   --
--==============================--
local ts_configs = require('nvim-treesitter.configs')
ts_configs.setup {
  ensure_installed = {
    "bash",
    "bibtex",
    "c",
    "c_sharp",
    "clojure",
    "cmake",
    "comment",
    "commonlisp",
    "cpp",
    "css",
    "cuda",
    "dart",
    "glsl",
    "go",
    "godot_resource",
    "gomod",
    "gowork",
    "graphql",
    "hjson",
    "html",
    "http",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "jsonc",
    "julia",
    "kotlin",
    "latex",
    "llvm",
    "lua",
    "make",
    "ninja",
    "pascal",
    "perl",
    "php",
    "python",
    "ql",
    "query",
    "r",
    "regex",
    "ruby",
    "rust",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "wgsl",
    "yaml"
  },

  -- Leverage treesitter for syntax highlighting
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = function(lang, bufnr)
        return vim.api.nvim_buf_line_count(bufnr) > 50000 -- disable hightlight for large files
    end,
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
vim.opt.guifont = { Hack_Nerd_Font_Mono = 'h12' } -- You may need to set your terminal's font instead
vim.g.airline_powerline_fonts = 1 -- Only if vim-airline is being used


--====================================--
--   markdown-preview.nvim settings   --
--====================================--
-- Set to 1, the vim will refresh markdown when save the buffer or
-- leave from insert mode, default 0 is auto refresh markdown as you edit or
-- move the cursor
-- default: 0
vim.g.mkdp_refresh_slow = 1

-- Open preview in a separate window
vim.cmd([[
    function OpenMarkdownPreview (url)
        execute "silent ! /Applications/Firefox.app/Contents/MacOS/firefox --new-window " . a:url
    endfunction
    let g:mkdp_browserfunc = 'OpenMarkdownPreview'
]])


--============================--
--   nvim-tree.lua settings   --
--============================--
-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "s", action = "vsplit" },
      },
    },
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
  },
  filters = {
    dotfiles = true,
  },
})
