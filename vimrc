"""SETTINGS"""

syntax on "enable syntax highlighting

"jump to last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set shiftwidth=3 "number of spaces for (auto)indent

set expandtab "use spaces instead of tabs

set ignorecase "do case insensitive matching

set smartcase "do smart case matching

set incsearch "incremental search

set mouse=a "enable mouse usage (all modes)

"""START NEOBUNDLE CONFIGURATION (https://github.com/Shougo/neobundle.vim)"""

if has('vim_starting')
   set rtp+=~/.vim/bundle/neobundle.vim/ "add neobundle path to runtimepath
end

call neobundle#rc(expand('~/.vim/bundle/'))

"neobundle intself
NeoBundleFetch 'Shougo/neobundle.vim'

"GitHub repos
NeoBundle 'othree/html5.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'tpope/vim-haml'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'leshill/vim-json'
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'evidens/vim-twig'
NeoBundle 'bronson/vim-visual-star-search'
NeoBundle 'maksimr/vim-translator'
"Bundle 'Townk/vim-autoclose'

"vim-scripts repos
NeoBundle 'AutoTag'
NeoBundle 'bufexplorer.zip'
NeoBundle 'openssl.vim'
NeoBundle 'taglist.vim'
NeoBundle 'VimRepress'
NeoBundle 'vimwiki'

NeoBundleCheck

filetype plugin indent on

"""PLUGINS CONFIGURATION"""

"gtranslate
let g:goog_user_conf = [{'langpair': 'es|en', 'v_key': 'T'}]

"neocomplcache
let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_ignore_case = 0
"let g:neocomplcache_enable_auto_select = 0

"taglist
let Tlist_Use_Right_Window = 1
let Tlist_Sort_Type = "name"

"BufExplorer, some maping
:nmap <C-e> :BufExplorer<Enter>
:nmap <C-h> :BufExplorerHorizontalSplit<Enter>

"""OTHER OPTIONS"""

"when writting e-mails with gmail with <<It's All Text>> Firefox plugin
"(https://addons.mozilla.org/En-us/firefox/addon/its-all-text/)
"set textwidth to 80 characters
autocmd BufNewFile,BufRead mail.google.com* set tw=80

"for writing Calibre recipes (http://manual.calibre-ebook.com/news.html)
"which are python classes
autocmd BufNewFile,BufRead *.recipe set ft=python

"load some personal configuration I don't want in a public repository
if filereadable($HOME.'/.vim/vimrc_private')
   source $HOME/.vim/vimrc_private
endif
