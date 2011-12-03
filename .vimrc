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
let g:molokai_original = 0
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

autocmd BufNewFile,BufRead *.json set ft=javascript

map <F2> :NERDTreeToggle<CR>
