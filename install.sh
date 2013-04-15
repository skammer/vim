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

mkdir -p colors tools langs
echo "Colors:"
cd ~/.vim/bundle/colors
git clone git://github.com/sjl/badwolf.git
git colone https://github.com/vim-scripts/Colour-Sampler-Pack.git
git colone https://github.com/altercation/vim-colors-solarized.git
git colone https://github.com/twerth/ir_black.git
git colone https://github.com/tpope/vim-vividchalk.git
git colone https://github.com/vim-scripts/molokai.git
git colone https://github.com/vim-scripts/pyte.git
git colone https://github.com/telamon/vim-color-github.git
git colone https://github.com/larssmit/vim-getafe.git
git colone https://github.com/TechnoGate/janus-colors.git

cd ~/.vim/bundle/langs
echo "Langs:"
git colone https://github.com/tpope/vim-haml.git
git colone https://github.com/pangloss/vim-javascript.git
git colone https://github.com/tpope/vim-cucumber.git
git colone https://github.com/tpope/vim-markdown.git
git colone https://github.com/ajf/puppet-vim.git
git colone https://github.com/rosstimson/scala-vim-support.git
git colone https://github.com/nono/vim-handlebars.git
git colone https://github.com/kchmck/vim-coffee-script.git
git colone https://github.com/tpope/vim-rails.git
git colone https://github.com/tpope/vim-git.git
git colone https://github.com/timcharper/textile.vim.git
git colone https://github.com/skwp/vim-rspec.git
git colone https://github.com/cakebaker/scss-syntax.vim.git
git colone https://github.com/chrisbra/csv.vim.git
git colone https://github.com/mmalecki/vim-node.js.git
git colone https://github.com/vim-ruby/vim-ruby.git
git colone https://github.com/vim-scripts/Arduino-syntax-file.git
git colone https://github.com/groenewege/vim-less.git
git colone https://github.com/wlangstroth/vim-haskell.git
git colone https://github.com/slim-template/vim-slim.git
git colone https://github.com/jimenezrick/vimerl.git
git colone https://github.com/sunaku/vim-ruby-minitest.git
git colone https://github.com/guns/vim-clojure-static.git
git colone https://github.com/elixir-lang/vim-elixir.git
git colone git://github.com/AndrewRadev/vim-coffee-script.git
git colone https://github.com/fsouza/go.vim.git
cd ~/.vim/bundle/tools
echo "Tools:"
git colone https://github.com/spolu/dwm.vim
git colone https://github.com/Shougo/neocomplcache.git
git colone git://github.com/kien/rainbow_parentheses.vim.git
git colone git://github.com/tristen/vim-sparkup.git
git colone https://github.com/godlygeek/tabular.git
git colone git://github.com/Townk/vim-autoclose.git
git colone https://github.com/tpope/vim-bundler.git
git colone https://github.com/jistr/vim-nerdtree-tabs.git
git colone https://github.com/tpope/vim-ragtag.git
git colone https://github.com/tpope/vim-ragtag.git
git colone https://github.com/tpope/vim-rails.git
git colone https://github.com/tpope/vim-rake.git
git colone git://github.com/skammer/vim-swaplines.git
git colone https://github.com/vim-scripts/VimClojure
git colone https://github.com/tpope/vim-unimpaired.git
git colone https://github.com/scrooloose/nerdcommenter.git
git colone https://github.com/edsono/vim-matchit.git
git colone https://github.com/ervandew/supertab.git
git colone https://github.com/itspriddle/ZoomWin.git
git colone https://github.com/mileszs/ack.vim.git
git colone https://github.com/tpope/vim-fugitive.git
git colone https://github.com/sjl/gundo.vim.git
git colone https://github.com/tpope/vim-surround.git
git colone https://github.com/garbas/vim-snipmate.git
git colone https://github.com/honza/snipmate-snippets.git
git colone https://github.com/tomtom/tlib_vim.git
git colone https://github.com/MarcWeber/vim-addon-mw-utils.git
git colone https://github.com/scrooloose/syntastic.git
git colone https://github.com/majutsushi/tagbar.git
git colone https://github.com/scrooloose/nerdtree.git
git colone https://github.com/michaeljsmith/vim-indent-object.git
git colone https://github.com/tpope/vim-endwise.git
git colone https://github.com/mattn/webapi-vim.git
git colone https://github.com/mattn/gist-vim.git
git colone https://github.com/vim-scripts/vimwiki.git
git colone https://github.com/ap/vim-css-color.git
git colone https://github.com/Lokaltog/vim-easymotion.git
git colone https://github.com/chrisbra/NrrwRgn.git
git colone https://github.com/jeetsukumaran/vim-buffergator.git
git colone https://github.com/rgarver/Kwbd.vim.git
git colone https://github.com/kien/ctrlp.vim.git
git colone https://github.com/skalnik/vim-vroom.git
git colone https://github.com/tpope/vim-eunuch.git
git colone https://github.com/tpope/vim-repeat.git

echo "All done!"
