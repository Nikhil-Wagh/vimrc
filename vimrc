" TODO
" - Color of tabline in sync with bottom bar
" - Copy the word to clipboard - quickly
" - bookmarks and a quick way to toggle them and cycle between them
" - Show which function or class I'm in

call plug#begin('/Users/xenocide/.vim/autoload')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdcommenter'

Plug 'tpope/vim-surround'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'valloric/youcompleteme'
" Check if this is working properly
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'morhetz/gruvbox'
Plug 'ntpeters/vim-better-whitespace'

Plug 'jremmen/vim-ripgrep'

Plug 'haya14busa/is.vim'

" Git and Github
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

call plug#end()

"""""""""""""""""""""""""""""""""""""""
"            Custom Settings          "
"""""""""""""""""""""""""""""""""""""""

syntax on

set guicursor=
set relativenumber
set hlsearch
" set hidden
set noerrorbells
" set tab width 2
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
" I want the wrapping
" set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set showmatch
" set noshowmode
set completeopt=menuone,noinsert,noselect

" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


" set line numbers
set number relativenumber

" highlight current line
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

" set background colour for gruvbox
let g:gruvbox_termcolors=16

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

colorscheme gruvbox
set background=dark


" Ripgrep
if executable('rg')
  let g:rg_derive_root='true'
endif

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always --smart-case " .
  \ <q-args>, 1, fzf#vim#with_preview(), <bang>0)

" Silver Searcher
" if executable('ag')
  " let g:ctrlp_use_caching = 0
" endif

let loaded_matchparen = 1
let mapleader = " "


" vim-airline customizations
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'dark'
set ttimeoutlen=0

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"""""""""""""""""""""""""""""""""""""""
"             Mappings                "
"""""""""""""""""""""""""""""""""""""""

" FZF Mapping
nnoremap <silent> <C-p> :FZF<CR>

" RipGrep search
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>

" Move between splits
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Press * to search for the term and then 'r' to replace
" each occurence of that word
nnoremap <leader>r :s///g<left><left>

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>


" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>


augroup quickfix_tab | au!
  au filetype qf nnoremap <buffer> <C-t> <C-w><CR><C-w>T
augroup END

"""""""""""""""""""""""""""""""""""""""
"            Misc                     "
"""""""""""""""""""""""""""""""""""""""
filetype plugin on

