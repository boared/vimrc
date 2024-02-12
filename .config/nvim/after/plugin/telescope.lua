local ts = require("telescope")
local ts_builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>fb", ts.extensions.file_browser.file_browser, {})
vim.keymap.set("n", "<leader>ff", ts_builtin.find_files, {})
vim.keymap.set("n", "<leader>lg",
    -- Live grep filtered by file type (mnemonic: type grep)
    -- Available types can be found by running `$ rg --type-list`
    function()
        local tf = vim.fn.input("File type > ")
        if tf == nil or tf == "" then
            tf = {}
        else
            tf = { type_filter = tf }
        end
        ts_builtin.live_grep(tf)
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
