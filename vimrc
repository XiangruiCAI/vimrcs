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

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

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
      set guifont=Source\ Code\ Pro\ 12
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

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent

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

" set cursorcolumn
set nu
set colorcolumn=80
" set tw=79
set fo-=l

" Trim trailing whitespace
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``

" Python indention
" autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79
filetype plugin indent on
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType python setlocal foldmethod=indent
"默认展开所有代码
set foldlevel=99

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>n :bnext<cr>
map <leader>p :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
"try
"  set switchbuf=useopen,usetab,newtab
"  set stal=2
"catch
"endtry

" Remap VIM 0 to first non-blank character
map 0 ^

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Put plugins and dictionaries in this dir (also on Windows)
if has("win16") || has("win32")
    let vimDir = '$HOME/vimfiles'
else
    let vimDir = '$Home/.vim'
endif

let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    " call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" spell check
" set spell spelllang=en_us

" status line
set laststatus=2
"set ttimeoutlen=50
set statusline =
" Buffer number
set statusline +=[%n]
" File description
set statusline +=%f\ %h%m%r%w
" Filetype
" set statusline +=%y                                                  
" Name of the current branch (needs fugitive.vim)
set statusline +=\ %{fugitive#statusline()}
" Date of the last time the file was saved
set statusline +=\ %{strftime(\"[%d/%m/%y\ %T]\",getftime(expand(\"%:p\")))} 
" Total number of lines in the file
set statusline +=%=%-5L
" Line, column and percentage
set statusline +=%=%-1.(%l,%c%V%)\ %P
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif
