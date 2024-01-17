local ts = require("telescope")
local ts_builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>fb", ts.extensions.file_browser.file_browser, {})
vim.keymap.set("n", "<leader>ff", ts_builtin.find_files, {})
vim.keymap.set("n", "<leader>lg", ts_builtin.live_grep, {})
vim.keymap.set("n", "<leader>ls", ts_builtin.buffers, {})
