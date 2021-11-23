local servers = {}

--==============================================================================
-- Typescript LSP Configs
--
-- LSP server: typescript-language-server/typescript-language-server
-- Install:
--     npm install -g typescript
--     npm install -g typescript-language-server
--==============================================================================
servers['tsserver'] = {}

--==============================================================================
-- Rust LSP Configs
--
-- LSP server: rust-analyzer/rust-analyzer
--==============================================================================
servers['rust_analyzer'] = {}


--==============================================================================
-- Python LSP Configs
--
-- LSP server: python-lsp/python-lsp-server
--==============================================================================
servers['pyright'] = {}


--==============================================================================
-- Lua LSP Configs
--
-- LSP server: sumneko/lua-language-server
--==============================================================================
servers['sumneko_lua'] = {}

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko/lua-language-server")
end

local home = os.getenv("HOME")
local sumneko_root_path = home..[[/.lua-language-server]]
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

servers['sumneko_lua'] = {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}



--==============================================================================
-- Keybindings
--==============================================================================
local go2declaration = 'gD'
local go2definition = 'gd'
local go2implementation = 'gi'
local go2refereces = 'gr'
local hover = 'K'
local signature = '<C-k>'
local prev_issue = ']d'
local next_issue = '[d'
local rename = '<leader>rn'

local lspconfig = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Set up completion-nvim
  require'completion'.on_attach()

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', go2declaration, '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', go2definition, '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', go2implementation, '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', go2refereces, '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', hover, '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', signature, '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  --buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', rename, '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  --buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  --buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', prev_issue, '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', next_issue, '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  --buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  --buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
      buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
      buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  --if client.resolved_capabilities.document_highlight then
  --    lspconfig.util.nvim_multiline_command [[
  --    :hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
  --    :hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
  --    :hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
  --    augroup lsp_document_highlight
  --        autocmd!
  --        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  --        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  --    augroup END
  --    ]]
  --end
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
for lsp, config in pairs(servers) do
  servers[lsp]['on_attach'] = on_attach
  servers[lsp]['flags'] = { debounce_text_changes = 150 }
  lspconfig[lsp].setup(config)
end

