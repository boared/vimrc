set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let g:python3_host_prog = '$HOME/opt/miniconda3/bin/python3'
let g:python_host_prog = '$HOME/opt/miniconda3/bin/python3'
"let g:python_host_prog = '$HOME/opt/miniconda3/envs/py27/bin/python2'

source ~/.vimrc
