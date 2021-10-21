" Last update - 23.7.20

" Learn a vim to fish
if &shell =~# 'fish$'
    set shell=sh
endif

"  " =============================================================================
"  " ===========           VUNDLE                       ==========================
"  " 
"  " clone the repo before firest run
"  " git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"  " =============================================================================
"  set nocompatible              " be iMproved, required
"  filetype off                  " required
"  
"  " set the runtime path to include Vundle and initialize
"  set rtp+=~/.vim/bundle/Vundle.vim
"  call vundle#begin()
"  " alternatively, pass a path where Vundle should install plugins
"  "call vundle#begin('~/some/path/here')
"  
"  " let Vundle manage Vundle, required
"  Plugin 'VundleVim/Vundle.vim'
"  " IndentLine
"  Plugin 'Yggdroot/indentLine'
"  "
"  "NERDTree
"  "Plugin 'scrooloose/nerdtree'
"  "Plugin 'jistr/vim-nerdtree-tabs'
"  "let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
"  "Git extension
"  "Plugin 'Xuyuanp/nerdtree-git-plugin'
"  
"  "Mathcalc
"  Plugin 'nixon/vim-vmath'
"  "Tabular - aka Tabularize
"  Plugin 'godlygeek/tabular'
"  " simple align.vim
"  " Plugin 'vim-scripts/Align'
"  Plugin 'Align'
"  
"  " python syntax
"  " Plugin 'vim-python/python-syntax'
"  " second option of syntax highlighting
"  " Plugin 'vim-syntastic/syntastic'
"  
"  "Julia
"  Plugin 'JuliaEditorSupport/julia-vim'
"
"  "Fish shell - TODO: not been tested yet
"  Plugin 'dag/vim-fish'
"  
"  "Markdown Preview
"  Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}
"  
"  
"  "PowerLine - status line
"  " Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"
"  " WakaTime - meassure time in each editor
"  "Plugin 'wakatime/vim-wakatime'
"  
"  " The following are examples of different formats supported.
"  "    " plugin on GitHub repo
"  "    Plugin 'tpope/vim-fugitive'        "TODO check it online
"  call vundle#end()            " required
"  filetype plugin indent on    " required
"  " To ignore plugin indent changes, instead use:
"  "filetype plugin on
"  "
"  " =============================================================================


" ============================
" VIMRC - Basic configurations
" ============================

filetype on
syntax enable
syntax on


" Global definition
"colorscheme desert
colorscheme monokai
set number
set nowrap
set splitbelow
" winpos 550 40
" set lines=42
" set columns=120

" Disable annoying beeping
set noerrorbells
set vb t_vb=
  
" Search options - highlight the search and use smart case
set hlsearch           "set to highlight the serch
set incsearch          "incremental search during typing
set ignorecase         "ignore case in search
set smartcase          "but do not ignore if typed uppercase

" Tabbing setting
"set textwidth=100      "always limit the width of text to 78
set tabstop=4           "set the tabstops to 4 characters
set autoindent          " Remain in the current indent level 
"set smartindent        " check it only if there is some kind of python indentation info
" set expandtab         "by default insert spaces for tabs
set noexpandtab         "by default do not insert spaces for tabs
set shiftwidth=4        "set the tabstops to 4 characters in autoindent
set expandtab           "expand tabs to spaces by default
set sidescroll=1        "set the number of columns to side scroll

set ruler               "display row and column numbers
set cmdheight=2
set showcmd             "print last command operated (e.g 3dd - fewer lines)
set laststatus=2        "Always displays the statusline
set wildmenu		" display completion matches in a status line


" Set whichwrap=bshl<>[] " allow movement between lines

" Set all files starting with bash to sh file type
" Only if file type has not been set allready
autocmd BufRead,BufNewFile .bash* set ft=sh



"======================================================================
"Yair Shefi - my mappings
"======================================================================
""Tabs related
map <C-q> <Esc>:tabprev<CR>
map <C-e> <Esc>:tabnext<CR>
map <C-n> <Esc>:tabnew 

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

