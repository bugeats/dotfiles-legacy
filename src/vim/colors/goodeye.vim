" so $VIMRUNTIME/syntax/hitest.vim

set background=light
highlight clear
if exists("syntax_on")
  syntax reset
endif

hi clear Normal
set bg&

let colors_name = "goodeye"

" Lab Color
" http://www.broadhurst-family.co.uk/lefteye/MainPages/labcolour2.htm

" Solarized Base desaturated
let p_black       = "#242424"
let p_dark        = "#646464" "  64 / 255
let p_gray        = "#a0a0a0" " 160 / 255
let p_pale        = "#d0d0d0"
let p_paler       = "#f0f0f0"
let p_white       = "#f7f7f7"

" Solarized colors
let p_yellow      = "#b58900"
let p_orange      = "#cb4b16"
let p_red         = "#dc322f"
let p_magenta     = "#d33682"
let p_violet      = "#6c71c4"
let p_blue        = "#268bd2"
let p_cyan        = "#2aa198"
let p_green       = "#719e07"

" for each of the above
" - darker version
" - pastelle version


let p_orangeP     = "#FFE5D9"
let p_blueP       = "#D9E5FF"


let CA = {}

" Clobber
" ------------------------------------------------------------------------------

let SyntaxGroups = ['Normal', 'Error', 'Comment', 'Constant', 'Special', 'Identifier', 'Statement', 'PreProc', 'Type', 'Ignore', 'Todo']
let OtherGroups = ['SpecialKey', 'NonText', 'Directory', 'ErrorMsg', 'IncSearch', 'Search', 'MoreMsg', 'ModeMsg', 'LineNr', 'CursorLineNr', 'Question', 'StatusLine', 'StatusLineNC', 'VertSplit', 'Title', 'Visual', 'VisualNOS', 'WarningMsg', 'WildMenu', 'Folded', 'FoldColumn', 'DiffAdd', 'DiffChange', 'DiffDelete', 'DiffText', 'SignColumn', 'Conceal', 'SpellBad', 'SpellCap', 'SpellRare', 'SpellLocal', 'Pmenu', 'PmenuSel', 'PmenuSbar', 'PmenuThumb', 'TabLine', 'TabLineSel', 'TabLineFill', 'CursorColumn', 'CursorLine', 'ColorColumn', 'Cursor']

for group in SyntaxGroups
  execute "hi ".group." NONE"
endfor

for group in OtherGroups
  execute "hi ".group." NONE"
endfor

" Core Types
" ------------------------------------------------------------------------------

" Text
" Constant
" Object
"   Instance
" Comment
" Alert
"   Warning
"   Error
" Keyword
"   Boolean
" Variable / Assignment
" Hash / Dictionary
"   Value
"   Property
" Number
"   Integer
"   Float
" Operator
" String
"   Interpolated
" List
" Escape / Special
" Syntax

"
"  pastelle bg colors based on file type?

" ------------------------------------------------------------------------------

let CA['Text']    = { "fg": p_black }

let CA['Type']    = { "fg": p_green }
let CA['Keyword']    = { "fg": p_green }

let CA['Property']    = { "fg": p_green }
let CA['Value']    = { "fg": p_cyan }

let CA['Constant']    = { "fg": p_cyan }
let CA['Object']    = { "fg": p_cyan }

let CA['Normal']    = { "fg": p_dark, "bg": p_white }
let CA['Syntax']    = { "fg": p_black }

let CA['Operator']    = { "fg": p_red }

" Comments
let CA['Comment']    = { "fg": p_gray }
let CA['Todo']       = { "fg": p_white, "bg": p_red }
let CA['NonText']    = { "fg": p_pale }

" Pmenu
let CA['Pmenu']      = { "fg": p_white, "bg": p_dark }
let CA['PmenuSel']   = { "fg": p_white, "bg": p_gray }

" Constants
" -------------

" ----- members
let CA['String']   = { "fg": p_yellow }
let CA['Number']   = { "fg": p_black, "gui": "italic" }
let CA['Float']    = { "fg": p_orange }
let CA['Boolean']  = { "fg": p_violet }

hi! link StringInterpolation String
let CA['StringInterpolation']  = { "fg": p_yellow, "bg": p_orangeP }


