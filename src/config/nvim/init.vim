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

call plug#begin('~/.config/nvim/plugged')

Plug 'Lokaltog/vim-easymotion'
Plug 'Valloric/YouCompleteMe'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'davidoc/taskpaper.vim'
Plug 'digitaltoad/vim-jade'
Plug 'ervandew/supertab'
Plug 'groenewege/vim-less'
Plug 'ivyl/vim-bling'
Plug 'jakar/vim-json'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kassio/neoterm'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'lfilho/cosco.vim'
Plug 'mkitt/tabline.vim'
Plug 'mxw/vim-jsx'
Plug 'nono/vim-handlebars'
Plug 'ntpeters/vim-better-whitespace'
Plug 'othree/yajs.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'wavded/vim-stylus'
Plug 'zhaocai/GoldenView.Vim'

call plug#end()


" Preferences / Defaults
" ------------------------------------------------------------------------------

syntax on

set autoindent
set autoread
set background=dark
set backupdir=./.backup,.,/tmp
set clipboard=unnamed         " support OS X clipboard
set cursorline
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
set statusline+=%=%y%m\       " right-aligned file type [modified]
set statusline=>>>>\ %t:%l:%c " minimal status line with file name
set synmaxcol=160             " Don't syntax highlight past 160 cols (perf)
set t_Co=256                  " Set terminal colors to 256 (tmux)
set tabstop=4                 " use four space chars when pressing <tab>
set visualbell                " don't beep
set wildignore=*.swp,*.pyc

let g:netrw_dirhistmax = 0    " no .netrwhist turds please

" Mappings
" ------------------------------------------------------------------------------

" Weird hack to fix arrow keys in tmux
map <Esc>[B <Down>

" Pressing ESC will clear any current search term highlighting
" nnoremap <esc> :noh<return><esc>

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


" Leader Keys
" ------------------------------------------------------------------------------

" use spacebar for leader!
let mapleader = "\<Space>"

" \q ever so slightly faster quit command
nnoremap <Leader>q :q<CR>

" \w ever so slightly faster write command
nnoremap <Leader>w :w<CR>

" \d show/hide NerdTree
nnoremap <Leader>d :NERDTreeToggle<cr>

" \p to show fuzzy search
nnoremap <Leader>p :CtrlP<cr>

" \P clear fuzzy search cache
nnoremap <Leader>P :CtrlPClearCache<cr>

" \f global search with Ag
nnoremap <Leader>f :LAg<space>

" dup a line/selection, with commented version above
vnoremap <Leader>c y gv :TComment<cr> gv<Esc> p
nnoremap <Leader>c V y gv :TComment<cr> gv<Esc> p

" <Leader>; auto append semicolon (or comma)
nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>


" Movement
" ------------------------------------------------------------------------------

" j/k moves even for a wrapping line
nmap j gj
nmap k gk


" Navigation
" ------------------------------------------------------------------------------

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


" Filetypes
" ------------------------------------------------------------------------------

" Show current file type:
"   :set filetype?

augroup filetypes
    autocmd!
    autocmd FileType json       setlocal equalprg=json_reformat " json_reformat is part of yajl: http://lloyd.github.com/yajl/
    autocmd Filetype coffee     setlocal ts=2 sw=2 expandtab
    autocmd Filetype css        setlocal ts=2 sw=2 expandtab
    autocmd Filetype cucumber   setlocal ts=2 sw=2 expandtab
    autocmd Filetype feature    setlocal ts=2 sw=2 expandtab
    autocmd Filetype haml       setlocal ts=2 sw=2 expandtab
    autocmd Filetype html       setlocal ts=2 sw=2 expandtab
    autocmd Filetype jade       setlocal ts=2 sw=2 expandtab
    autocmd Filetype less       setlocal ts=2 sw=2 expandtab
    autocmd Filetype markdown   setlocal ts=2 sw=2 expandtab wrap linebreak nolist
    autocmd Filetype ruby       setlocal ts=2 sw=2 expandtab
    autocmd Filetype sass       setlocal ts=2 sw=2 expandtab
    autocmd Filetype scss       setlocal ts=2 sw=2 expandtab
    autocmd Filetype stylus     setlocal ts=2 sw=2 expandtab
    autocmd Filetype taskpaper  setlocal nolist
    autocmd Filetype text       setlocal ts=2 sw=2 expandtab wrap linebreak nolist
    autocmd Filetype txt        setlocal ts=2 sw=2 expandtab wrap linebreak nolist
    autocmd Filetype yaml       setlocal ts=2 sw=2 expandtab
    " TEMP for this dumb project
    autocmd Filetype html setlocal ts=4 sw=4 expandtab
    autocmd Filetype less setlocal ts=4 sw=4 expandtab
augroup END


" Fuzzy Search
" ------------------------------------------------------------------------------

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|bower_components$\|dist$\|node_modules$\|build$\|test$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }


