set nocompatible               " be iMproved
filetype off                   " required!


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'https://github.com/altercation/vim-colors-solarized.git'
Bundle 'https://github.com/junegunn/goyo.vim.git'
Bundle 'https://github.com/amix/vim-zenroom2.git'
Bundle 'https://github.com/tpope/vim-markdown.git'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" show line numbers
set number

" last window always has a statusline
set laststatus=2

" activates indenting for files
filetype indent on

" Don't continue to highlight searched phrases.
set nohlsearch

" But do highlight as you type your search.
set incsearch

" Make searches case-insensitive.
set ignorecase

" Always show info along bottom (including cursor position).
set ruler

" auto-indent
set autoindent

" tab spacing
set tabstop=4

" unify
set softtabstop=4

" indent/outdent by 4 columns
set shiftwidth=4

" always indent/outdent to the nearest tabstop
set shiftround

" use spaces instead of tabs
set expandtab

" use tabs at the start of a line, spaces elsewhere
set smarttab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse
set mouse=a                " Mouse for scrolling
set mousehide              " Hides the mouse when typing


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Yank text to the OS X clipboard
noremap <Leader>y "*y
noremap <Leader>yy "*Y


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open markdown in marked
imap <leader>m <ESC>:!open -a Marked.app "%"<CR><CR>
nmap <leader>m :!open -a Marked.app "%"<CR><CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" WordProcessor Mode / Goyo
let g:goyo_width=70

let g:wp_mode_is_on = 0

function! ToggleWPMode()
    if g:wp_mode_is_on
        set formatoptions=tcq
        set nowrap nolinebreak expandtab
        silent! nunmap <buffer> k
        silent! nunmap <buffer> j
        silent! nunmap <buffer> 0
        silent! nunmap <buffer> $
        silent! iunmap <buffer> k
        silent! iunmap <buffer> j
        silent! iunmap <buffer> 0
        silent! iunmap <buffer> $
        let g:wp_mode_is_on = 0
    else
        set formatoptions=ant1
        noremap k gk
        noremap j gj
        noremap 0 g0
        noremap $ g$
        set wrap linebreak nolist noexpandtab
        set formatprg=par
        set spell spelllang=en_us
        let g:wp_mode_is_on = 1
    endif
endfunction

nnoremap <Leader>g :Goyo<CR>:call ToggleWPMode()<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Solarized Color Scheme
set t_Co=256               " enable 256-color mode.
set background=light
syntax enable
call togglebg#map("<F5>")  " toggle color between light and dark
colorscheme solarized      " set colorscheme