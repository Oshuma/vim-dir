# ~/.vim/

## Quick Install

    $ bash < <(curl -s https://github.com/Oshuma/vim-dir/raw/master/install.sh)

## Manual Install

### Clone the repo:

    $ git clone git://github.com/Oshuma/vim-dir.git ~/.vim
    $ cd ~/.vim

### Clone the Vundle repo:

    $ git clone http://github.com/gmarik/vundle.git ~/.vim/vundle.git

### Run vim and install the bundles:

    :BundleInstall

### Compile plugin extensions:

#### Command-T

    $ cd ~/.vim/bundle/Command-T/ruby/command-t
    $ ruby extconf.rb && make

### Link ~/.vimrc:

    $ ln -s ~/.vim/vimrc ~/.vimrc
