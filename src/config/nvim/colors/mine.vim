" Reset -----------------------------------------------------------------------

set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "mine"

" hide hidden chars in nerdtree
autocmd FileType nerdtree setlocal nolist

" hide hidden chars in terminal
au TermOpen * setlocal nolist

" Palette ----------------------------------------------------------------------

let s:p = {}

let s:p.a1 = "#ce9991"
let s:p.b1 = "#9dac76"
let s:p.g1 = "#bba279"
let s:p.d1 = "#a3a79b"
let s:p.t1 = "#78b28c"
let s:p.k1 = "#64b2b8"
let s:p.a2 = "#a36c63"
let s:p.b2 = "#708042"
let s:p.g2 = "#907645"
let s:p.d2 = "#787b72"
let s:p.t2 = "#43875d"
let s:p.k2 = "#10878d"
let s:p.a3 = "#625251"
let s:p.b3 = "#53584a"
let s:p.g3 = "#5c554b"
let s:p.d3 = "#555751"
let s:p.t3 = "#4b594f"
let s:p.k3 = "#47595b"
let s:p.a4 = "#423b3a"
let s:p.b4 = "#3b3d37"
let s:p.g4 = "#3f3c37"
let s:p.d4 = "#3c3d39"
let s:p.t4 = "#373e39"
let s:p.k4 = "#363e3e"
let s:p.a5 = "#302c2c"
let s:p.b5 = "#2c2d2a"
let s:p.g5 = "#2e2d2a"
let s:p.d5 = "#2c2d2b"
let s:p.t5 = "#2a2e2b"
let s:p.k5 = "#2a2e2e"
let s:p.a6 = "#2a2727"
let s:p.b6 = "#272826"
let s:p.g6 = "#292826"
let s:p.d6 = "#272826"
let s:p.t6 = "#262827"
let s:p.k6 = "#262829"

" call s:HL("BlingHilight", s:p.bg, s:p.qq)

" Functions --------------------------------------------------------------------

function! s:linkGroup(item, toLink)
    for g in a:toLink
        let linkCmd = 'hi! link ' . g . ' ' . a:item
        execute linkCmd
    endfor
endfunction

function! s:smartHi(group, ...)
    " Arguments: group, guifg, guibg
    let chunks = ['hi!', a:group]

    if strlen(a:1)
        call add(chunks, 'guifg=' . a:1)
    endif

    if strlen(a:2)
        call add(chunks, 'guibg=' . a:2)
    endif

    call add(chunks, 'gui=NONE')
    call add(chunks, 'ctermfg=NONE')
    call add(chunks, 'ctermbg=NONE')
    call add(chunks, 'cterm=NONE')

    let cmd = join(chunks, ' ')

    " echom cmd
    execute cmd
endfunction


" Main Groups ------------------------------------------------------------------

call s:smartHi('Normal',                    s:p.d1, s:p.a6)
call s:smartHi('RedshiftNormal',            s:p.d1, s:p.a6)
call s:smartHi('RedshiftComment',           s:p.d2, '')
call s:smartHi('RedshiftControl',           s:p.a2, '')
call s:smartHi('RedshiftControlActive',     s:p.a1, '')
call s:smartHi('RedshiftKeyword',           s:p.b1, '')
call s:smartHi('RedshiftLiteral',           s:p.g1, s:p.a6)
call s:smartHi('RedshiftGhost',             s:p.a3, '')
call s:smartHi('RedshiftGhostActive',       s:p.g2, s:p.a5)
call s:smartHi('RedshiftLocated',           '',     s:p.a5)
call s:smartHi('RedshiftChromeNormal',      s:p.a2, s:p.a6)
call s:smartHi('RedshiftChromeMin',         s:p.a3, s:p.a6)
call s:smartHi('RedshiftChromePanel',       s:p.a2, s:p.a4)
call s:smartHi('RedshiftChromePanelActive', s:p.a1, s:p.a4)
call s:smartHi('RedshiftHighlighted',       s:p.k1, s:p.k4)
call s:smartHi('RedshiftSelected',          '',     s:p.k4)
call s:smartHi('RedshiftAttention',         s:p.k1, '')

call s:smartHi('RedshiftGreen',  s:p.t2, '')
call s:smartHi('RedshiftYellow', s:p.b2, '')
call s:smartHi('RedshiftRed',    s:p.a2, '')

" Links ------------------------------------------------------------------------

