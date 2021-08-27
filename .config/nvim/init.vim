set runtimepath^=$HOME/.vim runtimepath+=$HOME/.vim/after
let &packpath = &runtimepath
"let g:python_host_prog = '$HOME/miniconda3/envs/py27/bin/python2'
let g:python3_host_prog = '$HOME/miniconda3/bin/python3' " Run :CheckHealth in command mode if Python fails to load


" TODO: Move current .vimrc to separate files and source them all
source $HOME/.config/nvim/plugins.vimrc
"source $HOME/.vimrc/configs.vimrc
"source $HOME/.vimrc/colors.vimrc
"source $HOME/.vimrc/mappings.vimrc
"source $HOME/.vimrc/functions.vimrc
"source $HOME/.vimrc/lab.vimrc

source $HOME/.vimrc
