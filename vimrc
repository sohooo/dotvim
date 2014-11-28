" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
" sohooo
"
" }

" Environment {
set nocompatible              " be iMproved, required
filetype off                  " required

" set clean, default 'runtimepath' (without ~/.vim folders)
let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)

" what is the name of the directory containing this file?
" The usage is: vim -u /path/to/portable/vim/.vimrc
let s:portable = expand('<sfile>:p:h')

" add the directory to 'runtimepath'
let &runtimepath = printf('%s,%s,%s/after,%s/bundle/neobundle.vim', s:portable, &runtimepath, s:portable, s:portable)
" }

" Plugins {
" Plugins managed by NeoBundle: https://github.com/Shougo/neobundle.vim
" Tell NeoBundle where to put plugins: /path_of_this_file/bundle
call neobundle#begin(printf('%s/bundle', s:portable))

" General
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'tpope/vim-surround'         "quoting/parenthesizing made simple
NeoBundle 'tpope/vim-repeat'           "enable repeating supported plugin

" Navigation
NeoBundle 'scrooloose/nerdtree'        "a tree explorer plugin for vim
NeoBundle 'jistr/vim-nerdtree-tabs'    "NERDTree and tabs together in Vim, painlessly
NeoBundle 'kien/ctrlp.vim'             "Fuzzy file, buffer, mru, tag, etc finder
"NeoBundle 'mhinz/vim-startify'        "fancy start screen for Vim
NeoBundle 'mileszs/ack.vim'            "plugin for the Perl module / CLI script 'ack'

" Helpers, Display
NeoBundle 'tpope/vim-fugitive'         "a Git wrapper so awesome, it should be illegal
NeoBundle 'scrooloose/syntastic'       "Syntax checking hacks for vim
NeoBundle 'tomtom/tcomment_vim'        "An extensible & universal comment vim-plugin
NeoBundle 'bling/vim-airline'          "lean & mean status/tabline for vim
NeoBundle 'tpope/vim-endwise'          "wisely add 'end' in ruby, etc
NeoBundle 'tpope/vim-unimpaired'       "pairs of handy bracket mappings

" Languages
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'nelstrom/vim-markdown-folding'
NeoBundle 'tpope/vim-haml'
NeoBundle 'othree/html5.vim'
NeoBundle 'groenewege/vim-less'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'elzr/vim-json'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'hdima/python-syntax'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'timcharper/textile.vim'
NeoBundle 'chase/vim-ansible-yaml'

" Colorschemes
NeoBundle 'tomasr/molokai'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'jasonlong/lavalamp'


" All of your Plugins must be added before the following line
call neobundle#end()         " required
filetype plugin indent on    " required

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }


" Regular Vim Config {

    " Color {
        set background=dark

        " Conditionally Set colorscheme
        if has('unix') && !has('gui_macvim')
          if $TERM == 'xterm-256color'
            colorscheme molokai
            "colorscheme ir_black_mod
          else
            let g:CSApprox_verbose_level=0
            colorscheme slate
          endif
        else
          colorscheme molokai
          "colorscheme ir_black_mod
        endif
    " }


    " Backups {
        set backup
        set backupdir=~/.vim/backup
        set directory=~/.vim/tmp
        set noswapfile
    " }

    " UI {
        set ruler              " Ruler on
        set number             " Line numbers on
        set laststatus=2       " Always show the statusline
        set cmdheight=2
        set notitle            " set terminal's title
        set scrolloff=3        " show 3 lines of context around cursor
        set showmode           " display mode you're in
        set wrap               " turn on line wrapping
        set numberwidth=5      " width of line numbers
        set antialias          " MacVim: smooth fonts
        set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
        set showbreak=↪
        set fillchars=diff:⣿,vert:│
    " }

    " Behaviors {
        syntax enable
        set autoread           " Automatically reload changes if detected
        set wildmenu           " Turn on WiLd menu
        set hidden             " Change buffer - without saving
        set history=768        " Number of things to remember in history.
        set cf                 " Enable error files & error jumping.
        set clipboard+=unnamed " Yanks go on clipboard instead.
        set autowrite          " Writes on make/shell commands
        set timeoutlen=250     " Time to wait for a command (after leader for example)
        set foldlevelstart=99  " Remove folds
        set formatoptions=crql

        set ignorecase         " Case insensitive search
        set smartcase          " Non-case sensitive search
        set incsearch
        set hlsearch

        set showmatch          " Show matching brackets.
        set matchtime=2        " How many tenths of a second to blink

        " Highlight VCS conflict markers
        match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

        set noerrorbells
        set visualbell         "disables beep in macvim
        set t_vb=

        set mousehide  " Hide mouse after chars typed
        set mouse=a  " Mouse in all modes

        " Better complete options to speed it up
        set complete=.,w,b,u,U
    " }

    " Text Format {
        set tabstop=2
        set backspace=2 " Delete everything with backspace
        set shiftwidth=2  " Tabs under smart indent
        set cindent
        set autoindent
        set smarttab
        set expandtab
        set backspace=2
    " }

    " Bindings {
        let mapleader=","
        nmap <silent> <leader>s :set spell!<CR>
        nmap <silent> <leader>vim :e <sfile><CR>
        nmap <leader>u :syntax sync fromstart<cr>:redraw!<cr>

        " Window Movement
        nmap <silent> <C-h> :wincmd h<CR>
        nmap <silent> <C-j> :wincmd j<CR>
        nmap <silent> <C-k> :wincmd k<CR>
        nmap <silent> <C-l> :wincmd l<CR>

        " Fixes common typos
        command W w
        command Wq wq
        command Q q
        map <F1> <Esc>
        imap <F1> <Esc>

        " remap escape; this rox
        imap jj <Esc>
        " Make line completion easier
        imap <C-l> <C-x><C-l>

        " Keep the cursor in place while joining limes
        nnoremap J mzJ`z
        " Keep search matches in the middle of the window.
        nnoremap n nzzzv
        nnoremap N Nzzzv
        " Same when jumping around
        nnoremap g; g;zz
        nnoremap g, g,zz

        " toggle paste mode on/off
        map <F9> :set paste!<cr>:set paste?<cr>
        " toggle line numbers
        map <F10> :set number!<cr>:set number?<cr>

        " easy tab switching
        nmap tt :tabnext<cr>
        map  tt :tabnext<cr>
        nmap <C-t> :tabnew<cr>
        imap <C-t> <Esc>:tabnew<cr>

        " same indent behaviour in visual mode
        vmap > >gv
        vmap < <gv
        " make Y behave like other capitals
        map Y y$

        " improve up/down movement on wrapped lines
        nnoremap j gj
        nnoremap k gk

        " force saving files that require root permission
        cmap w!! %!sudo tee > /dev/null %
    " }

" }


" Plugin Settings {

    " NERDTree {
        nnoremap <leader>d :NERDTreeToggle<CR>
    "}


    " Ctrl-P {
        let g:ctrlp_working_path_mode = 'ra'
        nnoremap <leader>f :CtrlPMixed<CR>
        " nnoremap <leader>r :CtrlPMRU<CR>

        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

        if executable('ack')
            let s:ctrlp_fallback = 'ack %s --nocolor -f'
        else
            let s:ctrlp_fallback = 'find %s -type f'
        endif
    "}

" }
