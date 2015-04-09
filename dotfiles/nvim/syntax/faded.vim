if exists("b:current_syntax")
    finish
endif

syntax match fadedAnything /.*/

hi link fadedAnything NonText

let b:current_syntax = "faded"
