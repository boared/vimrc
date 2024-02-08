local ts = require("telescope")
local ts_builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>fb", ts.extensions.file_browser.file_browser, {})
vim.keymap.set("n", "<leader>ff", ts_builtin.find_files, {})
vim.keymap.set("n", "<leader>lg", ts_builtin.live_grep, {})
vim.keymap.set("n", "<leader>tg",
    -- Live grep filtered by file type (mnemonic: type grep)
    -- Available types can be found by running `$ rg --type-list`
    function()
        local tf = vim.fn.input("File type > ")
        ts_builtin.live_grep({ type_filter = tf })
    end, {})
vim.keymap.set("n", "<leader>ls", ts_builtin.buffers, {})

ts.setup {
    extensions = {
        file_browser = {
            hidden = { file_browser = true, folder_browser = true },
        },
    },
}

ts.load_extension "file_browser"
