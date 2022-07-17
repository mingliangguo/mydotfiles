" Install VimPlug if not present
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" set env for embedded neovim, e.g. firenvim
let $LANG="en_US.UTF-8"
let $LC_CTYPE="en.US.UTF-8"

let mapleader = ','

" Faster loading
" let g:python3_host_prog = '~/.pyenv/shims/python3'
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings (see :h vim-differences)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (has("termguicolors"))
    set termguicolors
endif

filetype plugin indent on
set fileencodings=ucs-bom,utf-8,gb18030,utf-16le,big5,euc-jp,euc-kr,latin1
" https://superuser.com/questions/302186/vim-scrolls-very-slowly-when-a-line-is-too-long
" Syntax coloring lines that are too long just slows down the world
set synmaxcol=500

set diffopt+=internal
set diffopt+=algorithm:histogram
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
set list lcs=tab:»_,trail:·
set mouse=""
set nowrap " Do not wrap lines.
set nobackup
set nowritebackup
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
set title
set wildmenu
set wildmode=list:longest,full
set wrap
set ttimeoutlen=0

set noswapfile " disable swap file
set undofile " Persistent Undo.
set directory=~/.config/nvim/swap
set undodir=~/.config/nvim/undo
" stop adding new lines at the end of file
set nofixeol

" enable spell check in English
set spelllang=en_us
set complete+=k
autocmd FileType mail setlocal spell spelllang=en_us
autocmd BufRead COMMIT_EDITMSG setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead *.md,*.mkd,*.markdown set filetype=markdown
autocmd FileType markdown set spell spelllang=en_us noexpandtab
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

" vim-lightliine
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
"

"--------------------------------------------------------------
" firenvim
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
"--------------------------------------------------------------

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

Plug 'godlygeek/tabular'
Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

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

" Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
" Plug 'embark-theme/vim', { 'as': 'embark' }
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
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <leader>cb :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <leader>cf :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
" Plug 'kien/ctrlp.vim'
" """ settings for ctrlp
" let g:ctrlp_by_filename = 1
" let g:ctrlp_regexp = 1
" let g:ctrlp_working_path_mode = 'rw'
" set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX
" nmap <leader>mu :CtrlPMRU<cr>

Plug 'Townk/vim-autoclose'
Plug 'vim-scripts/matchit.zip'
" Plug 'szw/vim-maximizer'
" use F8 to togger the maximum screen
nnoremap <silent><F8> :MaximizerToggle<CR>
vnoremap <silent><F8> :MaximizerToggle<CR>gv
inoremap <silent><F8> <C-o>:MaximizerToggle<CR>
Plug 'vimwiki/vimwiki', { 'on': 'VimwikiUISelect' }
Plug 'tomtom/tcomment_vim', { 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html', 'java', 'bash', 'python', 'ruby', 'go', 'yaml', 'properties', 'vim', 'sh']}

" Plugins for javascript development
" Plug 'leafgarland/typescript-vim'

set statusline+=%#warningmsg#
set statusline+=%*

"""}}}
" Plug 'terryma/vim-multiple-cursors'
"
Plug 'google/vim-jsonnet'
Plug 'udalov/kotlin-vim'
Plug 'elzr/vim-json'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css']}
Plug 'isRuslan/vim-es6'
" Javascript syntax: https://github.com/othree/yajs.vim
Plug 'othree/yajs.vim', { 'for': 'javascript' }

Plug 'ianding1/leetcode.vim'
let g:leetcode_browser='chrome'
let g:leetcode_solution_filetype='java'

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

Plug 'http://github.com/wannesm/wmgraphviz.vim', {'for': 'dot'}
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

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" let g:deoplete#enable_at_startup = 1
" let b:deoplete_ignore_sources = ['buffer']
" autocmd FileType markdown
"        \ call deoplete#custom#buffer_option('auto_complete', v:false)
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile', 'for': ['json', 'js', 'java', 'vim', 'go' ]}
autocmd BufNew,BufEnter *.json,*.js,*.java,*.vim,*.go execute "silent! CocEnable"
autocmd BufLeave *.json,*.js,*.java,*.vim,*.go execute "silent! CocDisable"

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" Use <c-;> for trigger completion.
inoremap <silent><expr> <C-h> coc#refresh()
" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use `[c` and `]c` for navigate diagnostics
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> <expr> [c &diff ? '[c' : '<Plug>(coc-diagnostic-prev)'
nmap <silent> <expr> ]c &diff ? ']c' : '<Plug>(coc-diagnostic-next)'
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)

" Remap for do action format
nnoremap <silent> F :call CocAction('format')<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" " Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" end of autocomplete
Plug 'tpope/vim-fugitive'
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

Plug 'jiangmiao/auto-pairs'

call plug#end()

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

" Set Colorscheme after plugins loaded
" colorscheme gruvbox
" set background=light
colorscheme PaperColor
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
" colorscheme embark

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
if has("mac")
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
end

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

