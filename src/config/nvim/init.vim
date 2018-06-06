" ------------------------------------------------------------------------------
" ---------------- The NeoVim Runcom of Chadwick Dahlquist ---------------------
" ------------------------------------------------------------------------------

" Much Inspiration:
"   http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
"   https://github.com/junegunn/dotfiles/blob/master/vimrc

set nocompatible " be iMproved
filetype off " required!

" vim-plug
" ------------------------------------------------------------------------------
" https://github.com/junegunn/vim-plug

" :PlugUpdate - install or update plugins
" :PlugClean! - Remove unused directories (bang version will clean without prompt)

call plug#begin('~/.config/nvim/plugged')
Plug 'Lokaltog/vim-easymotion'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/unite.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidoc/taskpaper.vim'
Plug 'digitaltoad/vim-pug'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'hecal3/vim-leader-guide'
Plug 'henrik/vim-indexed-search'
Plug 'ivyl/vim-bling'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kassio/neoterm'
Plug 'lfilho/cosco.vim' " Comma and semi-colon insertion bliss for vim.
Plug 'mkitt/tabline.vim'
Plug 'neomake/neomake'
Plug 'neovim/node-host'
Plug 'nono/vim-handlebars'
Plug 'ntpeters/vim-better-whitespace' " causes all trailing whitespace characters to be highlighted.
Plug 'rking/ag.vim'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'wavded/vim-stylus'
Plug 'yuku-t/unite-git'
Plug 'yuttie/comfortable-motion.vim'
Plug 'zhaocai/GoldenView.Vim'

" Javascript Plugins
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install -g tern' }
Plug 'jiangmiao/auto-pairs',     { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx',              { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/yajs.vim',          { 'for': ['javascript', 'javascript.jsx'] }

Plug 'mhartington/nvim-typescript', { 'do': ':UpdateRemotePlugins' }
Plug 'HerringtonDarkholme/yats.vim'

" Clojure Plugins
Plug 'guns/vim-clojure-highlight', { 'for': ['clojure'] }
Plug 'guns/vim-clojure-static',    { 'for': ['clojure'] }
Plug 'snoe/nvim-parinfer.js',      { 'for': ['clojure'], 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-classpath',        { 'for': ['clojure'] }
Plug 'tpope/vim-dispatch',         { 'for': ['clojure'] }
Plug 'tpope/vim-fireplace',        { 'for': ['clojure'] }
Plug 'tpope/vim-projectionist',    { 'for': ['clojure'] }
Plug 'tpope/vim-salve',            { 'for': ['clojure'] }
Plug 'venantius/vim-cljfmt',       { 'for': ['clojure'] }
Plug 'venantius/vim-eastwood',     { 'for': ['clojure'] }

" Haskell Plugins
Plug 'neovimhaskell/haskell-vim',  { 'for': ['haskell'] }

" Python Plugins
" Plug 'hdima/python-syntax',  { 'for': ['python'] }
Plug 'vim-python/python-syntax',  { 'for': ['python'] }

call plug#end()


" Preferences / Defaults -------------------------------------------------------

syntax on

set autoindent
set autoread
set background=dark
set backupdir=./.backup,.,/tmp
set clipboard=unnamed                         " support OS X clipboard
set cursorline                                " highlighted cursor row
set expandtab                                 " insert spaces instead when pressing <tab>
set formatoptions-=cro                        " no annoying comment autoformat foo
set guifont=DejaVuSansMono:h14                " This is the best programming font. I declare it.
set hidden                                    " Don't need to see abandoned buffers
set hlsearch
set ignorecase
set list
set listchars=tab:▸\ ,eol:¬                   " Use same symbols as TextMate for tabstops & EOLs
set nobackup
set noerrorbells                              " don't beep, asshole
set noswapfile
set nowrap
set number
set ruler
set rulerformat=%cx%l%V%=%P
set shell=/bin/bash
set shiftwidth=4                              " default to 4 spaces for indentation
set showtabline=2                             " always show tab line
set smartindent
set synmaxcol=160                             " Don't syntax highlight past 160 cols (perf)
set t_ut=
set tabstop=4                                 " use four space chars when pressing <tab>
set termguicolors                             " enable true color support
set timeoutlen=300
set titlestring=%{fnamemodify(getcwd(),':t')} " set iTerm tab/window title to the current working directory name (project name)
set ttimeoutlen=0
set visualbell                                " don't beep
set wildignore=*.swp,*.pyc

" statusline (line below the window pane)
set statusline=%f:%l:%c                       " minimal status line with file name
set statusline+=%=%y%m                        " right-aligned file type [modified]

let g:netrw_dirhistmax = 0    " no .netrwhist turds please

" never try to automatically insert commented new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" never ever use tab characters you filthy heathens
autocmd BufReadPre set expandtab


" Mappings ---------------------------------------------------------------------

" Pressing 'K' will split the line ('cause 'J' will join it)
nnoremap K i<CR><Esc>

" Pressing 'S' will replace current word with last yanked text
nnoremap S diw"0P

" Bubble single lines up/down (using unimpaired)
nmap <M-k> [e
nmap <M-j> ]e

" Indent single lines left/right
nmap <M-h> <<
nmap <M-l> >>

" Visual mode bubble multiple lines up/down (using unimpaired)
vmap <M-k> [e`[V`]
vmap <M-j> ]e`[V`]

