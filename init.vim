syntax on

filetype plugin indent on 
set number
set foldmethod=indent
set foldlevelstart=99
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.nvim/undodir
set undofile
set incsearch
set background=dark

set colorcolumn=150
highlight ColorColumn ctermbg=0 guibg=lightgrey

autocmd FileType python,go set shiftwidth=4 softtabstop=4 expandtab
autocmd FileType ruby,html,javascript,typescript,css,json,vue set shiftwidth=2 tabstop=2

if $VIMENV == 'prev'
	noremap <Space> :n<CR>
	noremap <Backspace> :N<CR>
	set noswapfile
endif

call plug#begin('~/.local/share/nvim/site/plugged')

"visual
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-surround'
Plug 'jremmen/vim-ripgrep'
Plug 'kien/ctrlp.vim'
Plug 'valloric/youcompleteme'
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'


call plug#end()

colorscheme gruvbox
map <C-n> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab

if executable('rg')
  let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 15

let g:ctrlp_use_caching = 0

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" Git commands
nnoremap <Leader>gc :Git<SPACE>commit<SPACE>-am<SPACE>"
nnoremap <Leader>ga :Git<SPACE>add<SPACE>-A
nnoremap <Leader>gp :Git<SPACE>push
nnoremap <Leader>gb :Git<SPACE>branch<SPACE>-b<SPACE>


fun! GoYCM()
    nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
    nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
    nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
endfun

set foldmethod=indent   
set foldnestmax=10
set foldlevel=2
