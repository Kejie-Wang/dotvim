#!/bin/sh

vim_runtime=$HOME/.vim_runtime

die() {
    echo "$1" >&2
    exit 1
}

[ -e ${vim_runtime} ] && die "The ${vim_runtime} already exists."
[ -e ~/.vimrc ] && die "The ~/.vimrc already exists."
[ -e ~/.config/nvim/init.vim ] && die "The ~/.config/nvim/init.vim already exists."

git clone --depth 1 https://github.com/Kejie-Wang/dotvim.git ${vim_runtime}
cd ${vim_runtime}
git submodule update --init
cd ${vim_runtime}/plugins/pack/editor/start/markdown-preview.nvim/app && ./install.sh
cd ${vim_runtime}/plugins/pack/finder/start/fzf && ./install --completion --no-key-bindings --no-bash --no-zsh --no-fish

ln -s ${vim_runtime}/vimrc ~/.vimrc
ln -s ${vim_runtime}/vimrc ~/.config/nvim/init.vim
