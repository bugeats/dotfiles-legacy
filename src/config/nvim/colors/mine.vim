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



" Palette ----------------------------------------------------------------------

let s:p = {}

let s:p.a1 = "#d8af8e"
let s:p.a2 = "#a57b55"
let s:p.a3 = "#645851"
let s:p.a4 = "#413c39"
let s:p.a5 = "#2d2b29"
let s:p.a6 = "#272524"
let s:p.b1 = "#94c390"
let s:p.b2 = "#5d9058"
let s:p.b3 = "#525e51"
let s:p.b4 = "#393e39"
let s:p.b5 = "#2a2c29"
let s:p.b6 = "#242624"
let s:p.d1 = "#b8b8aa"
let s:p.d2 = "#84847c"
let s:p.d3 = "#5b5b56"
let s:p.d4 = "#3d3d3a"
let s:p.d5 = "#2c2c29"
let s:p.d6 = "#262624"
let s:p.g1 = "#bbba81"
let s:p.g2 = "#888744"
let s:p.g3 = "#5c5b4e"
let s:p.g4 = "#3d3d37"
let s:p.g5 = "#2c2c29"
let s:p.g6 = "#262624"
let s:p.k1 = "#83bfda"
let s:p.k2 = "#418da9"
let s:p.k3 = "#4f5d64"
let s:p.k4 = "#383e41"
let s:p.k5 = "#292c2d"
let s:p.k6 = "#242627"
let s:p.t1 = "#71c6af"
let s:p.t2 = "#22947b"
let s:p.t3 = "#4b5f59"
let s:p.t4 = "#363f3c"
let s:p.t5 = "#282c2b"
let s:p.t6 = "#242625"

let s:p.blacknormal   = "#5f5955"
let s:p.blackbright   = "#5f5955"
let s:p.blackdim      = "#403c3a"
let s:p.whitenormal   = "#c0b5ad"
let s:p.whitebright   = "#c0b5ad"
let s:p.whitedim      = "#8a827e"
let s:p.rednormal     = "#d8af8e"
let s:p.redbright     = "#d8af8e"
let s:p.reddim        = "#a57b55"
let s:p.yellownormal  = "#a8bf85"
let s:p.yellowbright  = "#a8bf85"
let s:p.yellowdim     = "#748c4a"
let s:p.greennormal   = "#71c6af"
let s:p.greenbright   = "#71c6af"
let s:p.greendim      = "#22947b"
let s:p.cyannormal    = "#83bfda"
let s:p.cyanbright    = "#83bfda"
let s:p.cyandim       = "#418da9"
let s:p.bluenormal    = "#c6ade1"
let s:p.bluebright    = "#c6ade1"
let s:p.bluedim       = "#9478b0"
let s:p.magentanormal = "#e6a4be"
let s:p.magentabright = "#e6a4be"
let s:p.magentadim    = "#b46f8c"

let g:terminal_color_0  = s:p.blacknormal
let g:terminal_color_1  = s:p.rednormal
let g:terminal_color_2  = s:p.greennormal
let g:terminal_color_3  = s:p.yellownormal
let g:terminal_color_4  = s:p.bluenormal
let g:terminal_color_5  = s:p.magentanormal
let g:terminal_color_6  = s:p.cyannormal
let g:terminal_color_7  = s:p.whitenormal
let g:terminal_color_8  = s:p.blacknormal
let g:terminal_color_9  = s:p.rednormal
let g:terminal_color_10 = s:p.greennormal
let g:terminal_color_11 = s:p.yellownormal
let g:terminal_color_12 = s:p.bluenormal
let g:terminal_color_13 = s:p.magentanormal
let g:terminal_color_14 = s:p.cyannormal
let g:terminal_color_15 = s:p.whitenormal

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
call s:smartHi('RedshiftGhostActive',       s:p.a2, s:p.a5)
call s:smartHi('RedshiftLocated',           '',     s:p.a5)
call s:smartHi('RedshiftChromeNormal',      s:p.a2, s:p.a6)
call s:smartHi('RedshiftChromeMin',         s:p.a3, s:p.a6)
call s:smartHi('RedshiftChromePanel',       s:p.a2, s:p.a4)
call s:smartHi('RedshiftChromePanelActive', s:p.a1, s:p.a4)
call s:smartHi('RedshiftHighlighted',       s:p.k1, s:p.k4)
call s:smartHi('RedshiftHighlightedAlt',    s:p.a6, s:p.a1)
call s:smartHi('RedshiftSelected',          '',     s:p.k4)
call s:smartHi('RedshiftAttention',         s:p.k1, '')

