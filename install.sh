echo "Moving old ~/.vimrc and ~/.gvimrc to ~/._vim direcotory in case you ever need them."
vimdir = ~/.vim
# TODO refactor it to make a little bit more maintainable
mkdir -p ~/._vim
mv ~/.vimrc ~/._vim/.vimrc
mv ~/.gvimrc ~/._vim/.gvimrc


echo "Linking vimrc and gvimrc."
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

echo "Cloning bundles."
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle

# clone vundle
# run bundle install

echo "All done!"
