require('nvim-treesitter.configs').setup {
  -- A list of parser names
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
    "vimdoc",
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

