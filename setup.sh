#!/bin/bash
# install packages
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
esac

echo ${machine}

if [ "$machine" == "Linux" ]; then
  sudo apt install neovim nodejs zsh tig
elif [ "$machine" == "Linux" ]; then
  brew install neovim nodejs zsh tig
fi

# config neovim
# install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# link nvim config
ln -s `pwd`/nvim ~/.config/nvim


# config tig
ln -s `pwd`/.tigrc ~/.tigrc

# config oh my zsh
# install omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# clone the configuration
cd ~/.oh-my-zsh/custom && git clone https://github.com/allenjlw/terminal-conf.git
ln -s ~/.oh-my-zsh/custom/terminal-conf/custom-bira.zsh-theme ~/.oh-my-zsh/custom/custom-bira.zsh-theme
sed -i 's/robbyrussell/custom-bira/g' ~/.zshrc
