" Compiled by Jonas Stenling from a number of sources on the interwebs.
"
" great pages about your .vimrc
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/ -- google his vimrc
" http://naleid.com/blog/2010/10/04/vim-movement-shortcuts-wallpaper
" https://github.com/s3rvac/dotfiles/blob/master/vim/.vimrc -- crazy long
"
" use pathogen for plugin handling
execute pathogen#infect()
" disable vi compatibility
set nocompatible
" autocmds
" set tabs for yaml
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
" automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
" enable switching between buffers with changes not written
set hidden
" various defaults from http://http://stevelosh.com/blog/2010/09/coming-home-to-vim/
set scrolloff=3
set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set noruler
set backspace=indent,eol,start
set relativenumber
set nobackup
set nowritebackup
set noswapfile
set history=700
set undolevels=700

" set 256 color mode
set t_Co=256
" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=23
au InsertLeave * match ExtraWhitespace /\s\+$/
colorscheme wombat256mod

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing

" tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" indenting
set autoindent          " Indent a new line according to the previous one.
set copyindent          " Copy (exact) indention from the previous line.
set nopreserveindent    " Do not try to preserve indention when indenting.
set nosmartindent       " Turn off smartindent.
set nocindent           " Turn off C-style indent.

" show tabs so tabs/spaces mixing is easy to spot
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

" comment handling
set fo+=q               " Allow formatting of comments with "gq".
set fo-=r fo-=o         " Turn off automatic insertion of comment characters.
set fo+=j               " Remove a comment leader when joining comment lines.

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamedplus

" Make searching better
set ignorecase    " case insensitive searching (unless specified)
set smartcase     " use case sensitive search if there is capital letter
set incsearch     " search incrementally as you type search string
set showmatch     "
set hlsearch      " highlight search matches

" splitting
set splitright "split to the right instead of left
set splitbelow "split below instead of above

" Mouse and backspace
set mouse=a  " on OSX press ALT and click

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

set colorcolumn=80
highlight ColorColumn ctermbg=233
" key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map K to help for current word
nnoremap K :help <C-r><C-w><CR>
" make D and Y to the same as C
nnoremap D d$
nnoremap Y y$

" Don't move on *
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" make window resizing easier
noremap <silent> < <C-W><
noremap <silent> > <C-W>>
noremap <silent> + <C-W>+
noremap <silent> - <C-W>-

" Rebind <Leader> key
let mapleader = ","
" leader macros
noremap <Leader>W :%s/\s\+$//<cr>:let @/=''<CR> " delete trailing whitespace
vnoremap <Leader>s :sort<CR> " map sort function to a key

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <silent> <Space> :nohl<CR>

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" unbind arrow keys for navigation
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" settings for Nerdtree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right" " move nerdtree to the right

" vim-airline settings
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''
let g:airline_powerline_fonts = 1

" Settings for jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#use_splits_not_buffers = "right"
