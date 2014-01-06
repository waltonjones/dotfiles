" .vimrc

" Vundle and bundles configuration
source bundles.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'https://github.com/altercation/vim-colors-solarized.git'


set clipboard=unnamed
set number                " show line numbers
set laststatus=2          " last window always has a statusline
filetype indent on        " activates indenting for files
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom (including cursor position).
set autoindent            " auto-indent
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse
set mouse=a                " Mouse for scrolling
set mousehide              " Hides the mouse when typing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Yank text to the OS X clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <Leader>y "*y
noremap <Leader>yy "*Y


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Preserve indentation while pasting text from the OS X clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open markdown in marked
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <Leader>m <ESC>:!open -a Marked.app "%"<CR><CR>
nmap <Leader>m :!open -a Marked.app "%"<CR><CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use hjkl!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <Up>     :echo "No"<cr>
noremap <Down>   :echo "No"<cr>
noremap <Left>   :echo "No"<cr>
noremap <Right>  :echo "No"<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" WordProcessor Mode (http://www.drbunsen.org/writing-in-vim/)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! WordProcessorMode() 
  set textwidth=74
  set formatoptions=t1
  set foldcolumn=10
  set columns=100
  setlocal noexpandtab
  " map j gj 
  " map k gk
  setlocal spell spelllang=en_us 
  set complete+=s
  set formatprg=par
  setlocal wrap 
  setlocal linebreak 
endfu 
com! WP call WordProcessorMode()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Solarized Color Scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256               " enable 256-color mode.
syntax enable              " enable syntax highlighting (previously syntax on).
set background=light
call togglebg#map("<F5>")  " toggle color between light and dark
colorscheme solarized      " set colorscheme