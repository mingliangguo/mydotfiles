" ======================================================================================
" File         : .vimrc
" Author       : Mingliang
" Last modification date: Wed Jul  3 18:56:30 CST 2013
" Description  : My personal compilation of vimrc
" ======================================================================================

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
autocmd BufNewFile,BufRead *.md,*.mkd,*.markdown set filetype=markdown
autocmd FileType markdown set spell spelllang=en_us
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

set noswapfile " disable swap file
set backup " make backup file and leave it around
set undofile " Persistent Undo.

if !isdirectory($HOME . '/.vim/backup')
  call mkdir($HOME . '/.vim/backup')
endif

if !isdirectory($HOME . '/.vim/swap')
  call mkdir($HOME . '/.vim/swap')
endif

if !isdirectory($HOME . '/.vim/undo')
  call mkdir($HOME . '/.vim/undo')
endif

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" programming related
set tags+=./tags,./../tags,./**/tags,tags " which tags files CTRL-] will find
set makeef=error.err " the errorfile for :make and :grep

" Redefine the shell redirection operator to receive both the stderr messages
" and stdout messages
set shellredir=>%s\ 2>&1

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

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" programming related
set tags+=./tags,./../tags,./**/tags,tags " which tags files CTRL-] will find
set makeef=error.err " the errorfile for :make and :grep

" Redefine the shell redirection operator to receive both the stderr messages
" and stdout messages
set shellredir=>%s\ 2>&1

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
    set guifont=Fira\ Mono\ for\ Powerline:h14
endif

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
set gdefault " By default add g flag to search/replace. Add g to toggle.
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=1000 " Increase history from 20 default to 1000
set ignorecase " Ignore case of searches.
set incsearch " Highlight dynamically as pattern is typed.
set hlsearch " highlight selected
set laststatus=2 " Always show status line
set lispwords+=defroutes " Compojure
set lispwords+=defpartial,defpage " Noir core
set lispwords+=defaction,deffilter,defview,defsection " Ciste core
set lispwords+=describe,it " Speclj TDD/BDD
set magic " Enable extended regexes.
" enable very magic in search and replace, refer to: https://cdaddr.com/programming/vim-regexes-are-awesome/
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
" cd to the directory of th ecurrent edited buffer
nnoremap <leader>cd :cd %:p:h<CR>
" switch to the current directory
" nmap <leader>q :execute "cd" expand("%:h")<CR>

" Switch CWD to the directory of the open buffer
" map <leader>cd :cd %:p:h<cr>:pwd<cr>

" which replaces the word under cursor for whatever you want; after that, you can keep pressing .
" and it will keep substituting all the instances of the original word (ala multiple cursors).
" You can skip them with n (as you would in a normal search). The second mapping goes the other way around: substitutes upwards.
nnoremap c* *``cgn
nnoremap c# #``cgN
" set mouse=a " Enable mouse in all modes.
set noerrorbells " Disable error bells.
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command.
set nostartofline " Don't reset cursor to start of line when moving around.
set nowrap " Do not wrap lines.
" set ofu=syntaxcomplete#Complete " Set omni-completion method.
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
  nmap + <C-W>+
  nmap - <C-W>-
  nmap > <C-W>>
  nmap < <C-W><
endif

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Sudo write (,W)
noremap <leader>W :w !sudo tee %<CR>

" Better mark jumping (line + col)
nnoremap ' `

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

" Buffer navigation (,,) (,]) (,[) (,ls)
map <Leader>, <C-^>
" :map <Leader>] :bnext<CR>
" :map <Leader>[ :bprev<CR>
map <Leader>ls :buffers<CR>

" Close Quickfix window (,qq)
map <leader>qq :cclose<CR>
" ------------------------------------------------------------------
" Desc: Search
" ------------------------------------------------------------------

syntax on

set clipboard+=unnamed


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

set numberwidth=4          " width of the linenumber
set whichwrap=b,s,<,>,[,]  " let backspace, spce, up/down arrow move to the next line if it's in the beginning/ending of a line.

" folder html tags
nnoremap <leader>ft vatzf


" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

" Plug section
call plug#begin('~/.vim/plugged')

" vim navigation https://github.com/moll/vim-node
Plug 'moll/vim-node'
Plug 'itchyny/lightline.vim'
" Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/prettier'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'jparise/vim-graphql'
Plug 'tfnico/vim-gradle'

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
Plug 'dracula/vim'

" <C-w>f to open the file under the cursor in a new vertical split
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif


" Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
" Plug 'easymotion/vim-easymotion'
"Colorch schemes {{{
Plug 'flazz/vim-colorschemes'
"}}}
Plug 'kien/ctrlp.vim'
""" settings for ctrlp
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1
let g:ctrlp_working_path_mode = 'rw'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX
nmap <leader>mu :CtrlPMRU<cr>

" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

Plug 'Townk/vim-autoclose'
Plug 'vim-scripts/matchit.zip'
Plug 'szw/vim-maximizer'
" use F8 to togger the maximum screen
nnoremap <silent><F8> :MaximizerToggle<CR>
vnoremap <silent><F8> :MaximizerToggle<CR>gv
inoremap <silent><F8> <C-o>:MaximizerToggle<CR>
Plug 'vimwiki/vimwiki'
Plug 'tomtom/tcomment_vim'

" Plugins for javascript development
Plug 'leafgarland/typescript-vim'

set statusline+=%#warningmsg#
set statusline+=%*

"""}}}
" Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'
Plug 'isRuslan/vim-es6'
" Javascript syntax: https://github.com/othree/yajs.vim
Plug 'othree/yajs.vim', { 'for': 'javascript' }

" Linting
Plug 'w0rp/ale'
" In ~/.vim/vimrc, or somewhere similar.
let g:ale_linters = {
\   'javascript': ['eslint', 'prettier'],
\}

Plug 'maksimr/vim-jsbeautify'
map <s-f> :call JsBeautify()<cr>
autocmd FileType javascript set formatprg=prettier\ --stdin
" or
autocmd FileType javascript noremap <buffer>  <s-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <s-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <s-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <s-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <s-f> :call CSSBeautify()<cr>

" End of plugins for javascript development
"

Plug 'http://github.com/wannesm/wmgraphviz.vim'
let g:WMGraphviz_output="png"

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

" UltiSnips "
" Snippets are separated from the engine. Add this if you want them:
" Track the engine.
Plug 'honza/vim-snippets'
"
Plug 'SirVer/ultisnips'
" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-h>"
"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
nnoremap <leader>nt :NERDTreeToggle<CR>
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.$','\~$']
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos=0
let g:NERDTreeChDirMode       = 2
" Let nerdtree sync with opened buffer
map <leader>r :NERDTreeFind<cr>
map <leader>n :NERDTree<cr>

" Java setting
Plug 'artur-shaik/vim-javacomplete2'
autocmd FileType java setlocal omnifunc=javacomplete#Complete
" end of autocomplete

Plug 'Lokaltog/vim-powerline'

" Add plugins to &runtimepath
call plug#end()

syntax enable
" colorscheme gruvbox
" colorscheme base16-default-dark
" set background=dark
Plug 'ayu-theme/ayu-vim' " or other package manager
"...
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" Put the following at the end of plug
filetype on
filetype plugin indent on

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
" use groovy syntax for build.gradle
au BufNewFile,BufRead *.gradle setf groovy

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

" enable true color for terminal - nvim
set termguicolors

