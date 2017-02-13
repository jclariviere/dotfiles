" Plugins {{{
set nocompatible   " Disable vi-compatibility. On top as required by Vundle
filetype off       " Required by Vundle, will be enabled later

try
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    Plugin 'gmarik/Vundle.vim'

    " ----- General -----
    Plugin 'flazz/vim-colorschemes'
    Plugin 'altercation/vim-colors-solarized'

    Plugin 'ciaranm/securemodelines'

    Plugin 'mbbill/undotree'
    nnoremap <leader>u :UndotreeToggle<CR>
    let g:undotree_SetFocusWhenToggle=1
    let g:undotree_WindowLayout=2

    Plugin 'jmcantrell/vim-diffchanges'
    nnoremap <leader>d :DiffChangesDiffToggle<CR>

    Plugin 'scrooloose/nerdcommenter'

    Plugin 'scrooloose/nerdtree'
    nnoremap <C-n> :NERDTreeToggle<CR>

    Plugin 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = "context"

    Plugin 'tpope/vim-surround'

    Plugin 'tpope/vim-unimpaired'

    Plugin 'tpope/vim-fugitive'

    Plugin 'ntpeters/vim-better-whitespace'

    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    set noshowmode   " Already shown by airline's status bar

    " ----- Python -----
    "Plugin 'davidhalter/jedi-vim'
    "Plugin 'klen/python-mode'

    call vundle#end()

    " Colorscheme. Must be set after vundle#end()
    if has('gui_running')
        " Solarized is nice but requires some setup on the terminal emulator
        " side, so only use it in gvim
        set background=dark
        colorscheme solarized
        call togglebg#map("<F5>") " Toggle between solarized light and dark
    else
        colorscheme badwolf
    endif

catch /E117:/ " E117: Unknown function: vundle#begin
    echo "Vundle not installed. To install:"
    echo "git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim"
    echo "vim +PluginInstall +qall (or :PluginInstall from inside vim)\n"
catch
    " All other exceptions, show the error message
    echo "Error in " . v:throwpoint
    echo v:exception
endtry

" Required by Vundle, but should be enabled even if Vundle is not installed
filetype plugin indent on
" }}}


" General settings {{{
syntax enable      " Syntax highlighting
set showcmd        " Show (partial) command in status line
set showmatch      " Show matching brackets
set mouse=a        " Enable mouse usage (all modes)
set number         " Display line numbers
set laststatus=2   " Always show statusline
set nomodeline     " Disable built-in modelines for security, use securemodelines plugin instead
set wildmenu       " Visual autocomplete for command menu
set belloff=all    " Disable the annoying beep sounds
set ttimeoutlen=50 " Lower timeout for key codes
set diffopt+=vertical " Vertical split in diff mode
set backspace=indent,eol,start	" More powerful backspacing

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

" Make Y behave like D (synonym for y$ instead of yy)
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
