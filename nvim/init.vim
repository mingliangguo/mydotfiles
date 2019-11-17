" Install VimPlug if not present
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

let mapleader = ','

" Faster loading
" let g:python3_host_prog = '/usr/local/bin/python3'
" let g:python_host_prog = '/usr/local/bin/python'
" let g:ruby_host_prog = 'rvm system do neovim-ruby-host'
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings (see :h vim-differences)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
set autoindent
set autoread
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set copyindent
set expandtab
set tabstop=2
set shiftwidth=0 " Always have the same value with `tabstop`
set softtabstop=-1 " Always have the same value with `shiftwidth`
set hidden
set history=500
set incsearch hlsearch ignorecase smartcase
set laststatus=2
set ignorecase smartcase
set lazyredraw
set linebreak
" set list listchars=tab:.\ ,trail:.
set list lcs=tab:»_,trail:·
set mouse=""
set nowrap " Do not wrap lines.
set nobackup
set noshowmatch
set noshowmode
set number relativenumber
set ruler rulerformat=%l\:%c
set scrolloff=5
set shortmess+=c
set showcmd
set showtabline=1
set smarttab
set tags=./tags;,tags
set termguicolors
set title
set wildmenu
set wildmode=list:longest,full
set wrap
set ttimeoutlen=0

set noswapfile " disable swap file
set backup " make backup file and leave it around
set undofile " Persistent Undo.
set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/swap
set undodir=~/.config/nvim/undo

" enable spell check in English
set spelllang=en_us
set complete+=k
autocmd FileType mail setlocal spell spelllang=en_us
autocmd BufRead COMMIT_EDITMSG setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead *.md,*.mkd,*.markdown set filetype=markdown
autocmd FileType markdown set spell spelllang=en_us
autocmd FileType json set conceallevel=0

" set spell or set nospell
set magic " Enable extended regexes.

" enable very magic in search and replace, refer to: https://cdaddr.com/programming/vim-regexes-are-awesome/
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v


" Set extra options when running in GUI mode"
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
    set guifont=Fira\ Code:h14
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" end of settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins will be downloaded under the specified directory
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
" vim navigation https://github.com/moll/vim-node
Plug 'moll/vim-node'

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='base16'
" " Enable the list of buffers in Airline

let g:airline#extensions#tabline#enabled = 1
" " start counting buffers at 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" " only show bufferline if more than 1 open buffer
" let g:airline#extensions#tabline#buffer_min_count = 2
let airline#extensions#tabline#tabs_label = 0
let airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_close_button = 0
" let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#fnamecollapse = 1
" let g:airline#extensions#tabline#show_tab_type = 0
" let g:airline#extensions#tabline#buffers_label = ''
" let g:airline#extensions#tabline#tabs_label = ''
" " Just show the file name
let g:airline#extensions#tabline#fnamemod = ':t'
" " show that little number in front
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" " don't show the buffer number (that :ls number)
" let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
" " use the patched font
let g:airline_powerline_fonts = 1
" let g:airline_exclude_filenames = ['NERD_tree_1'] " see source for current list

let g:airline_section_b = ''
let g:airline_section_y = ''
let g:airline_section_z = ''

Plug 'Yggdroot/indentLine'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_color_term = 239

" Background (Vim, GVim)
let g:indentLine_bgcolor_term = 202


Plug 'haya14busa/incsearch.vim'
" use incsearch.vim rather than built-in
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" clear highlight when I do anything other than n/N
let g:incsearch#auto_nohlsearch = 1
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

Plug 'mhinz/vim-startify'
" no asciiart header
let g:startify_custom_header = ['']
let g:startify_list_order = [
      \ ['        Most recently used files'],
      \ 'files',
      \ ['        Most recently used in current directory'],
      \ 'dir',
      \ ['        Sessions'],
      \ 'sessions',
      \ [        'Bookmarks'],
      \ 'bookmarks',
      \ ['        Commands'],
      \ 'commands',
      \ ]
" don't change vim's dir when I select a file
let g:startify_change_to_dir = 0

Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/prettier'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

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
" Plug 'dracula/vim'

" <C-w>f to open the file under the cursor in a new vertical split
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif


