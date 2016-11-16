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

let s:p.a1 = "#d8af8e"
let s:p.b1 = "#94c390"
let s:p.g1 = "#bbba81"
let s:p.d1 = "#b8b8aa"
let s:p.t1 = "#71c6af"
let s:p.k1 = "#83bfda"
let s:p.a2 = "#a57b55"
let s:p.b2 = "#5d9058"
let s:p.g2 = "#888744"
let s:p.d2 = "#84847c"
let s:p.t2 = "#22947b"
let s:p.k2 = "#418da9"
let s:p.a3 = "#645851"
let s:p.b3 = "#525e51"
let s:p.g3 = "#5c5b4e"
let s:p.d3 = "#5b5b56"
let s:p.t3 = "#4b5f59"
let s:p.k3 = "#4f5d64"
let s:p.a4 = "#413c39"
let s:p.b4 = "#393e39"
let s:p.g4 = "#3d3d37"
let s:p.d4 = "#3d3d3a"
let s:p.t4 = "#363f3c"
let s:p.k4 = "#383e41"
let s:p.a5 = "#2d2b29"
let s:p.b5 = "#2a2c29"
let s:p.g5 = "#2c2c29"
let s:p.d5 = "#2c2c29"
let s:p.t5 = "#282c2b"
let s:p.k5 = "#292c2d"
let s:p.a6 = "#272524"
let s:p.b6 = "#242624"
let s:p.g6 = "#262624"
let s:p.d6 = "#262624"
let s:p.t6 = "#242625"
let s:p.k6 = "#242627"

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
call s:smartHi('RedshiftHighlightedAlt',    s:p.a6, s:p.a1)
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
    \"Type",
    \"Underlined",
    \"VisualNOS",
    \"WarningMsg",
    \"WildMenu",
    \"clojureKeyword",
    \"clojureMacro",
    \"javascriptArrayMethod",
    \"javascriptBOMNavigatorProp",
    \"javascriptBlock",
    \"javascriptConsoleMethod",
    \"javascriptDOMDocMethod",
    \"javascriptDOMElemProp",
    \"javascriptDOMStorageProp",
    \"javascriptDOMEventProp",
    \"javascriptES6SetMethod",
    \"javascriptFileReaderProp",
    \"javascriptFunctionMethod",
    \"javascriptHeadersMethod",
    \"javascriptJSONStaticMethod",
    \"javascriptMethod",
    \"javascriptStringMethod",
    \"javascriptPromiseStaticMethod",
    \"javascriptPromiseMethod",
    \"javascriptProp",
    \"javascriptRequestProp",
    \"javascriptResponseProp",
    \"javascriptRegexpString",
    \"javascriptReflectMethod",
\])

call s:linkGroup('RedshiftComment', [
    \"Comment",
    \"vimLineComment",
\])

call s:linkGroup('RedshiftControl', [
    \"clojureParen",
    \"javascriptArrowFunc",
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
    \"pugAttributesDelimiter",
    \"yamlKeyValueDelimiter",
\])

call s:linkGroup('RedshiftControlActive', [
    \"MatchParen",
\])

call s:linkGroup('RedshiftKeyword', [
    \"Boolean",
    \"Keyword",
    \"clojureCond",
    \"clojureConstant",
    \"clojureDefine",
    \"clojureFunc",
    \"clojureSpecial",
    \"javascriptExceptions",
    \"javascriptIdentifier",
    \"javascriptOperator",
    \"javascriptReturn",
    \"javascriptVariable",
    \"javascriptTry",
    \"javascriptConditional",
    \"javascriptConditionalElse",
    \"pugTag",
    \"vimCommand",
    \"vimLet",
\])

call s:linkGroup('RedshiftLiteral', [
    \"String",
    \"javascriptPropertyNameString",
    \"javascriptRegexpString",
    \"javascriptString",
    \"jsxRegion",
    \"yamlPlainScalar",
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
    \"CursorColumn",
\])

call s:linkGroup('RedshiftHighlighted', [
    \"Search",
\])

call s:linkGroup('RedshiftHighlightedAlt', [
    \"IncSearch",
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
    \"JavascriptCommentTodo",
    \"Todo",
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


