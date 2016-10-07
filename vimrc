"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"Always show current position
set ruler

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set nowrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
set t_Co=256
set bg=dark
"let g:solarized_termcolors=256
colorscheme solarized 

function! MaximizeWindow()    
	silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guioptions-=m " 隐藏菜单栏
    set guioptions-=T " 隐藏工具栏
    set guioptions-=L " 隐藏左侧滚动条
    set guioptions-=r " 隐藏右侧滚动条
    set guioptions-=b " 隐藏底部滚动条
    set showtabline=0 " 隐藏Tab栏
    set t_Co=256
    set guitablabel=%M\ %t
    if has("gui_win32")
      set guifont=consolas:h10:cANSI
      au GUIEnter * simalt ~x
    else
      set guifont=Source\ Code\ Pro\ 16
      au GUIEnter * call MaximizeWindow()
    endif
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Automatically set paste mode in Vim when pasting in insert mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" cscope
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
  endif
  set csverb
endif

" Ctrl-_ to :cstag
map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
" find all functions caling a certain functions
map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
" find all occurrneces of a particular C symbol
map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
" Using '<leader>f<mode>' then a search type makes the vim window
" split vertically, with search result displayed in the new window.
nmap <leader>fs :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>fg :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>fc :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ft :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>fe :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ff :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>fi :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>fd :vert scs find d <C-R>=expand("<cword>")<CR><CR>

" fold
set foldenable              " 开始折叠
set foldmethod=indent       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
"setlocal foldlevel=1       " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码

"set foldclose=all          " 设置为自动关闭折叠                
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                            " 用空格键来开关折叠
" split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitright
set splitbelow

set cursorcolumn
set colorcolumn=80

" Trim trailing whitespace
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``
