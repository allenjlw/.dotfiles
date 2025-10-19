#!/bin/bash
# install packages
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
esac

echo ${machine}

if [ "$machine" == "Linux" ]; then
  sudo apt install neovim nodejs npm zsh tig virtualenvwrapper tmux
  # install ls replacement eza (command is `exa`), grep replacement ripgrep (command `rg`), df replacement duf (command `duf`)
  sudo apt install eza ripgrep fd-find duf
elif [ "$machine" == "Mac" ]; then
  brew install neovim nodejs zsh tig eza ripgrep fd duf fzf
fi

# config neovim
# install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# link nvim config
ln -s `pwd`/nvim ~/.config/nvim

# link tig config
ln -s `pwd`/.tigrc ~/.tigrc

# link tmux config
ln -s `pwd`/.tmux.conf ~/.tmux.conf

# config oh my zsh
# install omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# install omz plugin
cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-autosuggestions
cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
# clone the configuration
cd ~/.oh-my-zsh/custom && git clone https://github.com/allenjlw/terminal-conf.git
ln -s ~/.oh-my-zsh/custom/terminal-conf/custom-bira.zsh-theme ~/.oh-my-zsh/custom/custom-bira.zsh-theme
sed -i 's/robbyrussell/custom-bira/g' ~/.zshrc

# fd is fdfind on linux and fd on macos
# if [ "$machine" == "Mac" ]; then
#   sed -i 's/fdfind/fd/g' ~/.zshrc
# fi
