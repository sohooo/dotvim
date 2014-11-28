" =========================================
" Who:   Sven Sporer | sohooo
" Where: https://github.com/sohooo/dotvim
" =========================================
" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0

" intro and credits {{{
"
" This is a refresh of my dotfiles from https://github.com/sohooo/vimfiles
" It is designed to be fully portable. This vimrc can be placed anywhere.
" Put NeoBundle in the same directory under bundles/neobundle.vim, and you're done.
" The setup is also heavily inspired by the following configurations:
"   - https://github.com/bling/dotvim
"   - https://github.com/spf13/spf13-vim
"
" }}}

" environment & neobundle {{{
  set nocompatible              " be iMproved, required
  filetype off                  " required

  " set clean, default 'runtimepath' (without ~/.vim folders)
  let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)

  " what is the name of the directory containing this file?
  " The usage is: vim -u /path/to/portable/vim/.vimrc
  let s:portable = expand('<sfile>:p:h')

  " add the directory to 'runtimepath'
  let &runtimepath = printf('%s,%s,%s/after,%s/bundle/neobundle.vim', s:portable, &runtimepath, s:portable, s:portable)

  " Plugins managed by NeoBundle: https://github.com/Shougo/neobundle.vim
  " Tell NeoBundle where to put plugins: /path_of_this_file/bundle
  call neobundle#begin(printf('%s/bundle', s:portable))

  NeoBundleFetch 'Shougo/neobundle.vim'
" }}}

" detect OS {{{
  let s:is_windows = has('win32') || has('win64')
  let s:is_cygwin = has('win32unix')
  let s:is_macvim = has('gui_macvim')
" }}}

" common options {{{
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

  set nobackup
  set noswapfile

  if has('conceal')
    set conceallevel=1
    set listchars+=conceal:Δ
  endif

  if s:is_macvim
    set guifont=Sauce\ Code\ Powerline:h13
    set transparency=2

    " Hide Toolbar in MacVim
    if has("gui_running")
      set guioptions=egmrt
    endif

  endif

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

  set noerrorbells
  set visualbell         "disables beep in macvim
  set t_vb=

  set mousehide  " Hide mouse after chars typed
  set mouse=a  " Mouse in all modes

  " Better complete options to speed it up
  set complete=.,w,b,u,U

  set tabstop=2
  set backspace=2 " Delete everything with backspace
  set shiftwidth=2  " Tabs under smart indent
  set cindent
  set autoindent
  set smarttab
  set expandtab
  set backspace=2
" }}}

