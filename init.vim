
call plug#begin('~/.vim/plugged')
	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
 	Plug 'neoclide/coc.nvim', {'branch': 'release'}
 	Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

	Plug 'itchyny/lightline.vim'

	Plug 'pangloss/vim-javascript'
	Plug 'mxw/vim-jsx'
	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'
	Plug 'puremourning/vimspector'

	Plug 'maxmellon/vim-jsx-pretty'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

	Plug 'sainnhe/sonokai'

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
call plug#end()

" ----

let g:jsx_ext_required = 0

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

autocmd bufnewfile,bufread *.js set filetype=javascriptreact

" ----

set nu
set rnu
set nowrap
set mouse=
set tabstop=2
set shiftwidth=2
set expandtab
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
set background=dark

filetype indent on
syntax on

if has('termguicolors')
	set termguicolors
endif

let g:sonokai_style = 'default'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
let g:sonokai_transparent_background = 1

colorscheme sonokai

nnoremap <C-n> gt
nnoremap <C-p> gT

hi Normal guibg=#000
hi CursorLine term=NONE cterm=NONE guibg=#222222

hi CursorLineNr cterm=NONE

highlight LineNr guifg=#888888

let g:coc_global_extensions = [
  \ 'coc-tsserver',
	\ 'coc-css',
	\ 'coc-html',
	\ 'coc-emmet',
	\ 'coc-json',
	\ 'coc-eslint',
	\ 'coc-prettier'
  \ ]


" ---

nnoremap <C-f> :Files <CR>

"open terminal
tnoremap <Esc> <C-\><C-n>

au BufEnter * if &buftype == 'terminal' | :startinsert | endif

function! OpenTerminal()
  split term://bash
  resize 10
endfunction

nnoremap <c-t> :call OpenTerminal()<CR>

nnoremap <C-s-i> :Prettier <CR><ESC>

let g:coc_disable_startup_warning = 1

nnoremap <silent> K :call CocAction('doHover')<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

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
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call CocAction('doHover')<CR>
nnoremap <silent> B :Buffers <CR>