" Visual mode bubble multiple lines left/right
vmap <M-h> <`[V`]
vmap <M-l> >`[V`]

imap <S-BS> <C-W>
inoremap <S-BS> <C-W>
set backspace=indent,eol,start

" Use 'M' to jump to a mark and center viewport
map <expr> M printf('`%c zz', getchar())


" Movement ---------------------------------------------------------------------

" j/k moves even for a wrapping line
nmap j gj
nmap k gk

" gp selects pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Filetypes --------------------------------------------------------------------

" Show current file type:
"   :set filetype?

augroup filetypes
    autocmd!
    autocmd FileType clojure    setlocal ts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=4 sw=4 expandtab equalprg=eslint-pretty ff=unix
    autocmd FileType json       setlocal equalprg=json_reformat " json_reformat is part of yajl: http://lloyd.github.com/yajl/
    autocmd FileType xml        setlocal equalprg=xmllint\ --format\ -
    autocmd Filetype css        setlocal ts=2 sw=2 expandtab
    autocmd Filetype cucumber   setlocal ts=2 sw=2 expandtab
    autocmd Filetype feature    setlocal ts=2 sw=2 expandtab
    autocmd Filetype haml       setlocal ts=2 sw=2 expandtab
    autocmd Filetype html       setlocal ts=2 sw=2 expandtab
    autocmd Filetype jade       setlocal ts=2 sw=2 expandtab
    autocmd Filetype less       setlocal ts=2 sw=2 expandtab
    autocmd Filetype markdown   setlocal ts=2 sw=2 expandtab wrap linebreak nolist spell
    autocmd Filetype pug        setlocal ts=2 sw=2 expandtab
    autocmd Filetype ruby       setlocal ts=2 sw=2 expandtab
    autocmd Filetype sass       setlocal ts=2 sw=2 expandtab
    autocmd Filetype scss       setlocal ts=2 sw=2 expandtab
    autocmd Filetype stylus     setlocal ts=2 sw=2 expandtab
    autocmd Filetype taskpaper  setlocal tabstop=2 shiftwidth=2 noexpandtab nolist spell
    autocmd Filetype text       setlocal ts=2 sw=2 expandtab wrap linebreak nolist spell
    autocmd Filetype txt        setlocal ts=2 sw=2 expandtab wrap linebreak nolist spell
    autocmd Filetype yaml       setlocal ts=2 sw=2 expandtab
augroup END

augroup filetypedetect
    au BufRead,BufNewFile *.js set filetype=javascript
augroup END

" No git-gutter for taskpaper files
autocmd BufReadPre *.taskpaper let g:gitgutter_enabled = 0

let g:vim_json_syntax_conceal = 0

" Fuzzy Search -----------------------------------------------------------------

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|bower_components$\|dist$\|node_modules$\|build$\|test$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

" NerdTree ---------------------------------------------------------------------

let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.DS_Store$']


