" Turn off Vi compatibility
set nocompatible

" Use filetype auto-detection
filetype off

" Security issue
set modelines=0

" Plugin management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'https://github.com/altercation/vim-colors-solarized.git'
Plugin 'https://github.com/junegunn/goyo.vim.git'
Plugin 'https://github.com/tpope/vim-markdown.git'
Plugin 'beloglazov/vim-online-thesaurus'
Plugin 'scrooloose/nerdcommenter'
Plugin 'davidbeckingsale/writegood.vim'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'sjl/gundo.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'terryma/vim-expand-region'
Plugin 'SirVer/ultisnips'
Plugin 'vimoutliner/vimoutliner'
Plugin 'godlygeek/tabular'
Plugin 'sheerun/vim-polyglot'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" ctlp.vim settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key mapping to invoke ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Settings for working directory
let g:ctrlp_working_path_mode = 0

" Ignore files and directories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Use find instead of Vim's globpath() and speed up for git projects
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

" Open files with Leader o
nnoremap <Leader>o :CtrlP<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



" Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable welcome message
set shortmess+=I

" Remap leader
let mapleader = "\<Space>"

" Set default encoding
set encoding=utf-8

" Adjusting the menu shown for command auto-completion
set wildmenu
set wildmode=list:longest,full

" Create undofiles so undo works across sessions
set undofile

" Show relative line numbers everywhere except cursor line
set number
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

" Save document when window loses focus
au FocusLost * :wa

" Enable filetype plugins
filetype plugin indent on

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




" Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fixes the weird delay when exiting Insert mode
set timeoutlen=500
set ttimeoutlen=10
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Tabular
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

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

" Gundo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F1> :GundoToggle<CR>

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
" Open current file in Marked 2
nmap <leader>m :!open -a Marked\ 2.app "%"<CR><CR>

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
        WritegoodToggle
    else
        set formatoptions=n1
        set linebreak nolist
        set spell spelllang=en
        set formatprg=par
        let g:wp_mode_is_on = 1
        WritegoodToggle
    endif
endfunction
nnoremap <Leader>wp :call ToggleWPMode()<CR>
nnoremap <Leader>g :Goyo<CR>:call ToggleWPMode()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap usage of vim-expand-region
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Crazy combos to make things easier
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open vimrc up in a split window for on-the-fly changes
nnoremap <leader>ev :tabe $MYVIMRC<CR>

" Save file with leader s
nnoremap <Leader>s :w<CR>

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

" Automatically move to end of the pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Quickly select text you just pasted
noremap gV `[v`]

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

set guifont=Inconsolata-dz\ for\ Powerline:h15
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

