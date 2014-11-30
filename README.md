# sohooo's VIM config

This setup is based on various sources all around github. Huge credits go to these projects:

- [bling.vim](https://github.com/bling/dotvim)
- [spf13-vim](https://github.com/spf13/spf13-vim)
* [mutewinter's dotvim](https://github.com/mutewinter/dot_vim)
* [skwp's dotfiles](https://github.com/skwp/dotfiles)

## Screenshots

### Code View
![MacVim with Drawer](http://dl.dropbox.com/u/393159/macvim/macvim_sohooo.png "Macvim")

### Distraction Free
![Distraction-free Markdown](http://dl.dropbox.com/u/393159/macvim/distraction-free.png "Distraction-free Markdown environment")

## Features

- fully portable; place `vimrc` anywhere you want
- conditional loading of plugins/language features with `NeoBundleLazy`
- distraction-free writing mode


## Installation

1. `cd; git clone http://github.com/sohooo/vimfiles.git .vimfiles` in your home folder.
2. `ln -s .vimfiles .vim && ln -s .vimfiles/vimrc .vimrc` to make the symbolic links.
3. Install the awesome [Vundle](https://github.com/gmarik/vundle) with `git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`
4. Start Vim and type `:BundleInstall` to install the plugins defined in `.vimrc`.
5. Enjoy!

## Bindings

Here's a list of useful keyboard bindings:

* `s`       vim-sneak; like 'f', but multiple lines
* `,f`      find file w/ Unite
* `,b`      choose buffer w/ Unite
* `,g`      grep in current path w/ Unite
* `,d`      toggle NerdTree
* `,u`      toggle UndoTree
* `,v`      toggle GoldenView autoresizing (enabled on start)
* `,w`      toggle distraction-free writing
* `gcc`     toggle comment on/off
* `jj`      remap von ESC; this rox!
* `F9`      toggle paste/nopaste
* `F10`     toggle number/nonumber
* `,tt`     change tabs


### Neosnippets

* `ctrl-p | ctrl-n`  cycle through elements
* `ctrl-k`           complete snippet


### Unite

* `<c-jk>`  movement
* `<c-t>`   open in tab
* `<c-v>`   open in vertical split
* `<c-h>`   open in horizontal split


### Fugitive

* `:Gdiff`    show diff
* `:Gstatus`  toggle files with `-`

### Tabular

* `,t=`  align =
* `,t:`  align :
* `,tt`  align =>




## Other Tips

### Statusbar Fonts
For an even prettier status bar, use one of the patched fonts from the [Powerline wiki](https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts).


### Distraction-free Writing
Distraction-free writing a la iAWriter is supported via [a plugin from LakTEK](http://laktek.com/2012/09/05/distraction-free-writing-with-vim/). Toggle the view with `F4`, and don't forget to disable the OSX native fullscreen view:

    defaults write org.vim.MacVim MMNativeFullScreen 0

You also need the [Cousine Font from Google](http://www.fontsquirrel.com/fonts/cousine) as a free alternative to Nitti Light.
