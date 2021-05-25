let s:vim_runtime=fnamemodify(resolve(expand('<sfile>')), ':p:h')

exe "source " s:vim_runtime."/vim/basic.vim"
exe "source " s:vim_runtime."/vim/plugin.vim"
