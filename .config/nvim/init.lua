-- Note: You can get luacheck to recognize the vim global by putting this configuration in ~/.luacheckrc
-- (or $XDG_CONFIG_HOME/luacheck/.luacheckrc):
--
-- globals = {
--    "vim",
-- }

local home = os.getenv("HOME")

-- Set runtimepath and packpath
vim.opt.runtimepath:prepend(home .. [[/.vim]])
vim.opt.runtimepath:append(home .. [[/.vim/after]])
vim.opt.packpath = vim.opt.runtimepath:get()

-- Set up Python (run :checkhealth command if Python fails to load)
vim.g.python_host_prog = home .. [[/opt/miniconda3/envs/py27/bin/python2]]
vim.g.python3_host_prog = home .. [[/opt/miniconda3/bin/python3]]

require('init.plugins')
require('init.lsp')
require('init.colors')

-- Work related stuff
require('init.work')

-- TODO: Gradually move these vimrcs to ~/.config/nvim/lua/init/*.lua
-- Consider replacing $HOME/.config/ by stdpath("config")
vim.cmd([[
  source $HOME/.config/nvim/configs.vimrc
  source $HOME/.config/nvim/mappings.vimrc
  source $HOME/.config/nvim/lab.vimrc
  source $HOME/.config/nvim/autocmd.vimrc
]])
