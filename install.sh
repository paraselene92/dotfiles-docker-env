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

dein_install(){
        echo "================================="
        echo "dein install"
        echo "================================="
        cd /tmp
        curl -o installer.sh https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
        sh ./installer.sh $HOME/.cache/dein
        sleep 5
}

ghq_install(){
        echo "================================="
        echo "ghq install"
        echo "================================="
        cd /tmp
        curl -OL "https://github.com/x-motemen/ghq/releases/download/v1.1.5/ghq_linux_amd64.zip"
        unzip ghq_linux_amd64.zip
        sudo cp /tmp/ghq_linux_amd64/ghq /usr/local/bin/.
}

starship_install(){
        echo "================================="
        echo "starship install"
        echo "================================="
        curl -fsSL https://starship.rs/install.sh | bash
}

terraform_lsp_install(){
        echo "================================="
        echo "terraform-lsp install"
        echo "================================="
        cd /tmp
        curl -OL "https://github.com/juliosueiras/terraform-lsp/releases/download/v0.0.11-beta2/terraform-lsp_0.0.11-beta2_linux_amd64.tar.gz"
        tar zxvf terraform-lsp_0.0.11-beta2_linux_amd64.tar.gz
        sudo mv /tmp/terraform-lsp /usr/local/bin/.
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
dein_install
ghq_install
starship_install
terraform_lsp_install
make_symbolicfile

