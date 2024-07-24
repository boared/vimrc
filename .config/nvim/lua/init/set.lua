vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Indentation options
vim.opt.tabstop = 4 -- Number of columns (whitespaces) that a <Tab> char in the file counts for
vim.opt.softtabstop = 4 -- Number of columns a tab keypress or a backspace keypress worth
vim.opt.shiftwidth = 4 -- Number of columns a level of indentation worth
vim.opt.expandtab = true -- Means that inserting a <Tab> will replace it by a number of whitespaces as defined in tabstop

vim.opt.wrap = false

vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:blinkon150-blinkoff150-blinkwait1"

-- Ignore case in search patterns (including typing commands in command mode).
-- smartcase will override the 'ignorecase' option if the search pattern
-- contains upper case characters.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Window split behaviour
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Visual block (<c-v>) expand beyond end of line
vim.opt.virtualedit = "block"