" bindings {{{
  let mapleader=","
  nmap <silent> <leader>s :set spell!<CR>
  nmap <silent> <leader>vim :e <sfile><CR>
  nmap <leader>u :syntax sync fromstart<cr>:redraw!<cr>

  " window movement
  nmap <silent> <C-h> :wincmd h<CR>
  nmap <silent> <C-j> :wincmd j<CR>
  nmap <silent> <C-k> :wincmd k<CR>
  nmap <silent> <C-l> :wincmd l<CR>

  " fixes common typos
  command W w
  command Wq wq
  command Q q
  map <F1> <Esc>
  imap <F1> <Esc>

  " remap escape; this rox
  imap jj <Esc>
  " Make line completion easier
  imap <C-l> <C-x><C-l>

  " keep the cursor in place while joining limes
  nnoremap J mzJ`z
  " keep search matches in the middle of the window.
  nnoremap n nzzzv
  nnoremap N Nzzzv
  " same when jumping around
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
"}}}

NeoBundle 'tpope/vim-surround'         "quoting/parenthesizing made simple
NeoBundle 'tpope/vim-repeat'           "enable repeating supported plugin
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build': {
        \ 'mac': 'make -f make_mac.mak',
        \ 'unix': 'make -f make_unix.mak',
        \ 'cygwin': 'make -f make_cygwin.mak',
        \ 'windows': '"C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\bin\nmake.exe" make_msvc32.mak',
      \ },
    \ }

" Navigation
"NeoBundle 'mhinz/vim-startify'        "fancy start screen for Vim

" Helpers, Display
NeoBundle 'tpope/vim-fugitive'         "a Git wrapper so awesome, it should be illegal
NeoBundle 'tomtom/tcomment_vim'        "An extensible & universal comment vim-plugin
NeoBundle 'bling/vim-airline'          "lean & mean status/tabline for vim
NeoBundle 'tpope/vim-endwise'          "wisely add 'end' in ruby, etc
NeoBundle 'tpope/vim-unimpaired'       "pairs of handy bracket mappings


NeoBundleLazy 'Shougo/neocomplcache.vim', {'autoload':{'insert':1}} "{{{
  let g:neocomplcache_enable_at_startup=1
  let g:neocomplcache_enable_fuzzy_completion=1
"}}}

NeoBundleLazy 'zhaocai/GoldenView.Vim', {'autoload':{'mappings':['<Plug>ToggleGoldenViewAutoResize']}} "{{{
  let g:goldenview__enable_default_mapping=0
  nmap <leader>v <Plug>ToggleGoldenViewAutoResize
"}}}


" language plugins {{{
  NeoBundleLazy 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}}
  NeoBundleLazy 'maksimr/vim-jsbeautify', {'autoload':{'filetypes':['javascript']}}
  NeoBundleLazy 'leafgarland/typescript-vim', {'autoload':{'filetypes':['typescript']}}
  NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload':{'filetypes':['coffee']}}
  NeoBundleLazy 'mmalecki/vim-node.js', {'autoload':{'filetypes':['javascript']}}
  NeoBundleLazy 'leshill/vim-json', {'autoload':{'filetypes':['javascript','json']}}
  NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {'autoload':{'filetypes':['javascript','coffee','ls','typescript']}}
  NeoBundle 'vim-ruby/vim-ruby'
  NeoBundleLazy 'tpope/vim-markdown', {'autoload':{'filetypes':['markdown']}}
  NeoBundleLazy 'nelstrom/vim-markdown-folding', {'autoload':{'filetypes':['markdown']}}
  NeoBundle 'tpope/vim-haml'
  NeoBundleLazy 'wavded/vim-stylus', {'autoload':{'filetypes':['styl']}}
  NeoBundleLazy 'digitaltoad/vim-jade', {'autoload':{'filetypes':['jade']}}
  NeoBundleLazy 'juvenn/mustache.vim', {'autoload':{'filetypes':['mustache']}}
  NeoBundleLazy 'gregsexton/MatchTag', {'autoload':{'filetypes':['html','xml']}}
  NeoBundleLazy 'othree/html5.vim', {'autoload':{'filetypes':['html']}}
  NeoBundleLazy 'cakebaker/scss-syntax.vim', {'autoload':{'filetypes':['scss','sass']}}
  NeoBundleLazy 'groenewege/vim-less', {'autoload':{'filetypes':['less']}}
  NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload':{'filetypes':['css','scss','sass']}}
  NeoBundleLazy 'ap/vim-css-color', {'autoload':{'filetypes':['css','scss','sass','less','styl']}}
  NeoBundle 'slim-template/vim-slim'
  NeoBundle 'tpope/vim-cucumber'
  NeoBundle 'elzr/vim-json'
  NeoBundle 'thoughtbot/vim-rspec'
  NeoBundle 'hdima/python-syntax'
  NeoBundleLazy 'klen/python-mode', {'autoload':{'filetypes':['python']}}
  NeoBundle 'elixir-lang/vim-elixir'
  NeoBundle 'ekalinin/Dockerfile.vim'
  NeoBundle 'mxw/vim-jsx'
  NeoBundle 'rodjek/vim-puppet'
  NeoBundle 'timcharper/textile.vim'
  NeoBundle 'chase/vim-ansible-yaml'
" }}}

" colorschemes {{{
  NeoBundle 'tomasr/molokai'
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'jasonlong/lavalamp'
" }}}

NeoBundleLazy 'godlygeek/tabular', {'autoload':{'commands':'Tabularize'}} "{{{
  nmap <leader>t= :Tabularize /=<CR>
  vmap <leader>t= :Tabularize /=<CR>
  nmap <leader>t: :Tabularize /:\zs<CR>
  vmap <leader>t: :Tabularize /:\zs<CR>
  nmap <leader>t, :Tabularize /,\zs<CR>
  vmap <leader>t, :Tabularize /,\zs<CR>
  nmap <leader>tt :Tabularize /=>\zs<CR>
  vmap <leader>tt :Tabularize /=>\zs<CR>
"}}}

NeoBundle 'justinmk/vim-sneak' "{{{
  "move to next 'ab' => sab (s modifier)
  let g:sneak#streak = 1
"}}}

NeoBundleLazy 'mbbill/undotree', {'autoload':{'commands':'UndotreeToggle'}} "{{{
  let g:undotree_SplitLocation='botright'
  let g:undotree_SetFocusWhenToggle=1
  nnoremap <leader>u :UndotreeToggle<CR>
"}}}

NeoBundleLazy 'scrooloose/nerdtree', {'autoload':{'commands':['NERDTreeToggle','NERDTreeFind']}} "{{{
  let NERDTreeShowHidden=1
  let NERDTreeQuitOnOpen=0
  let NERDTreeShowLineNumbers=1
  let NERDTreeChDirMode=0
  let NERDTreeShowBookmarks=1
  let NERDTreeIgnore=['\.git','\.hg']
  nnoremap <leader>d :NERDTreeToggle<CR>
  NeoBundle 'jistr/vim-nerdtree-tabs'
"}}}

NeoBundleLazy 'majutsushi/tagbar', {'autoload':{'commands':'TagbarToggle'}} "{{{
  nnoremap <leader>tb :TagbarToggle<CR>
"}}}

NeoBundle 'Shougo/unite.vim' "{{{
  let bundle = neobundle#get('unite.vim')
  function! bundle.hooks.on_source(bundle)
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#filters#sorter_default#use(['sorter_rank'])
    call unite#custom#source('file_rec/async','sorters','sorter_rank', )
    "call unite#custom#source('line,outline','matchers','matcher_fuzzy')
    call unite#custom#profile('default', 'context', {
      \ 'start_insert': 1,
      \ 'direction': 'botright',
      \ })
  endfunction

  " replacing unite with ctrl-p
  let g:unite_enable_start_insert=1
  let g:unite_source_history_yank_enable=1
  let g:unite_prompt='» '
  let g:unite_split_rule = 'botright'
  if executable('ag')
      let g:unite_source_grep_command='ag'
      let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
      let g:unite_source_grep_recursive_opt=''
  endif

  NeoBundleLazy 'Shougo/neomru.vim', {'autoload':{'unite_sources':'file_mru'}}

  nnoremap <leader>f :Unite -auto-resize file file_mru file_rec<cr>
  nnoremap <leader>g :Unite grep:.<cr>
  nnoremap <leader>b :Unite -quick-match buffer<cr>
"}}}

NeoBundle 'nathanaelkane/vim-indent-guides' "{{{
  let g:indent_guides_start_level=1
  let g:indent_guides_guide_size=1
  let g:indent_guides_enable_on_vim_startup=0
  let g:indent_guides_color_change_percent=3
  if !has('gui_running')
    let g:indent_guides_auto_colors=0
    function! s:indent_set_console_colors()
      hi IndentGuidesOdd ctermbg=235
      hi IndentGuidesEven ctermbg=236
    endfunction
    autocmd VimEnter,Colorscheme * call s:indent_set_console_colors()
  endif
"}}}

NeoBundle 'scrooloose/syntastic' "{{{
  let g:syntastic_error_symbol = '✗'
  let g:syntastic_style_error_symbol = '✠'
  let g:syntastic_warning_symbol = '∆'
  let g:syntastic_style_warning_symbol = '≈'
"}}}

call neobundle#end()
filetype plugin indent on
syntax enable

" color {{{
  set background=dark

  " conditionally set colorscheme
  if has('unix') && !has('gui_macvim')
    if $TERM == 'xterm-256color'
      colorscheme molokai
    else
      let g:CSApprox_verbose_level=0
      colorscheme slate
    endif
  else
    colorscheme molokai
  endif
" }}}


" enjoy.
