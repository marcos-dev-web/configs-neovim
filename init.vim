set nu
set nowrap
set mouse=a
"set textwidth=80
set tabstop=2
set shiftwidth=2
set expandtab
set list
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

set title
set breakindent


filetype indent on

syntax on

set imsearch
set incsearch
set hlsearch
set inccommand=split


"open terminal
tnoremap <Esc> <C-\><C-n>
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-t> :call OpenTerminal()<CR>


"plugins

call plug#begin('~/.vim/plugged')
	Plug 'jiangmiao/auto-pairs'
	Plug 'scrooloose/nerdtree'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
	Plug 'wadackel/vim-dogrun'
	Plug 'mustache/vim-mustache-handlebars'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'styled-components/vim-styled-components', {'branch': 'main'}
  Plug 'briancollins/vim-jst'
  Plug 'chrisbra/Colorizer'
  Plug 'dracula/vim', {'as':'dracula'}
  Plug 'tomasiser/vim-code-dark'
call plug#end()

colorscheme codedark

nnoremap <C-f> :Files <CR>
nnoremap <C-n> gt
nnoremap <C-p> gT
nnoremap <C-i> :Prettier <CR> :w <CR>


"Nerd tree toggle
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <silent> <C-b> :NERDTreeToggle<CR>

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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
