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
Plug 'benekastah/neomake'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'davidoc/taskpaper.vim'
Plug 'digitaltoad/vim-pug'
Plug 'ervandew/supertab'
Plug 'groenewege/vim-less'
Plug 'henrik/vim-indexed-search'
Plug 'ivyl/vim-bling'
Plug 'jakar/vim-json'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'jiangmiao/auto-pairs', { 'for': ['javascript'] }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kassio/neoterm'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'lfilho/cosco.vim'
Plug 'mkitt/tabline.vim'
Plug 'mxw/vim-jsx'
Plug 'neovim/node-host'
Plug 'nono/vim-handlebars'
Plug 'ntpeters/vim-better-whitespace'
Plug 'othree/yajs.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'wavded/vim-stylus'
Plug 'zhaocai/GoldenView.Vim'

" Clojure stuff
Plug 'guns/vim-clojure-highlight', { 'for': ['clojure'] }
Plug 'guns/vim-clojure-static', { 'for': ['clojure'] }
Plug 'snoe/nvim-parinfer.js', { 'for': ['clojure'], 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-classpath', { 'for': ['clojure'] }
Plug 'tpope/vim-dispatch', { 'for': ['clojure'] }
Plug 'tpope/vim-fireplace', { 'for': ['clojure'] }
Plug 'tpope/vim-projectionist', { 'for': ['clojure'] }
Plug 'tpope/vim-salve', { 'for': ['clojure'] }
Plug 'venantius/vim-cljfmt', { 'for': ['clojure'] }
Plug 'venantius/vim-eastwood', { 'for': ['clojure'] }

call plug#end()


" Preferences / Defaults -------------------------------------------------------

syntax on

set autoindent
set autoread
set background=dark
set backupdir=./.backup,.,/tmp
set clipboard=unnamed         " support OS X clipboard
set cursorline                " highlighted cursor row
set cursorcolumn              " highlighted cursor column
set expandtab                 " insert spaces instead when pressing <tab>
set formatoptions-=cro        " no annoying comment autoformat foo
set guifont=DroidSansMono:h14 " This is the best programming font. I declare it.
set guitablabel=%M%t\ (%F)    " minimal GUI tab label
set hidden                    " Don't need to see abandoned buffers
set hlsearch
set ignorecase
set list
set listchars=tab:▸\ ,eol:¬   " Use same symbols as TextMate for tabstops & EOLs
set nobackup
set noerrorbells              " don't beep, asshole
set noswapfile
set nowrap
set number
set ruler
set rulerformat=%cx%l%V%=%P
set shell=/bin/bash
set shiftwidth=4              " default to 4 spaces for indentation
set showtabline=2             " always show tab line
set smartindent
set statusline=>>\ %f:%l:%c " minimal status line with file name
set statusline+=%=%y%m\       " right-aligned file type [modified]
set synmaxcol=160             " Don't syntax highlight past 160 cols (perf)
set t_Co=256                  " Set terminal colors to 256 (tmux)
set tabstop=4                 " use four space chars when pressing <tab>
set visualbell                " don't beep
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

" \q ever so slightly faster quit command
nnoremap <Leader>q :q<CR>

" \w ever so slightly faster write command
nnoremap <Leader>w :w<CR>

" \d show/hide NerdTree
nnoremap <Leader>d :NERDTreeToggle<cr>

" \l to set local directory to current file path
nnoremap <Leader>l :lcd %:p:h<cr>

" \p to show fuzzy search
nnoremap <Leader>p :CtrlP<cr>

" \P clear fuzzy search cache
nnoremap <Leader>P :CtrlPClearCache<cr>

" \f global search with Ag
nnoremap <Leader>f :Ag<space>

" dup a line/selection, with commented version above <-- this is awesome
vnoremap <Leader>c y gv :TComment<cr> gv<Esc> p
nnoremap <Leader>c V y gv :TComment<cr> gv<Esc> p

" <Leader>; auto append semicolon (or comma)
nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>

" j - insert blank line below
nnoremap <silent> <Leader>j :set paste<CR>m`o<Esc>``:set nopaste<CR>
" k - insert blank line above
nnoremap <silent> <Leader>k :set paste<CR>m`O<Esc>``:set nopaste<CR>

" quick tab selection
nnoremap <Leader>1 :tabn 1<CR>
nnoremap <Leader>2 :tabn 2<CR>
nnoremap <Leader>3 :tabn 3<CR>
nnoremap <Leader>4 :tabn 4<CR>
nnoremap <Leader>5 :tabn 5<CR>
nnoremap <Leader>6 :tabn 6<CR>
nnoremap <Leader>7 :tabn 7<CR>
nnoremap <Leader>8 :tabn 8<CR>
nnoremap <Leader>9 :tabn 9<CR>

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

" \m to 'make' save changes / reload REPL, switch to browser
autocmd FileType clojure    nnoremap <Leader>m :w<CR>:Require<CR>:!open /Applications/Google\ Chrome\ Canary.app<CR>
autocmd FileType pug        nnoremap <Leader>m :w<CR>:Require<CR>:!open /Applications/Google\ Chrome\ Canary.app<CR>
autocmd FileType javascript nnoremap <Leader>m :w<CR>:!open /Applications/Google\ Chrome\ Canary.app<CR>


" Movement ---------------------------------------------------------------------

" j/k moves even for a wrapping line
nmap j gj
nmap k gk


" Navigation -------------------------------------------------------------------

" Tab nav shortcuts
nnoremap td  :tabclose<CR>
nnoremap th  :tabnext<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tabprev<CR>
nnoremap tm  :tabm<Space>
nnoremap tn  :tabnew<CR>
nnoremap tt  :tabedit<Space>

nnoremap t1  :tabn 1<CR>
nnoremap t2  :tabn 2<CR>
nnoremap t3  :tabn 3<CR>
nnoremap t4  :tabn 4<CR>
nnoremap t5  :tabn 5<CR>
nnoremap t6  :tabn 6<CR>
nnoremap t7  :tabn 7<CR>
nnoremap t8  :tabn 8<CR>
nnoremap t9  :tabn 9<CR>

" tf 'tab floor' move the current tab all the way left
nnoremap tf :tabm 0<CR>



" Filetypes --------------------------------------------------------------------

" Show current file type:
"   :set filetype?

augroup filetypes
    autocmd!
    autocmd FileType clojure    setlocal ts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=4 sw=4 expandtab equalprg=eslint-pretty
    autocmd FileType json       setlocal equalprg=json_reformat " json_reformat is part of yajl: http://lloyd.github.com/yajl/
    autocmd FileType xml        setlocal equalprg=xmllint\ --format\ -
    autocmd Filetype coffee     setlocal ts=2 sw=2 expandtab
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
    autocmd Filetype taskpaper  setlocal nolist
    autocmd Filetype text       setlocal ts=2 sw=2 expandtab wrap linebreak nolist
    autocmd Filetype txt        setlocal ts=2 sw=2 expandtab wrap linebreak nolist
    autocmd Filetype yaml       setlocal ts=2 sw=2 expandtab
augroup END

" No git-gutter for taskpaper files
autocmd BufReadPre *.taskpaper let g:gitgutter_enabled = 0


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

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd " . a:key
  if (t:curwin == winnr()) " we havent moved
    if (match(a:key,'[jk]')) " were we going up/down
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

" Window movement by CTRL prefix
map <C-h> :call WinMove('h')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>
map <C-j> :call WinMove('j')<cr>

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

call tcomment#DefineType('python', '# %s')
call tcomment#DefineType('coffee', '# %s')
call tcomment#DefineType('sass', '// %s')
call tcomment#DefineType('slim', '/ %s')
call tcomment#DefineType('cucumber', '# %s')


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


" Neomake ----------------------------------------------------------------------

let g:neomake_javascript_enabled_makers = ['eslint']

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

" enable true color support
set termguicolors

" currently using a custom color scheme (in progress)
colorscheme mine


" Parinfer ---------------------------------------------------------------------

let g:parinfer_preview_cursor_scope = 1


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