let CA['Identifier'] = { "fg": p_blue }
let CA['Statement']  = { "fg": p_violet }
let CA['Special']  = { "fg": p_orange }

" Parens, commas, periods etc
let CA['MatchParen'] = { "fg": p_white, "bg": p_violet }

" Stylus functions, 
let CA['PreProc']    = { "fg": p_blue }


" -- Cursor / Nav ----
let CA['Cursor']       = { "fg": p_white, "bg": p_dark }
let CA['CursorLine']   = { "bg": "#ffffff" }
let CA['CursorColumn'] = { "bg": "#ffffff" }
let CA['Visual']       = { "fg": p_white, "bg": p_gray }

" let CA['Search'] = { "fg": p_white, "bg": p_blue }
let CA['Search'] = { "bg": p_blueP }

" -- Chrome ----
" let CA['LineNr'] = { "fg": p_pale }
let CA['LineNr'] = { "fg": p_pale, "bg": "#ffffff" }
" let CA['CursorLineNr'] = { "fg": p_gray }
let CA['CursorLineNr'] = { "fg": p_gray, "bg": "#ffffff" }
" let CA['TabLine'] = { "fg": p_dark }
let CA['TabLine'] = { "fg": p_dark, "bg": "#ffffff" }
let CA['TabLineSel'] = { "fg": p_white, "bg": p_dark }
let CA['TabLineFill'] = { "fg": p_gray }
let CA['VertSplit'] = { "fg": p_dark, "bg": p_dark }
let CA['StatusLine'] = { "fg": p_white, "bg": p_dark }
let CA['StatusLineNC'] = { "fg": p_white, "bg": p_gray }

" -- CSS ----
let CA['cssRenderAttr'] = { "fg": p_violet }


" CSS / Stylus
" ------------------------------------------------------------------------------

hi! link cssRenderProp        Type
hi! link stylusClass          Constant
hi! link cssTagName           Identifier
hi! link cssValueLength       Value


" CoffeeScript
" ------------------------------------------------------------------------------

hi! link CoffeeObject         Constant
hi! link coffeeInterp         StringInterpolation
hi! link coffeeInterpDelim    StringInterpolation
hi! link coffeeExtendedOp     Operator
hi! link coffeeParen          Syntax
hi! link coffeeBracket        Syntax
hi! link coffeeCurly          Syntax
hi! link coffeeSpecialVar     Keyword
hi! link coffeeObjAssign      Property

let CA['stylusClass'] = { "fg": p_orange }

" GitGutter
" ------------------------------------------------------------------------------

let CA['GitGutterAdd'] = { "fg": p_green, "bg": "#ffffff" } " an added line
let CA['GitGutterChange'] = { "fg": p_yellow, "bg": "#ffffff" } " a changed line
let CA['GitGutterDelete'] = { "fg": p_red, "bg": "#ffffff" } " at least one removed line
let CA['GitGutterChangeDelete'] = { "fg": p_orange, "bg": "#ffffff" } " a changed line followed by at least one removed line

" Jade
" ------------------------------------------------------------------------------

hi! link jadeClass            Constant
hi! link jadeHandlebars       StringInterpolation

" Jade
" ------------------------------------------------------------------------------
" TODO

hi diffFile guifg=#F2F2F2 guibg=#666666
hi diffAdded guibg=#BCEDB2
hi diffRemoved guibg=#EDB2B2

" Ruby
" ------------------------------------------------------------------------------

hi! link rubySymbol Property
hi! link rubyStringDelimiter String

" Taskpaper
" ------------------------------------------------------------------------------
hi! link taskpaperProject Object

" Emblem
" ------------------------------------------------------------------------------
hi! link eblHbsArg Variable
"
"
" Automatic Foo
" ------------------------------------------------------------------------------

hi! link SpecialKey NonText

" ----

for key in keys(CA)
	let s:colours = CA[key]
	if has_key(s:colours, 'gui')
		let gui = s:colours['gui']
	else
		let gui='NONE'
	endif
	if has_key(s:colours, 'fg')
		let guifg = s:colours['fg']
	else
		let guifg='NONE'
	endif
	if has_key(s:colours, 'bg')
		let guibg = s:colours['bg']
	else
		let guibg='NONE'
	endif
	if key =~ '^\k*$'
		execute "hi ".key." gui=".gui." guifg=".guifg." guibg=".guibg
	endif
endfor


