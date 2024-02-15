local dap = require("dap")
require("dapui").setup()

-- C++ and Rust DAP
dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = os.getenv("HOME") .. "/bin/codelldb/extension/adapter/codelldb",
        args = { "--port", "${port}" },
    }
}

dap.configurations.rust = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}
dap.configurations.c = dap.configurations.rust
dap.configurations.cpp = dap.configurations.rust
