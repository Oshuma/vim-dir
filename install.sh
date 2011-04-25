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

# Install the bundles and compile plugin extentions.
# Note: We have to use a vim '-c' hack here, since the script exists when vim does.
compile_extentions="cd $vim_dir/bundle/Command-T/ruby/command-t && ruby extconf.rb && make"
vim -c :BundleInstall -c ":!$compile_extentions" -c :q
