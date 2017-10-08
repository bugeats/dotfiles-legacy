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
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidoc/taskpaper.vim'
Plug 'digitaltoad/vim-pug'
Plug 'elzr/vim-json'
Plug 'ervandew/supertab'
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
Plug 'zhaocai/GoldenView.Vim'

" Javascript Plugins
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install -g tern' }
Plug 'jiangmiao/auto-pairs',     { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx',              { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/yajs.vim',          { 'for': ['javascript', 'javascript.jsx'] }

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
set statusline+=%=%y%m\                       " right-aligned file type [modified]
set statusline=>>\ %f:%l:%c                   " minimal status line with file name
set synmaxcol=160                             " Don't syntax highlight past 160 cols (perf)
" set t_Co=256                           " Set terminal colors to 256 (tmux)
set t_ut=
set tabstop=4                                 " use four space chars when pressing <tab>
set termguicolors                             " enable true color support
set titlestring=%{fnamemodify(getcwd(),':t')} " set iTerm tab/window title to the current working directory name (project name)
set visualbell                                " don't beep
set wildignore=*.swp,*.pyc


let g:netrw_dirhistmax = 0    " no .netrwhist turds please

" never try to automatically insert commented new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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


" Leader Keys ------------------------------------------------------------------

" use spacebar for leader!
let mapleader = "\<Space>"

" use leader guide
nnoremap <Leader> :<C-U>LeaderGuide ' '<CR>
nnoremap <localleader> :<C-U>LeaderGuide ','<CR>

" File Tasks ---------------------------

nnoremap <Leader>fs :w<CR>
nnoremap <Leader>fed :e ~/Desktop<CR>
nnoremap <Leader>fev :e $MYVIMRC<CR>
nnoremap <Leader>fec :e ~/.config/nvim/colors/mine.vim<CR>
nnoremap <Leader>few :e ~/Dropbox/Apps/Editorial/work.taskpaper<CR>
nnoremap <Leader>fel :e ~/Dropbox/Apps/Editorial/life.taskpaper<CR>
" \fl to set local directory to current file path
nnoremap <Leader>fl :lcd %:p:h<cr>


" Window Tasks -------------------------

nnoremap <Leader>wj :wincmd j<CR>
nnoremap <Leader>wk :wincmd k<CR>
nnoremap <Leader>wl :wincmd l<CR>
nnoremap <Leader>wv :wincmd v<CR> :wincmd l<CR>
nnoremap <Leader>ws :wincmd s<CR> :wincmd j<CR>
nnoremap <Leader>wq :wincmd q<CR>
nnoremap <Leader>wh :wincmd h<CR>
nnoremap <Leader>wr :wincmd r<CR>

" (w)indow-(d)elete
nnoremap <Leader>wd :wincmd q<CR>
" (w)indow-(m)aximize
nnoremap <Leader>wm :only<CR>
" (w)indow-(f)ocus
nnoremap <Leader>wf :only<CR>:NERDTree<CR>:wincmd l<CR>:GoldenViewResize<CR>

nnoremap <c-j> :wincmd j<CR>
nnoremap <c-k> :wincmd k<CR>
nnoremap <c-l> :wincmd l<CR>
nnoremap <c-v> :wincmd v<CR> :wincmd l<CR>
nnoremap <c-s> :wincmd s<CR> :wincmd j<CR>
nnoremap <c-q> :wincmd q<CR>
nnoremap <c-h> :wincmd h<CR>
nnoremap <c-d> :wincmd q<CR>
nnoremap <c-m> :only<CR>

" Tab Tasks ----------------------------

nnoremap <Leader>1 :tabn 1<CR>
nnoremap <Leader>2 :tabn 2<CR>
nnoremap <Leader>3 :tabn 3<CR>
nnoremap <Leader>4 :tabn 4<CR>
nnoremap <Leader>5 :tabn 5<CR>
nnoremap <Leader>6 :tabn 6<CR>
nnoremap <Leader>7 :tabn 7<CR>
nnoremap <Leader>8 :tabn 8<CR>
nnoremap <Leader>9 :tabn 9<CR>

nnoremap <Leader>td  :tabclose<CR>
nnoremap <Leader>th  :tabnext<CR>
nnoremap <Leader>tj  :tabnext<CR>
nnoremap <Leader>tk  :tabprev<CR>
nnoremap <Leader>tl  :tabprev<CR>
nnoremap <Leader>tm  :tabm<Space>
nnoremap <Leader>tn  :tabnew<CR>
nnoremap <Leader>tt  :tabedit<Space>
" tf 'tab floor' move the current tab all the way left
nnoremap <Leader>tf :tabm 0<CR>

nnoremap <Leader>t1  :tabn 1<CR>
nnoremap <Leader>t2  :tabn 2<CR>
nnoremap <Leader>t3  :tabn 3<CR>
nnoremap <Leader>t4  :tabn 4<CR>
nnoremap <Leader>t5  :tabn 5<CR>
nnoremap <Leader>t6  :tabn 6<CR>
nnoremap <Leader>t7  :tabn 7<CR>
nnoremap <Leader>t8  :tabn 8<CR>
nnoremap <Leader>t9  :tabn 9<CR>


" Make Tasks ---------------------------

" \m to 'make' save changes / reload REPL, switch to browser
autocmd FileType clojure    nnoremap <Leader>m :w<CR>:Require<CR>:!open /Applications/Google\ Chrome\ Canary.app<CR>
autocmd FileType pug        nnoremap <Leader>m :w<CR>:Require<CR>:!open /Applications/Google\ Chrome\ Canary.app<CR>
autocmd FileType javascript nnoremap <Leader>m :w<CR>:!open /Applications/Google\ Chrome\ Canary.app<CR>


" Lint Tasks ---------------------------

" neomake open location window
nnoremap <Leader>lo :lopen<CR>
" neomake close location window
nnoremap <Leader>lc :lclose<CR>
" neomake go to current error/warning
nnoremap <Leader>ll :ll<CR>
" neomake next error/warning
nnoremap <Leader>ln :lnext<CR>
" neomake previous error/warning
nnoremap <Leader>lp :lprev<CR>


" \q ever so slightly faster quit command
nnoremap <Leader>q :q<CR>

" \d show/hide NerdTree
nnoremap <Leader>d :NERDTreeToggle<cr>

" \p to show fuzzy search
nnoremap <Leader>p :CtrlP<cr>

" \P clear fuzzy search cache
nnoremap <Leader>P :CtrlPClearCache<cr>

" global search with Ag
nnoremap <Leader>/ :Ag<space>

" dup a line/selection, with commented version above <-- this is awesome
vnoremap <Leader>c y gv :TComment<cr> gv<Esc> p
nnoremap <Leader>c V y gv :TComment<cr> gv<Esc> p

" <Leader>; auto append semicolon (or comma)
nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>

" j - insert blank line below
nnoremap <silent> <Leader>j :set paste<CR>m`o<Esc>``:set nopaste<CR>
" k - insert blank line above
nnoremap <silent> <Leader>k :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Nuke buffers that are not visible
nnoremap <Leader>n :call NukeUnusedBuffers()<CR>

" \ts skip tests
nnoremap <Leader>ts :%s/test(/test.skip(/g<CR>

" \tu unskip tests
nnoremap <Leader>tu :%s/test.skip(/test(/g<CR>

" \r to reload REPL and show last REPL message (Clojure only right now)
nnoremap <Leader>r :Require<CR>

" \b to open web browser
nnoremap <Leader>b :!open /Applications/Google\ Chrome\ Canary.app<CR>

" Leader Guide -----------------------------------------------------------------

let g:lmap =  {}
let g:lmap.f = { 'name' : 'File Menu' }
let g:lmap.w = { 'name' : 'Windows' }

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
    autocmd FileType javascript setlocal ts=4 sw=4 expandtab equalprg=eslint-pretty
    autocmd FileType json       setlocal equalprg=json_reformat " json_reformat is part of yajl: http://lloyd.github.com/yajl/
    autocmd FileType xml        setlocal equalprg=xmllint\ --format\ -
    autocmd Filetype css        setlocal ts=2 sw=2 expandtab
    autocmd Filetype cucumber   setlocal ts=2 sw=2 expandtab
    autocmd Filetype feature    setlocal ts=2 sw=2 expandtab
    autocmd Filetype haml       setlocal ts=2 sw=2 expandtab
    autocmd Filetype html       setlocal ts=2 sw=2 expandtab
    autocmd Filetype jade       setlocal ts=2 sw=2 expandtab
    autocmd Filetype less       setlocal ts=2 sw=2 expandtab
    autocmd Filetype markdown   setlocal ts=2 sw=2 expandtab wrap linebreak nolist
    autocmd Filetype pug        setlocal ts=2 sw=2 expandtab
    autocmd Filetype ruby       setlocal ts=2 sw=2 expandtab
    autocmd Filetype sass       setlocal ts=2 sw=2 expandtab
    autocmd Filetype scss       setlocal ts=2 sw=2 expandtab
    autocmd Filetype stylus     setlocal ts=2 sw=2 expandtab
    autocmd Filetype taskpaper  setlocal tabstop=2 shiftwidth=2 noexpandtab nolist
    autocmd Filetype text       setlocal ts=2 sw=2 expandtab wrap linebreak nolist
    autocmd Filetype txt        setlocal ts=2 sw=2 expandtab wrap linebreak nolist
    autocmd Filetype yaml       setlocal ts=2 sw=2 expandtab
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

call tcomment#DefineType('cucumber', '# %s')
call tcomment#DefineType('pug', '//- %s')
call tcomment#DefineType('python', '# %s')
call tcomment#DefineType('sass', '// %s')
call tcomment#DefineType('slim', '/ %s')


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


" Clojure Stuff ----------------------------------------------------------------

let g:parinfer_preview_cursor_scope = 1
autocmd FileType clojure     set cursorcolumn


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
