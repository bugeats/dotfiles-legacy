set background=light
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "mine"

syn match Parens /[(){}\[\]]/
"syn match CamelCase /\b([A-Z][a-z]*){2,}\b/
syn match CamelCase /([A-Z][a-z_]*){2,}/ 


" ir_white converted TextMate theme
hi Cursor  guifg=NONE guibg=#a7a7a7 gui=NONE
hi Visual  guifg=NONE guibg=#e0e0ed gui=NONE
hi CursorLine  guifg=NONE guibg=#f4f4f4 gui=NONE
hi CursorColumn  guifg=NONE guibg=#f4f4f4 gui=NONE
hi LineNr  guifg=#808080 guibg=#f4f4f4 gui=NONE
hi VertSplit  guifg=#cfcfcf guibg=#cfcfcf gui=NONE
hi MatchParen  guifg=#016692 guibg=NONE gui=NONE
hi StatusLine  guifg=#010101 guibg=#cfcfcf gui=bold
hi StatusLineNC  guifg=#010101 guibg=#cfcfcf gui=NONE

" Pmenu used by FuzzyFinder
hi Pmenu  guifg=#FFFFFF guibg=#444444 gui=NONE
hi PmenuSel  guifg=#FFFFFF guibg=#666666 gui=NONE

hi IncSearch  guifg=NONE guibg=#cdcdd8 gui=NONE
hi Search  guifg=NONE guibg=#cdcdd8 gui=NONE
hi Directory  guifg=#333366 guibg=NONE gui=NONE
hi Folded  guifg=#898989 guibg=#f4f4f4 gui=NONE

" hi Normal  guifg=#010101 guibg=#ffffff gui=NONE
hi Normal  guifg=#333333 guibg=#f4f4f4 gui=NONE

hi Boolean  guifg=#333366 guibg=NONE gui=NONE
hi Character  guifg=#333366 guibg=NONE gui=NONE
hi Comment  guifg=#898989 guibg=NONE gui=NONE
hi Conditional  guifg=#016692 guibg=NONE gui=NONE
hi Constant  guifg=#333366 guibg=NONE gui=NONE
hi Define  guifg=#016692 guibg=NONE gui=NONE
hi ErrorMsg  guifg=NONE guibg=NONE gui=NONE
hi WarningMsg  guifg=NONE guibg=NONE gui=NONE
hi Float  guifg=#8c008a guibg=NONE gui=NONE
hi Function  guifg=#a15001 guibg=NONE gui=NONE
hi Identifier  guifg=#877611 guibg=NONE gui=NONE
hi Keyword  guifg=#016692 guibg=NONE gui=NONE
hi Label  guifg=#009f78 guibg=NONE gui=NONE
hi NonText  guifg=#f3f8fe guibg=#f4f4f4 gui=NONE
hi Number  guifg=#8c008a guibg=NONE gui=NONE
hi Operator  guifg=#016692 guibg=NONE gui=NONE
hi PreProc  guifg=#016692 guibg=NONE gui=NONE
hi Special  guifg=#010101 guibg=NONE gui=NONE
hi SpecialKey  guifg=#f3f8fe guibg=#f4f4f4 gui=NONE
hi Statement  guifg=#016692 guibg=NONE gui=NONE
hi StorageClass  guifg=#877611 guibg=NONE gui=NONE
hi String  guifg=#009f78 guibg=NONE gui=NONE
hi Tag  guifg=#a15001 guibg=NONE gui=NONE
hi Title  guifg=#010101 guibg=NONE gui=bold
hi Todo  guifg=#898989 guibg=NONE gui=inverse,bold
hi Type  guifg=#646409 guibg=NONE gui=underline
hi Underlined  guifg=NONE guibg=NONE gui=underline
hi rubyClass  guifg=#016692 guibg=NONE gui=NONE

" hi rubyFunction  guifg=#a15001 guibg=NONE gui=NONE
" hi rubyFunction  guifg=#000000 guibg=NONE gui=NONE
hi rubyFunction  guifg=#7166aa guibg=NONE gui=NONE

hi rubyInterpolationDelimiter  guifg=#d08226 guibg=NONE gui=NONE

" hi rubySymbol  guifg=#333366 guibg=NONE gui=NONE
hi rubySymbol  guifg=#b8624e guibg=NONE gui=NONE

" hi rubyConstant  guifg=#646409 guibg=NONE gui=NONE
" hi rubyConstant  guifg=#981A21 guibg=NONE gui=bold,underline
hi rubyConstant  guifg=#9a5155 guibg=NONE gui=bold
hi rubyRailsUserClass guifg=#9a5155 guibg=NONE gui=bold

" hi rubyStringDelimiter  guifg=#009f78 guibg=NONE gui=NONE
hi rubyStringDelimiter  guifg=#894800 guibg=NONE gui=NONE

