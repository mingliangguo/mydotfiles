" ======================================================================================
" File         : .vimrc
" Author       : Mingliang
" Last modification date: Wed Jul  3 18:56:30 CST 2013
" Description  : My personal compilation of vimrc
" ======================================================================================


"/////////////////////////////////////////////////////////////////////////////
" General
"/////////////////////////////////////////////////////////////////////////////
"
"===================================================
" 
" Install VimPlug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" change the mapleader from \ to ,
let mapleader = ','
set nocompatible " Use Vim settings, rather then Vi settings (much better!). This must be first, because it changes other options as a side effect.
set langmenu=none " always use English menu
" Enhance command-line completion
" Allow cursor keys in insert mode
" set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start

" Show “invisible” characters
set list

" enable spell check in English
set spelllang=en_us
set complete+=k	
autocmd FileType mail setlocal spell spelllang=en_us
autocmd BufRead COMMIT_EDITMSG setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead *.md,*.mkd,*.markdown set spell spelllang=en_us
" set spell or set nospell

" highlight the current line
set cursorline
hi cursorline guibg=NONE gui=underline

"use relative rownumber
set rnu
set nu " Show LineNumber
"
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" map : as ;, to save key stroke
nnoremap ; :

" source $VIMRUNTIME/vimrc_example.vim
" behave xterm  " set mouse behavior as xterm

"set path=.,/usr/include/*,, " where gf, ^Wf, :find will search 
set backup " make backup file and leave it around 
"UNUSED: set backupdir=%tmp%
"UNUSED: set directory=.,%tmp%

" setup back and swap directory
let data_dir = $HOME.'/.data/'
let backup_dir = data_dir . 'backup' 
let swap_dir = data_dir . 'swap' 
let undo_dir = data_dir . 'undo' 
if finddir(data_dir) == ''
    silent call mkdir(data_dir)
endif
if finddir(backup_dir) == ''
    silent call mkdir(backup_dir)
endif
if finddir(swap_dir) == ''
    silent call mkdir(swap_dir)
endif
if finddir(undo_dir) == ''
    silent call mkdir(undo_dir)
endif
set backupdir=$HOME/.data/backup " where to put backup file 
set directory=$HOME/.data/swap " where to put swap file 
set undodir=$HOME/.data/undo " where to put undo file 
unlet data_dir
unlet backup_dir
unlet swap_dir

" programming related 
set tags+=./tags,./../tags,./**/tags,tags " which tags files CTRL-] will find 
set makeef=error.err " the errorfile for :make and :grep 

" NOTE: viminfo
" for MS-DOS, Windows and OS/2: '20,<50,s10,h,rA:,rB:,
" for Amiga: '20,<50,s10,h,rdf0:,rdf1:,rdf2:
" for others: '20,<50,s10,h
set viminfo+=! " make sure it can save viminfo 

" Redefine the shell redirection operator to receive both the stderr messages
" and stdout messages
set shellredir=>%s\ 2>&1

set history=50 " keep 50 lines of command line history
set updatetime=1000 " default = 4000
set autoread " auto read same-file change ( better for vc/vim change )

" ------------------------------------------------------------------ 
" Desc: Visual
" ------------------------------------------------------------------ 

set showmatch " show matching paren 
set matchtime=0 " 0 second to show the matching paren ( much faster )

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif"

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif"

" Set extra options when running in GUI mode"
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
    set guifont=Inconsolata-g\ for\ Powerline:h14
    " set guifont=Roboto\ Mono\ for\ Powerline:h15
    " set guifont=Tinos\ for\ Powerline:h17
    " set gfn=Source\ Code\ Pro\ Light\ For\ Powerline:h14 
    " set gfn=Monaco:h14
    " set guifont=Hack:h12
endif

" colorscheme badwolf