" Ag / Project Search ----------------------------------------------------------

let g:ag_prg = "/usr/local/bin/ag --column"

let g:ag_highlight = 1

" Alias Ack command for Ag (old habbit)
cabbrev Ack LAg


" Window Movement --------------------------------------------------------------

" Resize window (arrow keys)
nmap <left>  :3wincmd <<cr>
nmap <right> :3wincmd ><cr>
nmap <up>    :3wincmd +<cr>
nmap <down>  :3wincmd -<cr>


" GoldenView -------------------------------------------------------------------

let g:goldenview__enable_at_startup = 1

" dunno why GoldenView stopped init'ing at startup, but this fixes it
autocmd VimEnter * EnableGoldenViewAutoResize

" Tests Navigation -------------------------------------------------------------

function! CurrentFileTestSplit()
  exec ":only"
  if CurrentFileIsTest()
    exec ":leftabove vsplit " . CurrentFileAlternate()
  else
    exec ":rightbelow vsplit " . CurrentFileAlternate()
  end
  exec ":GoldenViewResize"
endfunction

function! CurrentFileIsTest()
  return match(expand('%'), '\.test\.[^\.]\+$') != -1
endfunction

function! CurrentFileAlternate()
  if CurrentFileIsTest()
    return substitute(expand('%'), '\.test\.\([^\.]\+\)$', '\.\1', 'g')
  end
  return substitute(expand('%'), '\.\([^\.]\+\)$', '\.test\.\1', 'g')
endfunction

function! EditCurrentFileAlternate()
  exec ":e " . CurrentFileAlternate()
endfunction


" NukeUnusedBuffers() ----------------------------------------------------------

" :call NukeUnusedBuffers()
" remove unused (not visible) buffers

function! NukeUnusedBuffers()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction


" tComment ---------------------------------------------------------------------

call tcomment#type#Define('cucumber', '# %s')
call tcomment#type#Define('pug', '//- %s')
call tcomment#type#Define('python', '# %s')
call tcomment#type#Define('sass', '// %s')
call tcomment#type#Define('slim', '/ %s')


" GitGutter --------------------------------------------------------------------

" Back off there gitgutter, and stop slowing down tab rendering
let g:gitgutter_eager = 0


" EasyAlign --------------------------------------------------------------------

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)"


" Auto Pairs -------------------------------------------------------------------

let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'


" Deoplete ---------------------------------------------------------------------

let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1

" incantation to get normal tab completion behavior with deoplete
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}


" Neosnippets ------------------------------------------------------------------

" disable all runtime snippets
let g:neosnippet#disable_runtime_snippets = { '_' : 1,  }

" only use custom snippets
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

imap <right>    <Plug>(neosnippet_expand_or_jump)
smap <right>    <Plug>(neosnippet_expand_or_jump)
xmap <right>    <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


" Neomake ----------------------------------------------------------------------

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_pug_enabled_makers = ['puglint']

let g:neomake_warning_sign={'texthl': 'NeomakeErrorMsg'}
let g:neomake_error_sign={'texthl': 'NeomakeErrorMsg'}

autocmd! BufWritePost * Neomake


" Supertab ---------------------------------------------------------------------

" Fix deoplete menu order
" https://github.com/ervandew/supertab#frequently-asked-questions
let g:SuperTabDefaultCompletionType = "<c-n>"


" Neovim Terminal Mode ---------------------------------------------------------

if has('nvim')
    " backtick sends true escape
    " tnoremap ` <Esc>
    " pre Esc twice to exit
    tnoremap <Esc><Esc> <c-\><c-n>
    au WinEnter *pid:* call feedkeys('i')
endif

" hide line numbers on terminal
au TermOpen * setlocal nonumber norelativenumber


" Neoterm ----------------------------------------------------------------------

let g:neoterm_shell = "bash"

" Color Scheme -----------------------------------------------------------------

" Show syntax highlighting groups for word under cursor (ctrl-s)
nmap <C-S> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" currently using a custom color scheme (in progress)
colorscheme mine


" Javascript Stuff -------------------------------------------------------------

" let g:jsx_ext_required = 0 " Allow JSX in normal JS files


