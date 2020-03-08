#!/bin/bash

start(){
        clear
        echo "================================="
        echo "Start dotfiles sh..."
        echo "================================="
        sleep 5
        echo -n "Times Up! Start!"
        cd $HOME
}

git_clone(){
        echo "================================="
        echo "git clone"
        echo "================================="
        git clone https://github.com/paraselene92/dotfiles-docker-env.git
        sleep 5
}

dein_install(){
        echo "================================="
        echo "dein install"
        echo "================================="
        cd /tmp
        curl -o installer.sh https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
        sh ./installer.sh $HOME/.cache/dein
        sleep 5
}

make_symbolicfile(){
        echo "================================="
        echo "make symbolicfile"
        echo "================================="
        cd $HOME/.cache/dein &&\
                ln -s $HOME/dotfiles/userconfig/ userconfig
        mkdir -p $HOME/.config/fish &&\
                cd $HOME/.config/fish &&\
                ln -s $HOME/dotfiles/fish/config.fish config.fish &&\
                ln -s $HOME/dotfiles/fish/functions/ functions
        cd $HOME &&\
                ln -s $HOME/dotfiles/.aws .aws &&\
                ln -s $HOME/dotfiles/.vim .vim &&\
                ln -s $HOME/dotfiles/.vimrc .vimrc &&\
                ln -s $HOME/dotfiles/.tmux.conf .tmux.conf
        sleep 5
}

start
git_clone
dein_install
make_symbolicfile