" Set some junk
set autoindent " Copy indent from last line when starting new line.
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble
set foldcolumn=0 " Column to show folds
set foldenable
set foldlevel=2
" set foldlevelstart=2 " Sets `foldlevel` when editing a new buffer
set foldmethod=syntax " Markers are used to specify folds.
set foldminlines=0 " Allow folding single lines
set foldnestmax=3 " Set max fold nesting level
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set gdefault " By default add g flag to search/replace. Add g to toggle.
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=1000 " Increase history from 20 default to 1000
set ignorecase " Ignore case of searches.
set incsearch " Highlight dynamically as pattern is typed.
set laststatus=2 " Always show status line
set lispwords+=defroutes " Compojure
set lispwords+=defpartial,defpage " Noir core
set lispwords+=defaction,deffilter,defview,defsection " Ciste core
set lispwords+=describe,it " Speclj TDD/BDD
set magic " Enable extended regexes.
set mouse=a " Enable mouse in all modes.
set noerrorbells " Disable error bells.
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command.
set nostartofline " Don't reset cursor to start of line when moving around.
set nowrap " Do not wrap lines.
set ofu=syntaxcomplete#Complete " Set omni-completion method.
set report=0 " Show all changes.
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window.
set shortmess=atI " Don't show the intro message when starting vim.
set showmode " Show the current mode.
set sidescrolloff=3 " Start scrolling three columns before vertical border of window.
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters.
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set title " Show the filename in the window titlebar.
set ttyfast " Send more characters at a given time.
" set ttymouse=xterm " Set mouse type to xterm.
set undofile " Persistent Undo.
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildchar=<TAB> " Character for CLI expansion (TAB-completion).
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/smarty/*,*/vendor/*,*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line.
set wildmode=list:longest " Complete only until point of ambiguity.
set winminheight=0 "Allow splits to be reduced to a single line.
set wrapscan " Searches wrap around end of file

let g:Powerline_symbols = 'fancy'
" let g:Powerline_symbols = 'unicode'

" Speed up viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Faster split resizing (+,-)
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Sudo write (,W)
noremap <leader>W :w !sudo tee %<CR>

" Remap :W to :w
command W w
command Wq wq

" Better mark jumping (line + col)
nnoremap ' `

" Hard to type things
imap >> →
imap << ←
imap ^^ ↑
imap VV ↓
imap aa λ

" Toggle show tabs and trailing spaces (,c)
set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
set fcs=fold:-
nnoremap <silent> <leader>c :set nolist!<CR>

" Clear last search (,qs)
map <silent> <leader>qs <Esc>:noh<CR>
" map <silent> <leader>qs <Esc>:let @/ = ""<CR>

" Vim on the iPad
if &term == "xterm-ipad"
  nnoremap <Tab> <Esc>
  vnoremap <Tab> <Esc>gV
  onoremap <Tab> <Esc>
  inoremap <Tab> <Esc>`^
  inoremap <Leader><Tab> <Tab>
endif

" Indent/unident block (,]) (,[)
nnoremap <leader>] >i{<CR>
nnoremap <leader>[ <i{<CR>

" Paste toggle (,p)
" set pastetoggle=<leader>p
" map <leader>p :set invpaste paste?<CR>

" NERD Commenter
let NERDSpaceDelims=1
let NERDCompactSexyComs=1
let g:NERDCustomDelimiters = { 'racket': { 'left': ';', 'leftAlt': '#|', 'rightAlt': '|#' } }

" Buffer navigation (,,) (,]) (,[) (,ls)
map <Leader>, <C-^>
" :map <Leader>] :bnext<CR>
" :map <Leader>[ :bprev<CR>
map <Leader>ls :buffers<CR>

" Close Quickfix window (,qq)
map <leader>qq :cclose<CR>

" Yank from cursor to end of line
nnoremap Y y$

" Insert newline
map <leader><Enter> o<ESC>

" Search and replace word under cursor (,*)
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>

" Strip trailing whitespace (,ss)
function! StripWhitespace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>

" ------------------------------------------------------------------ 
" Desc: Search
" ------------------------------------------------------------------ 

syntax on
set hlsearch

set clipboard+=unnamed
" define the copy/paste judged by clipboard
" if &clipboard ==# "unnamed"
"     " fix the visual paste bug in vim
"     " vnoremap <silent>p :call g:()<CR>
" else
"     " general copy/paste.
"     " NOTE: y,p,P could be mapped by other key-mapping
"     map <unique> <leader>y "+y
"     map <unique> <leader>p "*p
"     " map <unique> <leader>P "*P
" endif

" map keys to switch between splitted windows
nnoremap <unique> <S-Up> <C-W><Up>
nnoremap <unique> <S-Down> <C-W><Down>
nnoremap <unique> <S-Left> <C-W><Left>
nnoremap <unique> <S-Right> <C-W><Right>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext "

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Move in fold
noremap <unique> z<Up> zk
noremap <unique> z<Down> zj
if has("gui_running") "  the <alt> key is only available in gui mode.
    noremap <unique> <M-Up> zk
    noremap <unique> <M-Down> zj
endif

"tab setting {
set showtabline=2 " Always show tab bar.
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"}

" Set Number format to null(default is octal) , when press CTRL-A on number
" like 007, it would not become 010
set nf=
" In Visual Block Mode, cursor can be positioned where there is no actual character
set ve=block


set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fenc=utf-8
"set encoding=utf-8

"相对行号 要想相对行号起作用要放在显示行号后面
function! NumberToggle()
  if(&relativenumber == 1)
    set number
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <F7> :call NumberToggle()<cr>

"将-连接符也设置为单词
set isk+=-

set numberwidth=4          "行号栏的宽度
set whichwrap=b,s,<,>,[,]  "让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）

"插入模式下移动
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <c-h> <left>

"修改vim的正则表达
" nnoremap / /\v
" vnoremap / /\v

"折叠html标签 ,fold tag
nnoremap <leader>ft vatzf
"使用,v来选择刚刚复制的段落，这样可以用来缩进
nnoremap <leader>v v`]

"使用,w来垂直分割窗口，这样可以同时查看多个文件,如果想水平分割则<c-w>s
nnoremap <leader>w <c-w>v<c-w>l
nnoremap <leader>wc <c-w>c
" nnoremap <leader>wt <c-w>w

"html中的js加注释 取消注释
nmap <leader>h I//jj
nmap <leader>ch ^xx
"切换到当前目录
nmap <leader>q :execute "cd" expand("%:h")<CR>
"搜索替换
nmap <leader>s :,s///c

"取消粘贴缩进
" nmap <leader>p :set paste<CR>
" nmap <leader>pp :set nopaste<CR>

" shortcuts for switch file types
nmap <leader>fj :set ft=javascript<CR>
nmap <leader>fc :set ft=css<CR>
nmap <leader>fx :set ft=xml<CR>
nmap <leader>fm :set ft=mako<CR>

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

" Plug section
call plug#begin('~/.vim/plugged')

" vim navigation https://github.com/moll/vim-node
Plug 'moll/vim-node'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'

Plug 'jparise/vim-graphql'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
" FZF: ----------------------------------------------------------------{{{

let g:fzf_launcher = "/Users/gary/fzf_launch.sh"
let g:fzf_layout = {'down': '~50%'}
let g:fzf_files_options =
  \ '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'

nmap <leader>cp :Files<cr>
nmap <leader>bt  :BTags<cr>
nmap <leader>mru  :FZFMru<cr>

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

command! FZFMru call fzf#run({
      \'source': filter(copy(v:oldfiles), 'v:val !~ "NERD_tree"'),
      \'sink' : 'e ',
      \'options' : '-m',
      \})

command! Plugs call fzf#run({
      \ 'source':  map(sort(keys(g:plugs)), 'g:plug_home."/".v:val'),
      \ 'options': '--delimiter / --nth -1',
      \ 'sink':    'Explore'})


Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" end FZF -------------------------------------------------------------}}}

Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'

" <C-w>f to open the file under the cursor in a new vertical split
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif


Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
"Colorch schemes {{{
Plug 'flazz/vim-colorschemes'
"}}}
Plug 'kien/ctrlp.vim'
""" settings for ctrlp
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX
nmap <leader>mu :CtrlPMRU<cr>

Plug 'Townk/vim-autoclose'
Plug 'vim-scripts/matchit.zip'
Plug 'godlygeek/tabular'
Plug 'vimwiki/vimwiki'
Plug 'tomtom/tcomment_vim'
function! BuildTern(info)
  if a:info.status == 'installed' || a:info.force
    !npm install
  endif
endfunction


" Plugins for javascript development
Plug 'ternjs/tern_for_vim', { 'do': function('BuildTern') }
Plug 'https://github.com/scrooloose/syntastic.git'
Plug 'leafgarland/typescript-vim'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint']

" let g:syntastic_typescript_tsc_args = "--my --args --here"
let g:syntastic_typescript_tsc_args = "-t ES5 -m commonjs --experimentalDecorators --emitDecoratorMetadata --sourceMap true --moduleResolution node"
""" End of syntastic settings
"""}}}
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'
Plug 'isRuslan/vim-es6'
" Javascript syntax: https://github.com/othree/yajs.vim
Plug 'othree/yajs.vim', { 'for': 'javascript' }

Plug 'maksimr/vim-jsbeautify'
map <s-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <s-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" End of plugins for javascript development
"

Plug 'http://github.com/wannesm/wmgraphviz.vim'
let g:WMGraphviz_output="png"

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

" UltiSnips "
"
" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-h>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

Plug 'https://github.com/tpope/vim-fugitive.git'

Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdtree'
nnoremap <leader>nt :NERDTreeToggle<CR>
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.$','\~$']
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos=1
" Let nerdtree sync with opened buffer
map <leader>r :NERDTreeFind<cr>

" Navigation
Plug 'http://github.com/gmarik/vim-visual-star-search.git'

Plug 'MarcWeber/vim-addon-mw-utils'

Plug 'Valloric/YouCompleteMe'
" Plug 'Lokaltog/vim-powerline'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" === airline settings
" let g:airline_theme = 'zenburn'
let g:airline_theme = 'jellybeans'
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

" === end of airline settings

" Add plugins to &runtimepath
call plug#end()

colorscheme gruvbox
" colorscheme base16-default-dark
set background=dark

" Put the following at the end of plug
filetype on
filetype plugin indent on

"/////////////////////////////////////////////////////////////////////////////
" added to avoid the conflict between ycm and snipmate
"/////////////////////////////////////////////////////////////////////////////
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_complete_in_comments = 1 
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_collect_identifiers_from_comments_and_strings = 1


"/////////////////////////////////////////////////////////////////////////////
" Auto Command
"/////////////////////////////////////////////////////////////////////////////

" ------------------------------------------------------------------ 
" Desc: Only do this part when compiled with support for autocommands.
" ------------------------------------------------------------------ 

if has("autocmd")
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END
endif " has("autocmd")
"

" ------------------------------------------------------------------ 
" Desc: Buffer
" ------------------------------------------------------------------ 

au BufNewFile,BufEnter * set cpoptions+=d " NOTE: ctags find the tags file from the current path instead of the path of currect file
au BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full) 
au BufNewFile,BufRead *.avs set syntax=avs " for avs syntax file.
au BufNewFile,BufRead *.sql,*.cql set syntax=sql " for sql syntax file.
" au BufNewFile,BufRead *.inc,*.test set filetype=php
au BufNewFile,BufRead *.{php,inc,test,module,install,view} set filetype=php
au BufNewFile,BufRead *.{ts} set filetype=typescript
" au BufNewFile,BufRead *.{module,install} set filetype=drupal | runtime! ftplugin/php.vim | runtime! syntax/php.vim
au BufRead,BufNewFile *.c,*.cpp,*.py,*.php, match Error /\%80v.\%81v./
" au BufRead,BufNewFile *.c,*.cpp,*.py 2match Underlined /.\%81v/

au FileType c,cpp,cs,swig set nomodeline " this will avoid bug in my project with namespace ex, the vim will tree ex:: as modeline.

" ------------------------------------------------------------------ 
" Desc: VimWiki 
" ------------------------------------------------------------------ 
let g:vimwiki_list = [ 
      \ { 
      \     'path': "~/Dropbox/vimwiki/LifeWiki",
      \     'template_path': '~/Dropbox/vimwiki/templates',
      \     'template_default': 'def_template',
      \     'syntax': 'markdown', 'ext': '.md',
      \     'template_ext': '.html', 'auto_export': 0
      \ }, 
      \ {
      \     'path': "~/Dropbox/vimwiki/TechWiki",
      \     'template_path': '~/Dropbox/vimwiki/templates/',
      \     'template_default': 'def_template',
      \     'syntax': 'markdown', 'ext': '.md',
      \     'template_ext': '.html', 'auto_export': 0
      \ },
      \ {
      \     'path': "~/Dropbox/vimwiki/WorkWiki",
      \     'template_path': '~/Dropbox/vimwiki/templates/',
      \     'template_default': 'def_template',
      \     'syntax': 'markdown', 'ext': '.md',
      \     'template_ext': '.html', 'auto_export': 0
      \ }
      \ ]

" \ 'nested_syntaxes' : {'python': 'python', 'c++': 'cpp'},
" create vimwiki files
" call exUtility#CreateVimwikiFiles ()

" map <silent><unique> <Leader>wt <Plug>VimwikiTabGoHome
" map <silent><unique> <Leader>wq <Plug>VimwikiUISelect
" map <silent><unique> <Leader>ww <Plug>VimwikiGoHome

" vimwiki file process
" u FileType vimwiki command! W call exUtility#SaveAndConvertVimwiki(0)
" "au FileType vimwiki command! WA call exUtility#SaveAndConvertVimwiki(1)
" "au FileType rst command! W call exUtility#SphinxMake('html')

" use camel case
let g:vimwiki_camel_case = 0
 
" use different colors for completed items
let g:vimwiki_hl_cb_checked = 1
 
" hide vimwiki menu
let g:vimwiki_menu = ''
 
" hide vimwiki folder, could be slow if enabled
"let g:vimwiki_folding = 1
 
" count CJK characters when calculate length
let g:vimwiki_CJK_length = 1

let g:vimwiki_html_header_numbering = 2

let g:vimwiki_html_header_numbering_sym = '.'

" valid html tags
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'

" ------------------------------------------------------------------ 
" Desc: zencoding 
" ------------------------------------------------------------------ 

let g:user_zen_leader_key = '<c-j>'

" ------------------------------------------------------------------ 
" Desc: surround 
" 'sb' for block
" 'si' for an if statement
" 'sw' for a with statement
" 'sc' for a comment
" 'sf' for a for statement
" ------------------------------------------------------------------ 

" DISABLE { 
" let g:surround_{char2nr("b")} = "{% block\1 \r..*\r &\1%}\r{% endblock %}"
" let g:surround_{char2nr("i")} = "{% if\1 \r..*\r &\1%}\r{% endif %}"
" let g:surround_{char2nr("w")} = "{% with\1 \r..*\r &\1%}\r{% endwith %}"
" let g:surround_{char2nr("c")} = "{% comment\1 \r..*\r &\1%}\r{% endcomment %}"
" let g:surround_{char2nr("f")} = "{% for\1 \r..*\r &\1%}\r{% endfor %}"
" } DISABLE end 

au FileType vimwiki set wrap
au FileType markdown set wrap

" map keys for Tagbar
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
nmap <F6> :TagbarToggle<CR> 
" let tagbar auto close
let g:tagbar_autoclose = 1
" let tagbar auto focus when it's toggle on
let g:tagbar_autofocus = 1
" let tagbar display in a compact manner
let g:tagbar_compact = 1
let g:tagbar_width = 40

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"When .vimrc is edited, reload it
" There seems to be something wrong with the auto-reload function. It will
" cause the vim to open a dummy window and hang there. so i disabled it.
" autocmd! bufwritepost .vimrc source % 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My hotkey TIPS
" ---- Code foldering
" foldering code: zc
" unfoldering code: zo
" foldering all: zM
" unfoldering all: zR
"
" ----- Zen coding
" Ctrl + j + ,
" 
" ----- Motion editing
" ci',ci",ci(,ci[,ci{,ci< - modify code inside of the signs
" di',di",di(,di[,di{,di< - delete code inside of the signs
" yi',yi",yi(,yi[,yi{,yi< - yank code inside of the signs