call s:smartHi('RedshiftGreen',  s:p.greennormal, '')
call s:smartHi('RedshiftYellow', s:p.yellownormal, '')
call s:smartHi('RedshiftRed',    s:p.rednormal, '')

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
    \"javascriptDOMEventProp",
    \"javascriptDOMStorageProp",
    \"javascriptES6SetMethod",
    \"javascriptFileReaderProp",
    \"javascriptFunctionMethod",
    \"javascriptHeadersMethod",
    \"javascriptJSONStaticMethod",
    \"javascriptMethod",
    \"javascriptPromiseMethod",
    \"javascriptPromiseStaticMethod",
    \"javascriptProp",
    \"javascriptReflectMethod",
    \"javascriptRegexpString",
    \"javascriptRequestProp",
    \"javascriptResponseProp",
    \"javascriptStringMethod",
    \"xmlTagName",
\])

call s:linkGroup('RedshiftComment', [
    \"Comment",
    \"javascriptDocComment",
    \"javascriptDocNamedDocParamType",
    \"javascriptDocNotation",
    \"javascriptDocParamName",
    \"javascriptDocParamType",
    \"javascriptDocNamedParamType",
    \"javascriptDocTags",
    \"vimLineComment",
\])

call s:linkGroup('RedshiftControl', [
    \"clojureParen",
    \"cssBraces",
    \"cssNoise",
    \"dotBraceEncl",
    \"dotBrackEncl",
    \"dotKeyChar",
    \"javascriptArrowFunc",
    \"javascriptBraces",
    \"javascriptBrackets",
    \"javascriptCaseColon",
    \"javascriptComma",
    \"javascriptDefaultAssign",
    \"javascriptDotNotation",
    \"javascriptEndColons",
    \"javascriptObjectLabelColon",
    \"javascriptOpSymbol",
    \"javascriptOpSymbols",
    \"javascriptParenObjectLiteral",
    \"javascriptParenTagLiteral",
    \"javascriptParens",
    \"javascriptProperty",
    \"javascriptTemplateSB",
    \"jsonBraces",
    \"jsonNoise",
    \"luaParen",
    \"markdownHeadingDelimiter",
    \"markdownListMarker",
    \"markdownRule",
    \"pugAttributesDelimiter",
    \"stylusProperty",
    \"stylusVariableAssignment",
    \"taskpaperListItem",
    \"vimContinue",
    \"vimParenSep",
    \"xmlEndTag",
    \"xmlEqual",
    \"xmlTag",
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
    \"cssBackgroundProp",
    \"cssBorderProp",
    \"cssBoxProp",
    \"cssColorProp",
    \"cssFontProp",
    \"cssProp",
    \"cssProp",
    \"cssTextProp",
    \"cssVisualProp",
    \"javascriptCase",
    \"javascriptConditional",
    \"javascriptConditionalElse",
    \"javascriptExceptions",
    \"javascriptExport",
    \"javascriptIdentifier",
    \"javascriptImport",
    \"javascriptOperator",
    \"javascriptReturn",
    \"javascriptSwitch",
    \"javascriptTry",
    \"javascriptVariable",
    \"luaCond",
    \"luaFunction",
    \"luaIn",
    \"luaRepeat",
    \"luaStatement",
    \"pugScriptStatement",
    \"pugTag",
    \"shEcho",
    \"stylusImport",
    \"taskpaperProject",
    \"vimCommand",
    \"vimLet",
\])

call s:linkGroup('RedshiftLiteral', [
    \"String",
    \"javascriptPropertyNameString",
    \"javascriptRegexpString",
    \"javascriptString",
    \"jsxRegion",
    \"markdownCode",
    \"markdownCodeBlock",
    \"yamlPlainScalar",
\])

call s:linkGroup('RedshiftGhost', [
    \"Conceal",
    \"EndOfBuffer",
    \"LineNr",
    \"NonText",
    \"SpecialKey",
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
    \"ExtraWhitespace",
    \"JavascriptCommentTodo",
    \"NeomakeErrorMsg",
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


