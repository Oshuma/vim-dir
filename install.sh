#!/usr/bin/env bash

vim_dir=$HOME/.vim
vimrc=$HOME/.vimrc

if [[ -d $vim_dir ]]; then
  echo "Directory '$vim_dir' exists; aborting..."
  exit 1
fi

echo -e "\n--- Installing to $vim_dir ---\n"

# Clone the repo.
git clone git://github.com/Oshuma/vim-dir.git $vim_dir
cd $vim_dir

if [[ -L $vimrc ]]; then
  echo "Re-linking $vimrc"
  rm -vf $vimrc
fi
ln -s $vim_dir/vimrc $vimrc

# Clone the Vundle repo.
git clone http://github.com/gmarik/vundle.git $vim_dir/vundle.git

# Install the bundles.
vim -c :BundleInstall -c :q

# Sometimes the terminal gets fudged, so reset it.
reset
