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
syntax on

colorscheme molokai
let g:molokai_original = 1
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

map <F2> :NERDTreeToggle<CR>