" Clojure Stuff ----------------------------------------------------------------

let g:parinfer_preview_cursor_scope = 1
autocmd FileType clojure     set cursorcolumn

" LEADER LEADER LEADER LEADER LEADER LEADER LEADER LEADER LEADER LEADER LEADER L
" R LEADER LEADER LEADER LEADER LEADER LEADER LEADER LEADER LEADER LEADER LEADER
" DER LEADER LEADER LEADER LEADER LEADER LEADER LEADER LEADER LEADER LEADER LEAD
" ADER LEADER LEADER LEADER LEADER LEADER LEADER LEADER LEADER LEADER LEADER LEA

" use spacebar for leader!
let mapleader = "\<Space>"

" use leader guide
nnoremap <leader> :<C-U>LeaderGuide ' '<CR>
nnoremap <localleader> :<C-U>LeaderGuide ','<CR>

call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
let g:lmap = {}

" File Tasks ---------------------------

" toggle between tests and implementation with vertical splits
nnoremap <leader>. :call CurrentFileTestSplit()<cr>

let g:lmap.f     = { 'name' : 'File' }
let g:lmap.f.s   = [':w', 'Save']
let g:lmap.f.d   = [':lcd %:p:h', 'Director to Current File Path']

let g:lmap.f.e   = { 'name' : 'Edit' }
let g:lmap.f.e.c = [':e ~/.config/nvim/colors/mine.vim', 'Colors']
let g:lmap.f.e.d = [':e ~/Desktop', 'Desktop']
let g:lmap.f.e.s = [':e ~/.config/nvim/snippets', 'Snippts']
let g:lmap.f.e.v = [':e $MYVIMRC', 'vimrc']
let g:lmap.f.e.t = [':call EditCurrentFileAlternate()', 'Test']

let g:lmap.f.c   = { 'name' : 'Copy' }
let g:lmap.f.c.p = ['let @+ = expand("%:p") | echo @+', 'Current File Path']
let g:lmap.f.c.r = ['let @+ = expand("%") | echo @+', 'Current File Relative Path']

let g:lmap.f.l   = { 'name' : 'List' }
let g:lmap.f.l.m = ['Unite git_modified', 'Modified (git)']
let g:lmap.f.l.c = ['Unite git_cached', 'Cached (git)']
let g:lmap.f.l.u = ['Unite git_untracked', 'Untracked (git)']

let g:lmap.f.r   = { 'name' : 'Read' }
let g:lmap.f.r.v = ['so $MYVIMRC', 'vimrc']

" Window Tasks -------------------------

let g:lmap.w = { 'name' : 'Windows' }
let g:lmap.w.F = ['only | NERDTreeFind | wincmd l | Goyo', 'Hard Focus Window']
let g:lmap.w.Q = [':qa!', 'Quit Hard']
let g:lmap.w.d = ['wincmd d', 'Delete']
let g:lmap.w.f = ['only | NERDTreeFind | wincmd l | GoldenViewResize', 'Focus Window']
let g:lmap.w.h = [':wincmd h', 'Nav Left']
let g:lmap.w.j = [':wincmd j', 'Nav Down']
let g:lmap.w.k = [':wincmd k', 'Nav Up']
let g:lmap.w.l = [':wincmd l', 'Nav Right']
let g:lmap.w.m = [':only', 'Maximize']
let g:lmap.w.q = [':wincmd q', 'Quit']
let g:lmap.w.q = ['wincmd d', 'Delete']
let g:lmap.w.r = [':wincmd r', 'Rotate']
let g:lmap.w.s = [':wincmd s | wincmd j', 'Horizontal Split']
let g:lmap.w.v = [':wincmd v | wincmd l', 'Vertical Split']
let g:lmap.w.z = ['GoldenViewResize', 'Resize Window']

" Tab Tasks ----------------------------

let g:lmap.t = { 'name' : 'Tabs' }

nnoremap <leader>1 :tabn 1<CR>
nnoremap <leader>2 :tabn 2<CR>
nnoremap <leader>3 :tabn 3<CR>
nnoremap <leader>4 :tabn 4<CR>
nnoremap <leader>5 :tabn 5<CR>
nnoremap <leader>6 :tabn 6<CR>
nnoremap <leader>7 :tabn 7<CR>
nnoremap <leader>8 :tabn 8<CR>
nnoremap <leader>9 :tabn 9<CR>