call s:linkGroup('RedshiftNormal', [
    \"ColorColumn",
    \"Conceal",
    \"Constant",
    \"CursorColumn",
    \"CursorIM",
    \"DiffAdd",
    \"DiffChange",
    \"DiffDelete",
    \"DiffText",
    \"Directory",
    \"EndOfBuffer",
    \"FoldColumn",
    \"Folded",
    \"Function",
    \"Identifier",
    \"IncSearch",
    \"ModeMsg",
    \"MoreMsg",
    \"Normal",
    \"PreProc",
    \"Question",
    \"SignColumn",
    \"Special",
    \"SpecialKey",
    \"SpellBad",
    \"SpellCap",
    \"SpellLocal",
    \"SpellRare",
    \"Statement",
    \"TermCursorNC",
    \"Title",
    \"Todo",
    \"Type",
    \"Underlined",
    \"VisualNOS",
    \"WarningMsg",
    \"WildMenu",
    \"String",
    \"javascriptRegexpString",
    \"javascriptMethod",
    \"javascriptHeadersMethod",
\])

call s:linkGroup('RedshiftComment', [
    \"Comment",
    \"vimLineComment",
\])

call s:linkGroup('RedshiftControl', [
    \"javascriptArrowFunc",
    \"javascriptArrowFuncDef",
    \"javascriptBraces",
    \"javascriptBrackets",
    \"javascriptComma",
    \"javascriptDotNotation",
    \"javascriptEndColons",
    \"javascriptObjectLabelColon",
    \"javascriptOpSymbol",
    \"javascriptParens",
    \"javascriptProperty",
    \"javascriptTemplateSB",
    \"jsonBraces",
    \"stylusProperty",
    \"stylusVariableAssignment",
    \"vimContinue",
    \"vimParenSep",
\])

call s:linkGroup('RedshiftControlActive', [
    \"MatchParen",
\])

call s:linkGroup('RedshiftKeyword', [
    \"Keyword",
    \"javascriptReturn",
    \"javascriptVariable",
    \"javascriptOperator",
    \"javascriptExceptions",
    \"Boolean",
    \"vimLet",
    \"vimCommand",
\])

call s:linkGroup('RedshiftLiteral', [
    \"String",
    \"javascriptRegexpString",
\])

call s:linkGroup('RedshiftGhost', [
    \"Conceal",
    \"NonText",
    \"SpecialKey",
    \"LineNr",
\])

call s:linkGroup('RedshiftGhostActive', [
    \"CursorLineNr",
\])

call s:linkGroup('RedshiftLocated', [
    \"CursorLine",
\])

call s:linkGroup('RedshiftHighlighted', [
    \"Search",
\])

call s:linkGroup('RedshiftSelected', [
    \"Visual",
    \"iCursor",
    \"Cursor",
    \"TermCursor",
\])

call s:linkGroup('RedshiftAttention', [
    \"Error",
    \"ErrorMsg",
\])

" ----

call s:linkGroup('RedshiftChromeNormal', [
    \"NERDTreeCWD",
    \"NERDTreeDir",
    \"NERDTreeFile",
    \"NERDTreeExecFile",
\])

call s:linkGroup('RedshiftChromeMin', [
    \"NERDTreeDirSlash",
    \"NERDTreeOpenable",
    \"NERDTreeClosable",
    \"NERDTreeFlags",
\])

call s:linkGroup('RedshiftChromePanel', [
    \"StatusLineNC",
    \"TabLine",
    \"TabLineFill",
    \"VertSplit",
    \"Pmenu",
    \"PmenuSbar",
    \"PmenuThumb",
\])

call s:linkGroup('RedshiftChromePanelActive', [
    \"TabLineSel",
    \"PmenuSel",
    \"StatusLine",
\])

call s:linkGroup('RedshiftAttention', [
    \"ExtraWhitespace",
\])

" ----

call s:linkGroup('RedShiftGreen', [
    \"DiffAdd",
    \"GitGutterAdd",
    \"GitGutterAddDefault",
    \"NERDTreeGitStatusModified",
\])

call s:linkGroup('RedShiftYellow', [
    \"DiffChange",
    \"GitGutterChange",
    \"GitGutterChangeDelete",
    \"GitGutterChangeDefault",
    \"GitGutterChangeDeleteDefault",
    \"NERDTreeGitStatusDirDirty",
\])

call s:linkGroup('RedShiftRed', [
    \"DiffDelete",
    \"GitGutterDelete",
    \"GitGutterDeleteDefault",
\])


