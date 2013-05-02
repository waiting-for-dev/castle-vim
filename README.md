My [Vim](http://www.vim.org/) configuration files.

# How to make Vim configuration distributable?

## Distribute your configuration

* Do not touch global Vim configuration file (`/etc/vim` in Unix). Do whatever in your user vimrc.
* Create a repository compatible with [homesick](https://github.com/technicalpickles/homesick) or [homeshick](https://github.com/andsens/homeshick), that's it, put your `~/.vimrc` file and your `~/.vim/` directory inside a `home/` directory. That repositories are called castles. (Note: You can as well go on without it. You should symlink then your real `.vimrc` with some file inside your repository.)
* Use [NeoBundle](https://github.com/Shougo/neobundle.vim) to manage your plugins in a distributable way. Another alternatives are [Vundle](https://github.com/gmarik/vundle) or [pathogen](https://github.com/tpope/vim-pathogen).
* Do not track in your repository the `bundle` directory, because you can recreate it easily with NeoBundle, Vundle, or git submodules with pathogen.
* As you are a vim user, surely you'll want to ignore some vim generated files

        curl https://raw.github.com/github/gitignore/master/Global/vim.gitignore > .gitignore
* If you want, push your repository somewhere.

## Recover your configuration

Once you want to recover your configuration in a brand new Vim installation:

* Create again your vim castle with `homesick clone your_repo` or `homeshick clone your_repo`, and let it create the symlinks you need.
* Install NeoBundle, Vundle or pathogen.
* Run `:NeoBundleInstall`, `:BundleInstall` or update your git submodules.