hi rubyBlockParameter  guifg=#696989 guibg=NONE gui=NONE
hi rubyInstanceVariable  guifg=#696989 guibg=NONE gui=NONE
hi coffeeSpecialVar  guifg=#696989 guibg=NONE gui=NONE
hi rubyInclude  guifg=#016692 guibg=NONE gui=NONE
hi rubyGlobalVariable  guifg=#696989 guibg=NONE gui=NONE
hi rubyRegexp  guifg=#9d7416 guibg=NONE gui=NONE
hi rubyRegexpDelimiter  guifg=#9d7416 guibg=NONE gui=NONE
hi rubyEscape  guifg=#333366 guibg=NONE gui=NONE
hi rubyControl  guifg=#016692 guibg=NONE gui=NONE
hi rubyClassVariable  guifg=#696989 guibg=NONE gui=NONE
hi rubyOperator  guifg=#016692 guibg=NONE gui=NONE
hi rubyException  guifg=#016692 guibg=NONE gui=NONE
hi rubyPseudoVariable  guifg=#696989 guibg=NONE gui=NONE
" hi rubyRailsUserClass  guifg=#646409 guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod  guifg=#7a7025 guibg=NONE gui=NONE
hi rubyRailsARMethod  guifg=#7a7025 guibg=NONE gui=NONE
hi rubyRailsRenderMethod  guifg=#7a7025 guibg=NONE gui=NONE
hi rubyRailsMethod  guifg=#7a7025 guibg=NONE gui=NONE
hi erubyDelimiter  guifg=NONE guibg=NONE gui=NONE
hi erubyComment  guifg=#898989 guibg=NONE gui=NONE
hi erubyRailsMethod  guifg=#7a7025 guibg=NONE gui=NONE
hi htmlTag  guifg=#0067c2 guibg=NONE gui=NONE
hi htmlEndTag  guifg=#0067c2 guibg=NONE gui=NONE
hi htmlTagName  guifg=#0067c2 guibg=NONE gui=NONE
hi htmlArg  guifg=#0067c2 guibg=NONE gui=NONE
hi htmlSpecialChar  guifg=#CC3366 guibg=NONE gui=NONE
hi javaScriptFunction  guifg=#877611 guibg=NONE gui=NONE
hi javaScriptRailsFunction  guifg=#7a7025 guibg=NONE gui=NONE
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
hi yamlKey  guifg=#a15001 guibg=NONE gui=NONE
hi yamlAnchor  guifg=#696989 guibg=NONE gui=NONE
hi yamlAlias  guifg=#696989 guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=#009f78 guibg=NONE gui=NONE
hi cssURL  guifg=#696989 guibg=NONE gui=NONE
hi cssFunctionName  guifg=#7a7025 guibg=NONE gui=NONE
hi cssColor  guifg=#333366 guibg=NONE gui=NONE
hi cssPseudoClassId  guifg=#bc4d00 guibg=NONE gui=NONE
hi cssClassName  guifg=#bc4d00 guibg=NONE gui=NONE
hi cssValueLength  guifg=#8c008a guibg=NONE gui=NONE
hi cssCommonAttr  guifg=#582b00 guibg=NONE gui=NONE
hi cssBraces  guifg=NONE guibg=NONE gui=NONE

" Mine custom

hi CursorLine  guibg=#e9e9e9
hi CursorColumn guibg=#ebebeb

hi MatchParen  guifg=#016692 guibg=#DDEEFF gui=NONE

hi IncSearch  guifg=NONE guibg=#FFFFD4 gui=NONE
hi Search  guifg=NONE    guibg=#FFFFD4 gui=NONE

"hi Comment          guifg=#92B3C5    guibg=NONE        gui=italic      ctermfg=darkgray    ctermbg=NONE        cterm=NONE
hi String           guifg=#965826    guibg=NONE
hi djangoVarBlock   guifg=#C68856    guibg=NONE
hi djangoTagBlock   guifg=#43775A    guibg=NONE
"hi Normal guifg=#1C1C1C
hi Number guifg=#67001C  

hi rubyStringEscape guifg=#e4862a
hi coffeeEscape guifg=#e4862a

hi LineNr guifg=#cccccc
"hi Keyword guifg=#58649D
"hi Conditional guifg=#58649D
"hi Statement guifg=#58649D
hi Function guifg=#C25339

hi treePart guifg=#CCCCCC
hi Parens guifg=#666666
"hi CamelCase guifg=#008B99

hi VertSplit guibg=#666666 guifg=#F2F2F2
hi StatusLineNC guibg=#AAAAAA guifg=#F2F2F2
hi StatusLine guibg=#666666 guifg=#F2F2F2

hi diffFile guifg=#F2F2F2 guibg=#666666
hi diffAdded guibg=#BCEDB2
hi diffRemoved guibg=#EDB2B2

hi sassClass guifg=#C25339
hi cssPseudoClass guifg=#666666
hi sassProperty guifg=#666666
hi cssProp guifg=#666666
hi sassVariable guifg=#af7800

"Invisible character colors
hi NonText guifg=#cccccc
hi SpecialKey guifg=#cccccc

" Special for HTML
"hi link htmlTag         Keyword 
"hi link htmlTagName     Conditional 
"hi link htmlEndTag      Identifier 

" Special for Javascript
hi link javaScriptNumber      Number 

" Special for Python
"hi  link pythonEscape         Keyword      

" Special for SASS
"hi link sassAmpersand Operator 
"hi link sassProperty Keyword 
"hi link cssProp Keyword 
"hi link cssColor Number 

" Special for Slim
hi slimText guifg=#937b41
