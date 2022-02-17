-- servers contains the setup for each LSP server configured in this file.
-- To add a new LSP server create a key/value where key is the command name
-- of the LSP server and value a custom setup. See examples below.
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
-- Go LSP Configs
--
-- LSP server: golang/tools/gopls
-- Install:
--     brew install gopls
--==============================================================================
servers['gopls'] = {
  cmd = {"gopls", "serve"},
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

-- To get your imports ordered on save, like goimports does, you can define a helper function in Lua:
function GoImports(timeout_ms)
  local context = { only = { "source.organizeImports" } }
  vim.validate { context = { context, "t", true } }

  local params = vim.lsp.util.make_range_params()
  params.context = context

  -- See the implementation of the textDocument/codeAction callback
  -- (lua/vim/lsp/handler.lua) for how to do this properly.
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  if not result or next(result) == nil then return end
  local actions = result[1].result
  if not actions then return end
  local action = actions[1]

  -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
  -- is a CodeAction, it can have either an edit, a command or both. Edits
  -- should be executed first.
  if action.edit or type(action.command) == "table" then
    if action.edit then
      vim.lsp.util.apply_workspace_edit(action.edit)
    end
    if type(action.command) == "table" then
      vim.lsp.buf.execute_command(action.command)
    end
  else
    vim.lsp.buf.execute_command(action)
  end
end
vim.cmd([[autocmd BufWritePre *.go lua GoImports(1000)]])


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
--
-- Installing lua-language-server on MacOS:
--   * brew install ninja
--   * mkdir $HOME/.lua-language-server
--   * cd $HOME/.lua-language-server
--   * git clone https://github.com/sumneko/lua-language-server
--   * cd lua-language-server
--   * git submodule update --init --recursive
--   * cd 3rd/luamake
--   * ninja -f compile/ninja/macos.ninja
--   * cd ../..
--   * ./3rd/luamake/luamake rebuild
--==============================================================================
servers['sumneko_lua'] = {}

local home = os.getenv("HOME")
local sumneko_root_path = home..[[/.lua-language-server/lua-language-server]]
local sumneko_binary = sumneko_root_path.."/bin/lua-language-server"

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
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', go2declaration, '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', go2definition, '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', go2implementation, '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', go2refereces, '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  --buf_set_keymap('n', hover, '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', hover, '<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<CR>', opts)
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
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
for lsp, config in pairs(servers) do
  config['on_attach'] = on_attach
  config['flags'] = { debounce_text_changes = 150 }
  config['capabilities'] = capabilities
  lspconfig[lsp].setup(config)
end

