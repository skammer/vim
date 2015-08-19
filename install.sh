echo "Moving old ~/.vimrc and ~/.gvimrc to ~/._vim direcotory in case you ever need them."
vimdir = ~/.nvim
# TODO refactor it to make a little bit more maintainable
mkdir -p ~/._vim
mv ~/.vimrc ~/._vim/.vimrc
mv ~/.gvimrc ~/._vim/.gvimrc


echo "Linking vimrc and gvimrc."
ln -s ~/.vim/nvimrc ~/.nvimrc
ln -s ~/.vim/gnvimrc ~/.gnvimrc

# echo "Cloning bundles."
# mkdir -p ~/.vim/bundle

# clone vundle
# git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# run bundle install
# vim +BundleInstall +qall

# echo "All done!"
