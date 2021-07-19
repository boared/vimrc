set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
"let g:python_host_prog = '$HOME/miniconda3/envs/py27/bin/python2'
let g:python3_host_prog = '$HOME/miniconda3/bin/python3' " Run :CheckHealth in command mode if Python fails to load

source ~/.vimrc