map <F2> :%s/

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Pressing \\ shows the current directory
cmap \\ <C-R>=expand("%:p:h")."/"<cr>


" Status Line : - currently default status line
"==============
" set status line to show file length and col
"set statusline=%<%f\ %h%m%r%=%-20.(line=%l,col=%c%V,totlin=%L%)\%h%m%r%=%-40(,bytval=0x%B,%n%Y%)\%P
"set statusline=%<%f\ %h%m%r%=%-20.(line=%l,col=%c%V,TotLines=%L%)\%h%m%r%=%-10(,%n%Y%)\%P
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L 

" Mark Too Long lines:   - Currently off
" ====================
" when text exceeds column 80 the this column will be highleted

" "hi MarginColumn guibg  = RoyalBlue
" "hi MarginColumns ctermbg  = blue guifg = lightblue

hi MarginColumn ctermbg  = blue guifg = darkyellow  gui=undercurl
"call matchadd ('MarginColumns', '\%>80v.\+' ,80)
"call matchadd ('MarginColumn', '\%80v' ,80)


" Leader functions
" ================

let mapleader = "-"
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

noremap <leader>p  "0p
noremap <leader>P  "0P
"open the directory tree at the shop/eyezon/
noremap <leader>h  :vsplit $ws/eyezon/<cr> <bar> <C-w>H
noremap <leader>nh :tabnew $ws/eyezon/<cr> <bar> <C-w>H
"suto indent json 
nnoremap <leader>json :%! python3 -m json.tool 

" SHEFI Spelling
" suggest spelling options
noremap <leader>7  <Esc>:set spell<cr>z= 
noremap <leader>8  <Esc>:set nospell<cr> 

"easy way to show current file location 
map <leader>r <Esc>:!realpath %<CR>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$


" ============================
"       Syntax Specific 
" ============================
" If i will have too much mapping for functions:
" Use : filetype plugin on and put the mapping under:
" ~/.vim/ftplugin/{filetype}_mappings.vim


" ==============
"      python 
" ==============
let python_highlight_all=1
"let g:python_highlight_all = 0
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" ================
"      markdown 
" ================
" autocmd Filetype md   " TODO: why does that doesn't work....
" add Question Answer block
inoremap <leader>qa - [ ] <cr></br>A:<Esc>kA
nnoremap <leader>qa i- [ ] <cr></br>A:<Esc>kA

inoremap <leader>[- - [ ] 

" add color maping + and continue to edit
inoremap <leader>clr <font color='blue'>  </font><Esc>Bhi
autocmd Filetype markdown set conceallevel=0

" ================
"      json 
" ================
autocmd Filetype json set conceallevel=0



" ==========================
" Plugins Specific Settings
" ==========================


"  Indent level with :
" ===========================================
"  documantaion is @ ~/.vim/doc/indentLine.txt
"  Use  IndentLinesToggle - to toggle on/off
" IndentLinesReset 4
noremap <leader><Tab> :IndentLinesToggle<CR>
let g:indentLine_setColors = 1
let g:indentLine_bgcolor_gui = 'NONE'


" Simple Align mappping
map <S-space> :Align  
"Tabularize mapping
map <leader><Tab> :Tabularize /


" " NERDTree
" " ===========================================
" map <leader>n :NERDTreeToggle<CR>
" " close vim even if only NERDTree is open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 


" vmath - calc avg,sum...
" =======================
vmap <silent><expr>  -=  VMATH_YankAndAnalyse()
nmap <silent>        -=  vip++                 

" Tabularize plugin - enabale on the fly aliignment using |a|b|c....
" ==================================================================
" Note that it only updates an initialze Tabular
"  inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
"  
"  function! s:align()
"    let p = '^\s*|\s.*\s|\s*$'
"    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
"      let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
"      let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
"      Tabularize/|/l1
"      normal! 0
"      call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
"    endif
"  endfunction

" InstantPreivew 
" ================
filetype plugin on
noremap <leader>md :InstantMarkdown
let g:instant_markdown_browser = "firefox "
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1



" VUNDLE - COMMANDS
" =================
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

