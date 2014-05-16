" Turn off Vi compatibility
set nocompatible

" Use filetype auto-detection
filetype off

" Security issue
set modelines=0




" Bundle management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'https://github.com/altercation/vim-colors-solarized.git'
Bundle 'https://github.com/junegunn/goyo.vim.git'
Bundle 'https://github.com/tpope/vim-markdown.git'
Bundle 'beloglazov/vim-online-thesaurus'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'davidbeckingsale/writegood.vim'
Bundle 'tommcdo/vim-exchange'
Bundle 'tpope/vim-surround'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""




" Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable welcome message
set shortmess+=I

" Set default encoding
set encoding=utf-8

" Adjusting the menu shown for command auto-completion
set wildmenu
set wildmode=list:longest,full

" Create undofiles so undo works across sessions
set undofile

" Show relative line numbers
set relativenumber

" Wrap long lines
set wrap

" Show invisible characters
set list
set listchars=tab:▸\ ,eol:¬

" No bell sounds
set visualbell

" Fast scrolling
set ttyfast

" Show the line where the cursor is located
set cursorline

" Hide buffers on switching instead of abandoning them
set hidden

" Autoload hidden buffers on change
set autoread

" Make backspace work
set backspace=indent,eol,start

" Map leader key (default was "\")
let mapleader = ","

" Save document when window loses focus
au FocusLost * :wa

" Enable filetype plugins
filetype plugin on

" Stop opening help on accident when going for escape
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""




" Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Always show info along bottom (including cursor position)
set ruler

" Show current mode
set showmode

" Show info on the current command in the status bar
set showcmd
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""





" Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase

" Use Python/Perl-style regex when searching
nnoremap / /\v
vnoremap / /\v

" Unless the search term has capital letters
set smartcase

" Global search and replace by default; use s/a/b/g to override
set gdefault

" Start searching as soon as text is typed
set incsearch

" Jump back to matching bracket briefly when closing one is inserted. 
set showmatch

" Auto-scrolls so at least 3 lines are visible around each search result
set scrolloff=3

" Highlight search results
set hlsearch

" Can be annoying, so leader+space will clear it.
nnoremap <leader><space> :noh<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""





" Tabs/Indenting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-indent (copies previous line's indentation when starting a new line)
set autoindent

" Activates indenting for files
filetype indent on

" tab spacing
set tabstop=4

" unify
set softtabstop=4

" Indent/outdent by 4 columns
set shiftwidth=4

" Always indent/outdent to the nearest tabstop
set shiftround

" Tab inserts spaces instead of tabs
set expandtab

" use tabs at the start of a line, spaces elsewhere
set smarttab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""





" Disable arrow keys and allow proper maneuvering over visual lines rather
" than actual lines
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
noremap k gk
noremap j gj
noremap 0 g0
noremap $ g$
vnoremap j gj
vnoremap k gk
vnoremap 0 g0
vnoremap $ g$
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""





" Mouse settings (allows for scrolling with the mouse or trackpad)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse for scrolling
set mouse=a

" Hides the mouse when typing
set mousehide
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""





" OS X Clipboard settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Yank text to the OS X clipboard (for use in Terminal Vim)
noremap <Leader>y "*y
noremap <Leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Use the OS clipboard in MacVim by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""





" Settings for writing prose/markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open markdown in marked
imap <leader>m <ESC>:!open -a Marked.app "%"<CR><CR>
nmap <leader>m :!open -a Marked.app "%"<CR><CR>

" WordProcessor Mode / Goyo
let g:goyo_width=70
let g:goyo_margin_top=0
let g:goyo_margin_bottom=0
let g:wp_mode_is_on = 0

function! ToggleWPMode()
    if g:wp_mode_is_on
        set nolinebreak
        set list
        set nospell
        set formatprg=""
        let g:wp_mode_is_on = 0
        silent !WritegoodDisable
    else
        set formatoptions=n1
        set linebreak nolist
        set spell spelllang=en_us
        set formatprg=par
        let g:wp_mode_is_on = 1
        WritegoodEnable
    endif
endfunction
nnoremap <Leader>wp :call ToggleWPMode()<CR>
nnoremap <Leader>g :Goyo<CR>:call ToggleWPMode()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""





" Crazy combos to make things easier
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open vimrc up in a split window for on-the-fly changes
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Double j's in insert mode returns to normal mode
inoremap jj <ESC>

" Re-hardwrap paragraphs with leader-q
nnoremap <leader>q gqip

" Open a split window and go there
nnoremap <leader>w <C-w>v<C-w>l

" Moving around split windows (^hjkl)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Toggle comments with Nerdcommenter from normal mode
map <leader>/ <plug>NERDCommenterToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""





" Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set Solarized Color Scheme
colorscheme solarized

" enable 256-color mode
set t_Co=256

"Default to the light version of Solarized
set background=light

"Turn on syntax highlighting
syntax enable

" Use F5 to toggle between light and dark solarized versions
call togglebg#map("<F5>")

" Set the GUI font for MacVim
:set guifont=Inconsolata-dz:h15
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
