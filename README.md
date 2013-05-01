My [Vim](http://www.vim.org/) configuration files.

# How to make Vim configuration distributable?

## Distribute your configuration

* Do not touch global Vim configuration file (`/etc/vim` in Unix). Do whatever in your user vimrc.
* Create a new repository in `~/.vim`
* Use [Vundle](https://github.com/gmarik/vundle) to manage your plugins in a distributable way. You could as well use [pathogen](https://github.com/tpope/vim-pathogen), but Vundle provides some great options to help you keep updated and referenced them without the need of repository submodules.
* Tell your CVS (git, svn...) to ignore the directory where Vundle keep the plugins. Usually, `bundle`.
* Instead of using `~/.vimrc`, use a `vimrc` file inside your `~/.vim` directory. That way you can package it with your repository.
* Commit, pull to some remote repository!!

## Recover your configuration

Once you want to recover your configuration in a brand new Vim installation:

* Clone your repository into `~/.vim`
* Create a symbolic link `~/.vimrc` to the repository file `~/.vim/vimrc`. Another option is to create just a `.vimrc` file with:
    if filereadable($HOME.'/.vim/vimrc')
       source $HOME/.vim/vimrc
    endif
* Install Vundle
* Run `:BundleInstall`
