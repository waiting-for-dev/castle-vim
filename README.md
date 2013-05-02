My [Vim](http://www.vim.org/) configuration files.

# How to make Vim configuration distributable?

## Distribute your configuration

* Do not touch global Vim configuration file (`/etc/vim` in Unix). Do whatever in your user vimrc.
* Create a new repository in `~/.vim`
* Use [NeoBundle](https://github.com/Shougo/neobundle.vim) to manage your plugins in a distributable way. Another alternatives are [Vundle](https://github.com/gmarik/vundle) or [pathogen](https://github.com/tpope/vim-pathogen).
* Tell your CVS (git, svn...) to ignore the directory where NeoBundle keep the plugins. Usually, `bundle`.
* Instead of using `~/.vimrc`, use a `vimrc` file inside your `~/.vim` directory. That way you can package it with your repository.
* Commit, pull to some remote repository!!

## Recover your configuration

Once you want to recover your configuration in a brand new Vim installation:

* Clone your repository into `~/.vim`
* Create a symbolic link `~/.vimrc` to the repository file `~/.vim/vimrc`. Another option is to create just a `.vimrc` file with:

        if filereadable($HOME.'/.vim/vimrc')
           source $HOME/.vim/vimrc
        endif

* Install NeoBundle
* Run `:NeoBundleInstall`
