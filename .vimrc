let mapleader = ","
:set paste
:set vb
:set showmode
:set ts=4
:set smartcase
:set ignorecase
:set incsearch
:set hlsearch
:set ai
:set title
:set ruler

call pathogen#infect()

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins
filetype plugin indent on     " enables filetype plugins indent

syntax on
colorscheme solarized

"reformat a json file prettily using ,jt
map <leader>jt <Esc>:%!json_xs -f json -t json-pretty<CR>

"json syntax highlighting
autocmd BufNewFile,BufRead *.json set ft=javascript

"map F2 key to toggle NerdTree on and off
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeFind<CR>
