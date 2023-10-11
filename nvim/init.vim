syntax on
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set smartcase
set noswapfile
set nobackup
set incsearch
set cursorline
set showmatch
set hidden
set scrolloff=10
set textwidth=80
set backspace=indent,eol,start
set ttimeoutlen=50
set tw=79

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'junegunn/goyo.vim'
Plug 'prisma/vim-prisma'
call plug#end()

set termguicolors
set t_Co=256
set background=dark

colorscheme gruvbox

set clipboard=unnamed


let mapleader = ","

"FZF
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" hide Gfiles preview
autocmd VimEnter * command! -bang -nargs=? GFiles call fzf#vim#gitfiles(<q-args>, {'options': '--no-preview'}, <bang>0)

nnoremap <leader>t :GFiles<CR>
nnoremap <leader>b :Buffers<CR>

nnoremap <silent> <leader>d :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>

vnoremap < <gv
vnoremap > >gv

nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>gb :Git blame<CR>

nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

let g:powerline_pycmd="py3"

set laststatus=2

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tablinefnamemod = ':t'
let g:airline_theme='gruvbox'
let g:airline#extensions#nvimlsp#enabled=0

let g:user_emmet_mode='i'
let g:user_emmet_leader_key='cc'

let g:goyo_height='95%'

let NERDTreeShowHidden=1
augroup Markdown
  autocmd!
  autocmd FileType markdown set wrap
augroup END

hi Normal guibg=NONE ctermbg=NONE

" hide line numbers
noremap <leader>r :set invnumber<CR>

" Markdown wrap
au BufRead,BufNewFile *.md setlocal textwidth=80

""""""""""""""
" CoC Config
""""""""""""""
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
