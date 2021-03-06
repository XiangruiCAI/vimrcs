# Vimrcs for Data Science and Writing.

## Table of Contents
=================


* [Vimrcs for Data Science and Writing\.](#vimrcs-for-data-science-and-writing)
  * [Main Features](#main-features)
  * [Installation](#installation)
  * [Project structure](#project-structure)
* [Shortcuts](#shortcuts)
* [TODO](#todo)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc.go)

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

NOTE: the users needs install `git bash` on windows (it is usually installed along with `git`). The above commands can run in `git bash` with out any modification. 

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

# Shortcuts and Commands

Currently, the shortcuts can refer to the ones of [amix](https://github.com/amix/vimrc). I will finish a table of shortcuts soon.

## Commands of fugitive

* `:G` and `:Gstatus`: `git status`
* `:Gedit`: edit a file in the index and write it to stage the changes.
* `:Gdiffsplit`: compare current file with its staged version.
* `:Gcommit`: `git commit`
* `:Grebase`: `git rebase`
* `:Gmerge`: `git merge`
* `:Gpull`: `git pull`
* `:Gfetch`: `git fetch`
* `:Gpush`: `git push`
* `:Gmove`: `git mv`
* `:Gdelete`: `git rm`
* `:Gblame`: `git blame`, work in a file, press enter on a line to change the commit, use `:Gedit` to commit after you've done.
* `:Gread`: `git checkout -- filename`
* `:Gwrite`: `git add`

# TODO

- More support for python, especially for data analytics, such as jupyter.
- Support for c++ programming.
- Better README file.