Plug 'tpope/vim-surround'
" Plug 'easymotion/vim-easymotion'
"Colorch schemes {{{
" Plug 'flazz/vim-colorschemes'
"}}}
Plug 'kien/ctrlp.vim'
""" settings for ctrlp
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1
let g:ctrlp_working_path_mode = 'rw'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX
nmap <leader>mu :CtrlPMRU<cr>

Plug 'Townk/vim-autoclose'
Plug 'vim-scripts/matchit.zip'
" Plug 'szw/vim-maximizer'
" use F8 to togger the maximum screen
nnoremap <silent><F8> :MaximizerToggle<CR>
vnoremap <silent><F8> :MaximizerToggle<CR>gv
inoremap <silent><F8> <C-o>:MaximizerToggle<CR>
Plug 'vimwiki/vimwiki'
Plug 'tomtom/tcomment_vim'

" Plugins for javascript development
" Plug 'leafgarland/typescript-vim'

set statusline+=%#warningmsg#
set statusline+=%*

"""}}}
" Plug 'terryma/vim-multiple-cursors'
"
Plug 'elzr/vim-json'
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
" ALE config
nmap <leader>e <Plug>(ale_fix)
let g:ale_sign_error = '×'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_set_highlights = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = { 'ruby': ['rubocop'], 'javascript': ['eslint', 'prettier'] }
let g:ale_fixers = { 'ruby': ['rubocop'], 'javascript': ['prettier'] }

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

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
nnoremap <leader>n :NERDTreeToggle<CR>
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

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
let b:deoplete_ignore_sources = ['buffer']
autocmd FileType markdown
       \ call deoplete#custom#buffer_option('auto_complete', v:false)

" Java setting
Plug 'artur-shaik/vim-javacomplete2'
autocmd FileType java setlocal omnifunc=javacomplete#Complete
" end of autocomplete

Plug 'mhinz/vim-signify'
" Signify config
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 1
let g:signify_sign_show_count = 0
let g:signify_sign_add = '┃'
let g:signify_sign_change = '┃'
let g:signify_sign_delete = '━'
highlight SignColumn guibg=#282828
highlight SignifySignAdd guifg=#5af78d ctermfg=185
highlight SignifySignChange guifg=#ffc24b ctermfg=153
highlight link SignifySignDelete GitGutterDelete

call plug#end()

" Set Colorscheme after plugins loaded
colorscheme gruvbox
" colorscheme base16-default-dark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End of plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map : as ;, to save key stroke
nnoremap ; :

" which replaces the word under cursor for whatever you want; after that, you can keep pressing .
" and it will keep substituting all the instances of the original word (ala multiple cursors).
" You can skip them with n (as you would in a normal search). The second mapping goes the other way around: substitutes upwards.
nnoremap c* *``cgn
nnoremap c# #``cgN

" Clear last search (,qs)
map <silent> <leader>qs <Esc>:noh<CR>

" Safeguard
if !exists("g:syntax_on")
  syntax enable
endif

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext "


nnoremap <leader>w :w<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>sc :source ~/.config/nvim/init.vim<cr>
nnoremap <silent><leader><cr> :let @/ = ""<cr>
nnoremap <leader>v :vertical resize +10<cr>
nnoremap <leader>V :vertical resize -10<cr>

" Easy navigation
noremap <leader>s <c-w>w
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" FZF mapping
nnoremap <leader>h :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Files<CR>

" The silver searcher
noremap <leader>ag <esc>:Ag<space>
noremap <leader>aw <esc>:Ag <c-r><c-w>
noremap <leader>ah <esc>:Ag<up><cr>

" Vim-fugitive and vim-rhubarb
noremap <silent> gb :Gblame<CR>
noremap <silent> ghub :Gbrowse<CR>

" Set clipboard provider to pbcopy for MacOS
let g:clipboard = {
      \ 'name': 'pbcopy',
      \ 'copy': {
      \    '+': 'pbcopy',
      \    '*': 'pbcopy',
      \  },
      \ 'paste': {
      \    '+': 'pbpaste',
      \    '*': 'pbpaste',
      \ },
      \ 'cache_enabled': 0,
      \ }

nnoremap <Leader>p :set nopaste<CR>

" ==================================================
" SYNTAX
" ==================================================

nnoremap <Leader>scss :set ft=css<CR>
nnoremap <Leader>shtml :set ft=html<CR>
nnoremap <Leader>sjs :set ft=javascript<CR>
nnoremap <Leader>sjson :set ft=json<CR>
nnoremap <Leader>smd :set ft=markdown<CR>
nnoremap <Leader>spy :set ft=python<CR>
nnoremap <Leader>ssh :set ft=sh<CR>
nnoremap <Leader>sts :set ft=typescript<CR>
nnoremap <Leader>svim :set ft=vim<CR>
nnoremap <Leader>sgql :set ft=graphql<CR>

" ==================================================
" Enhance regex
" ==================================================

set magic " Enable extended regexes.
" enable very magic in search and replace, refer to: https://cdaddr.com/programming/vim-regexes-are-awesome/
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v


" ==================================================
" Other Enhancement
" ==================================================

" which replaces the word under cursor for whatever you want; after that, you can keep pressing .
" and it will keep substituting all the instances of the original word (ala multiple cursors).
" You can skip them with n (as you would in a normal search). The second mapping goes the other way around: substitutes upwards.
nnoremap c* *``cgn
nnoremap c# #``cgN

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

" enable wrap for markdown files
au FileType vimwiki set wrap
au FileType markdown set wrap
" ------------------------------------------------------------------

