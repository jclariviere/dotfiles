set nocompatible   " Disable vi-compatibility

" Plugins {{{
try
    call plug#begin()

    Plug 'flazz/vim-colorschemes'
    Plug 'altercation/vim-colors-solarized'

    Plug 'ciaranm/securemodelines'

    Plug 'mbbill/undotree'
    nnoremap <leader>u :UndotreeToggle<CR>
    let g:undotree_SetFocusWhenToggle=1
    let g:undotree_WindowLayout=2

    Plug 'jmcantrell/vim-diffchanges'
    nnoremap <leader>d :DiffChangesDiffToggle<CR>

    Plug 'scrooloose/nerdcommenter'

    Plug 'scrooloose/nerdtree'
    nnoremap <C-n> :NERDTreeToggle<CR>

    Plug 'tpope/vim-eunuch'

    Plug 'tpope/vim-surround'

    Plug 'tpope/vim-unimpaired'

    Plug 'tpope/vim-fugitive'

    Plug 'ntpeters/vim-better-whitespace'

    Plug 'itchyny/lightline.vim'
    let g:lightline = {
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ],
          \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
          \   'right': [ [ 'lineinfo' ],
          \              [ 'percent' , 'lineposition' ],
          \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
          \ },
          \ 'component': {
          \   'lineposition': "%{line('.') . '/' . line('$')}",
          \ },
          \ 'component_function': {
          \   'gitbranch': 'fugitive#head'
          \ },
          \ }
    set noshowmode   " Already shown by lightline's status bar

    " Other plugins
    runtime! plugs/*.vim

    call plug#end()

    " Colorscheme. Must be set after plug#end()
    if has('gui_running')
        " Solarized is nice but requires some setup on the terminal emulator
        " side, so only use it in gvim
        let g:solarized_italic=0
        set background=dark
        colorscheme solarized
        call togglebg#map("<F5>") " Toggle between solarized light and dark
    else
        colorscheme badwolf
    endif

catch /E117:/ " E117: Unknown function: plug#begin
    echo "vim-plug not installed. To install:"
    echo "curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    echo "vim +PlugInstall +qall (or :PlugInstall from inside vim)\n"
catch
    " All other exceptions, show the error message
    echo "Error in " . v:throwpoint
    echo v:exception
endtry
" }}}


" General settings {{{
" Already set by plug#end() but set anyway in case vim-plug is not installed
filetype plugin indent on " Enable filetype detection
syntax enable " Syntax highlighting

set showcmd        " Show (partial) command in status line
set showmatch      " Show matching brackets
set mouse=a        " Enable mouse usage (all modes)
set number         " Display line numbers
set laststatus=2   " Always show statusline
set nomodeline     " Disable built-in modelines for security, use securemodelines plugin instead
set wildmenu       " Visual autocomplete for command menu
set wildmode=longest:full,full " Better autocomplete behavior
set belloff=all    " Disable the annoying beep sounds
set ttimeoutlen=50 " Lower timeout for key codes
set diffopt+=vertical " Vertical split in diff mode
set backspace=indent,eol,start " More powerful backspacing

" Search
set incsearch      " Incremental search
set ignorecase     " Case insensitive matching
set smartcase      " Smart case matching
set hlsearch       " Highlight all matches in a file when searching

" Tabs / Indentation
set expandtab      " Insert space when tab pressed
set tabstop=4      " Number of space inserted when tab pressed
set shiftwidth=4   " Number of space for indentation
set smarttab       " See :help smarttab
autocmd Filetype ruby setlocal ts=2 sw=2   " Ruby 2 spaces instead of 4

" Folding
set foldenable          " Enable folding
set foldmethod=indent   " Fold based on indent level
set foldlevelstart=10   " Open most folds by default
set foldnestmax=10      " 10 nested folds max

" Buffer options
set hidden              " Hide buffers when they are abandoned
set switchbuf=useopen   " Consider open windows when using commands like :sb
" }}}


" General key bindings {{{
" Toggle paste mode
set pastetoggle=<F3>

" Make Y behave like D and C (synonym for y$ instead of yy)
nnoremap Y y$

" Clear highlighting and redraw screen
nnoremap <C-L> :noh<CR><C-L>

" Toggle folds
nnoremap <space> za

" Execute the text from cursor to end of line and insert result below
nnoremap <F6> y$:r !<c-r>"<CR>

" Execute selection and insert result below
vnoremap <F6> y:r !<c-r>"<CR>

" Fix for tmux: http://unix.stackexchange.com/a/34723
if &term =~ '^screen'
    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
" }}}


" vim: foldmethod=marker
