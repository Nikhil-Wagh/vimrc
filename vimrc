" TODO
" - Color of tabline in sync with bottom bar
" - Copy the word to clipboard - quickly
" - Show which function or class I'm in
" - Fix coc.nvim

call plug#begin('/Users/xenocide/.vim/autoload')

set rtp+=/usr/local/opt/fzf

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdcommenter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Autocomplete
" Closes fzf preview window for some reason
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Valloric/YouCompleteMe'

" Colors
Plug 'morhetz/gruvbox'
Plug 'pineapplegiant/spaceduck'

Plug 'ntpeters/vim-better-whitespace'

Plug 'haya14busa/is.vim'

" Git and Github
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Better syntax highlighting
Plug 'sheerun/vim-polyglot'
call plug#end()

"""""""""""""""""""""""""""""""""""""""
"            Custom Settings          "
"""""""""""""""""""""""""""""""""""""""

syntax on

set guicursor=
set relativenumber
set hlsearch
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set showmatch
set completeopt=menuone,noinsert,noselect
set hidden
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


" set line numbers
set number relativenumber

" highlight current line
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

" set background colour for gruvbox
let g:gruvbox_termcolors=256
colorscheme gruvbox
set background=dark

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Ripgrep
if executable('rg')
  let g:rg_derive_root='true'
  let g:rg_highlight='true'
endif

" ---------------  FZF Settings   ------------------
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
let g:fzf_preview_window = 'down:70%'

" - Popup window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse',
  \ '--info=inline', '--preview', '~/.vim/autoload/fzf.vim/bin/preview.sh {}']},
  \ <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ 'rg --column --line-number --color=always --smart-case '
  \ .shellescape(<q-args>), 1,
  \ fzf#vim#with_preview(), <bang>0)
" ---------------  FZF Settings   ------------------

let loaded_matchparen = 1
let mapleader = " "


" vim-airline customizations
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'dark'
set ttimeoutlen=0

"""""""""""""""""""""""""""""""""""""""
"             Mappings                "
"""""""""""""""""""""""""""""""""""""""

" FZF Mapping
nnoremap <silent> <C-p> :Files<CR>

" RipGrep search
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>

" Move between splits
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>


" Press * to search for the term and then 'ra' to replace
" each occurence of that word in that file
nnoremap <leader>ra :%s///g<left><left>

" Press * to search for the term and then 'r' to replace
" each occurence of that word in that line
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

" Ctrl+p to open fzf, search for your file
" and Ctrl+t to open in new tab
" augroup quickfix_tab | au!
"   au filetype qf nnoremap <buffer> <C-t> <C-w><CR><C-w>T
" augroup END


"""""""""""""""""""""""""""""""""""""""
"            Misc                     "
"""""""""""""""""""""""""""""""""""""""
filetype plugin on

