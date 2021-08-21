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
	Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'

	Plug 'maxmellon/vim-jsx-pretty'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
call plug#end()

set nu
set rnu
set nowrap
set mouse=
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
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call CocAction('doHover')<CR>
nnoremap <silent> B :Buffers <CR>

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1

let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

let g:closetag_shortcut = '>'

hi Normal guibg=NONE ctermbg=NONE guibg=NONE
hi CursorLine term=NONE cterm=NONE guibg=#232e22

hi CursorLineNr cterm=NONE

highlight LineNr guifg=#0BFF00

