I've started using pathogen thanks to a blog post available at:
http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

-------

add new bundle:

git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."

----

upgrade:

git submodule foreach git pull origin master


----

clone to other machine:

cd ~
git clone http://github.com/username/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
cd ~/.vim
git submodule init
git submodule update


---------

Clojure additions inspired by
http://www.neo.com/2014/02/25/getting-started-with-clojure-in-vim

---------

vim-airline and other stuff need custom fonts:
https://github.com/ryanoasis/nerd-fonts
