# Vimrcs for Data Science and Writing.

[TOC]

## Main Features
- Using vim-plug to manage plugins.
- Some settings from amix's ultimate vimrc.
- Add latex support (lervag/vimtex)
- More git support in nerdtree (Xuyuanp/nerdtree-git-plugin)
- Autoformat for c++ and python (Chiel92/vim-autoformat)
- Autocomplete with neocomplcache
- Support windows and linux

## Installation
    cd ~
    mkdir .vim
    cd .vim
    git clone https://github.com/XiangruiCAI/vimrcs
    cd vimrcs
    sh install.sh

NOTE: the users needs install `git bash` on windows (it is usually installed along with `git`). The above commonds can run in `git bash` with out any modification. 

## Project structure

- `.vimrc`: configuration file that will be put in `~/`.
- `basic.vim`: basic configuration.
- `extended.vim`: extended configuration.
- `filetypes.vim`: configuration for different file types, such as for tex and
  python.
- `vimrc.plugin`: plugins managed by `vim-plug`.
- `plugin_config.vim`: configuration for plugins.
- `neocomplcache.vim`: configuration for neocomplcache, imported by
  `plugin_config.vim`.
- `install.sh`: installation script.

# Shortcuts

Currently, the shortcuts can refer to the ones of [amix](https://github.com/amix/vimrc). I will finish a table of shortcuts soon.

# TODO

- More support for python, especially for data analytics, such as jupyter.
- Support for c++ programming.
- Better README file.