" NerdTree
" ------------------------------------------------------------------------------

let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.DS_Store$']


" Ag / Project Search
" ------------------------------------------------------------------------------

let g:ag_prg = "/usr/local/bin/ag --column"

let g:ag_highlight = 1

" Alias Ack command for Ag (old habbit)
cabbrev Ack LAg


" Window Movement
" ------------------------------------------------------------------------------

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
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


" CoffeeScript
" ------------------------------------------------------------------------------

let coffee_no_trailing_space_error = 1

" .ojc files are coffeescript
au BufRead,BufNewFile *.ojc set filetype=php


" tComment
" ------------------------------------------------------------------------------

call tcomment#DefineType('python', '# %s')
call tcomment#DefineType('coffee', '# %s')
call tcomment#DefineType('sass', '// %s')
call tcomment#DefineType('slim', '/ %s')
call tcomment#DefineType('cucumber', '# %s')


" GitGutter
" ------------------------------------------------------------------------------

" Back off there gitgutter, and stop slowing down tab rendering
let g:gitgutter_eager = 0


" EasyAlign
" ------------------------------------------------------------------------------

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)"


" Javascript
" ------------------------------------------------------------------------------

" Tomorrow-Night colors
"   Keyword: orange
"   Structure: purple
"   Identifier: red
"   Operator: aqua
"   String: green
"   cType: yellow

" Hacks to force tomorrow night theme colors the way I like
highlight link javascriptExport Keyword
highlight link javascriptImport Keyword
highlight link javascriptReturn Structure
highlight link javascriptConditional Structure
highlight link javascriptConditionalElse Structure
highlight link javaScriptBraces Operator
highlight link javascriptBraces Operator
highlight link javascriptParens Operator

" JSX (React)
highlight link xmlTagName cType
highlight link xmlTag cType
highlight link xmlEndTag cType
highlight link xmlAttrib cType
highlight link xmlEqual cType


" Auto Pairs
" ------------------------------------------------------------------------------

let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'


" Neomake
" ------------------------------------------------------------------------------

let g:neomake_javascript_enabled_makers = ['eslint_d']

autocmd! BufWritePost * Neomake


" Neovim Terminal Mode
" ------------------------------------------------------------------------------

if has('nvim')
    " backtick sends true escape
    " tnoremap ` <Esc>
    " pre Esc twice to exit
    tnoremap <Esc><Esc> <c-\><c-n>
    au WinEnter *pid:* call feedkeys('i')
endif


" Color Scheme
" ------------------------------------------------------------------------------

" Show syntax highlighting groups for word under cursor (ctrl-s)
nmap <C-S> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

colorscheme Tomorrow-Night

highlight TabLineSel guifg=orange


" < That's all folks >
"  ------------------
"         \   ^__^
"          \  (oo)\_______
"             (__)\       )\/\
"                 ||----w |
"                 ||     ||
" ------------------------------------------------------------------------------
