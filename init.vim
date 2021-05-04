call plug#begin('~/.vim/plugged')
 	Plug 'scrooloose/nerdtree'
 	Plug 'neoclide/coc.nvim', {'branch': 'release'}
 	Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
	Plug 'chriskempson/base16-vim'

	" status bar
	Plug 'itchyny/lightline.vim'

	" syntax
	Plug 'StanAngeloff/php.vim'

	"find files
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
call plug#end()

autocmd BufEnter * call ncm2#enable_for_buffer()

set completeopt=noinsert,menuone,noselect

set nu
set nowrap
set mouse=a
set tabstop=2
set shiftwidth=2
set noexpandtab
set ai
set si
set termguicolors
set cursorline
set nowritebackup
set nobackup
set noswapfile
set updatetime=300
set shortmess+=c
set splitright
set splitbelow
set incsearch
set hlsearch
set inccommand=split
set title
set breakindent

filetype indent on
syntax on

nnoremap <C-n> gt
nnoremap <C-p> gT
nnoremap <C-f> :Files <CR>

"open terminal
tnoremap <Esc> <C-\><C-n>

au BufEnter * if &buftype == 'terminal' | :startinsert | endif

function! OpenTerminal()
  split term://bash
  resize 10
endfunction

nnoremap <c-t> :call OpenTerminal()<CR>



let g:coc_disable_startup_warning = 1

colorscheme base16-atelier-forest
hi Normal guibg=NONE ctermbg=NONE

nnoremap <C-i> :Prettier <CR> :w <CR>


autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <silent> <C-k><C-f> :NERDTreeToggle<CR>

"autocompletion refresh
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()



inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"<CTRL-SPACE> to refresh autocompletion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"enter to confirm selection
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