nnoremap <leader>td  :tabclose<CR>
nnoremap <leader>th  :tabnext<CR>
nnoremap <leader>tj  :tabnext<CR>
nnoremap <leader>tk  :tabprev<CR>
nnoremap <leader>tl  :tabprev<CR>
nnoremap <leader>tm  :tabm<Space>
nnoremap <leader>tn  :tabnew<CR>
nnoremap <leader>tt  :tabedit<Space>
" tf 'tab floor' move the current tab all the way left
nnoremap <leader>tf :tabm 0<CR>

nnoremap <leader>t1  :tabn 1<CR>
nnoremap <leader>t2  :tabn 2<CR>
nnoremap <leader>t3  :tabn 3<CR>
nnoremap <leader>t4  :tabn 4<CR>
nnoremap <leader>t5  :tabn 5<CR>
nnoremap <leader>t6  :tabn 6<CR>
nnoremap <leader>t7  :tabn 7<CR>
nnoremap <leader>t8  :tabn 8<CR>
nnoremap <leader>t9  :tabn 9<CR>

let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" Make Tasks ---------------------------

" \m to 'make' save changes / reload REPL, switch to browser
autocmd FileType clojure    nnoremap <leader>m :w<CR>:Require<CR>:!open /Applications/Google\ Chrome\ Canary.app<CR>
autocmd FileType pug        nnoremap <leader>m :w<CR>:Require<CR>:!open /Applications/Google\ Chrome\ Canary.app<CR>
autocmd FileType javascript nnoremap <leader>m :w<CR>:!open /Applications/Google\ Chrome\ Canary.app<CR>


" Lint Tasks ---------------------------

" neomake open location window
nnoremap <leader>lo :lopen<CR>
" neomake close location window
nnoremap <leader>lc :lclose<CR>
" neomake go to current error/warning
nnoremap <leader>ll :ll<CR>
" neomake next error/warning
nnoremap <leader>ln :lnext<CR>
" neomake previous error/warning
nnoremap <leader>lp :lprev<CR>


" \q ever so slightly faster quit command
nnoremap <leader>q :q<CR>

" \d show/hide NerdTree
nnoremap <leader>d :NERDTreeToggle<cr>

" \p to show fuzzy search
nnoremap <leader>p :CtrlP<cr>

" \P clear fuzzy search cache
nnoremap <leader>P :CtrlPClearCache<cr>

" global search with Ag
nnoremap <leader>/ :Ag<space>

" dup a line/selection, with commented version above <-- this is awesome
vnoremap <leader>c y gv :TComment<cr> gv<Esc> p
nnoremap <leader>c V y gv :TComment<cr> gv<Esc> p

" <leader>; auto append semicolon (or comma)
nnoremap <silent> <leader>; :call cosco#commaOrSemiColon()<CR>

" j - insert blank line below
nnoremap <silent> <leader>j :set paste<CR>m`o<Esc>``:set nopaste<CR>
" k - insert blank line above
nnoremap <silent> <leader>k :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Nuke buffers that are not visible
nnoremap <leader>n :call NukeUnusedBuffers()<CR>

" \ts skip tests
nnoremap <leader>ts :%s/test(/test.skip(/g<CR>

" \tu unskip tests
nnoremap <leader>tu :%s/test.skip(/test(/g<CR>

" \r to reload REPL and show last REPL message (Clojure only right now)
nnoremap <leader>r :Require<CR>

" \b to open web browser
nnoremap <leader>b :!open /Applications/Google\ Chrome\ Canary.app<CR>

" \B to open chrome
nnoremap <leader>B :!open /Applications/Google\ Chrome.app<CR>

" ------------------------------------------------------------------------------
"
" < That's all folks >
"  ------------------
"         \   ^__^
"          \  (oo)\_______
"             (__)\       )\/\
"                 ||----w |
"                 ||     ||
" ------------------------------------------------------------------------------
