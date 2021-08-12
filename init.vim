call plug#begin('~/.vim/plugged')
	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
 	Plug 'neoclide/coc.nvim', {'branch': 'release'}
 	Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
	Plug 'chriskempson/base16-vim'

	Plug 'itchyny/lightline.vim'

	Plug 'pangloss/vim-javascript'
	Plug 'mxw/vim-jsx'
	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'
	Plug 'puremourning/vimspector'
	Plug 'jiangmiao/auto-pairs'

	" react highlight
	Plug 'maxmellon/vim-jsx-pretty'

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
call plug#end()

set nu
set nowrap
set mouse=a
set tabstop=2
set shiftwidth=2
set noexpandtab
set ai
set si
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


if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


filetype indent on
syntax on

nnoremap ; <ESC>:%s/;
nnoremap <C-n> gt
nnoremap <C-p> gT
nnoremap <C-f> :Files <CR>

"open terminal
tnoremap <Esc> <C-\><C-n>

au BufEnter * if &buftype == 'terminal' | :startinsert | endif

function! OpenTerminal()
  split term://zsh
  resize 10
endfunction

nnoremap <c-t> :call OpenTerminal()<CR>

nnoremap <C-s-i> :Prettier <CR><ESC>

let g:coc_disable_startup_warning = 1

nnoremap <silent> <C-k><C-f> :NERDTreeToggle<CR>

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

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

hi Normal guibg=NONE ctermbg=NONE

hi CursorLine term=NONE cterm=NONE
hi CursorLineNr cterm=NONE

colorscheme base16-harmonic-dark
