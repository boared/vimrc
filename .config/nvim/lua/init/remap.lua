--------------------------------------------------------------------------------------------------------------------------
--                                                    "KEY MAPPING"
--
-- Before adding a keymap, check if a key is being currently set, for example:
-- :verbose imap <tab>
-- :Telescope keymaps
--------------------------------------------------------------------------------------------------------------------------

vim.g.mapleader = " "

-- Do not lose what's yanked after pasting over a selected text
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Navigate through windows (h - left, j - down, k - up, l - right, q - quit window)
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")
vim.keymap.set("n", "<leader>q", "<c-w>q")

-- Split window horizontally
vim.keymap.set("n", "<leader>hs", ":split<cr>")

-- Split window vertically
vim.keymap.set("n", "<leader>vs", ":vsplit<cr>")

-- Clear search highlight without disabling highlight
vim.keymap.set("n", "<esc>", ":noh<cr><esc>")

--Yank to clipboard instead of "0
vim.keymap.set("x", "<leader>y", "\"+y:echo \"Yanked to \\\"+ register\"<cr>")
vim.keymap.set("n", "<leader>yy", "\"+yy:echo \"Yanked to \\\"+ register\"<cr>")

-- Copy the content of yanked/deleted text to clipboard
vim.keymap.set("n", "<leader>cy", ":let @+=@<cr>:echo \"Yanked text copied to clipboard\"<cr>")

-- Next search always shown in the middle of the screen
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Half-page scroll down/up keeps the cursor at the middle of the screen
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
