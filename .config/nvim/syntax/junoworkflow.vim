" Vim syntax file
" Language: Juno Workflow
" Maintainer: Kunhee Ha
" Latest Revision: Who knows

if exists("b:current_syntax")
    finish
endif

" Primary keywords in task definition []
syntax keyword taskPrimary identifier title description steps
" Secondary keywords in task definition []
syntax match taskPrecheck "pre_checks"
syntax match taskDependson "depends_on"
" Tertiary keywords in taks definition []
syntax match taskTertiary "required_capabilities"
" Primary keywords {}
syntax keyword itemPrimary identifier title name field_type choices
" Secondary keywords {}
syntax keyword itemSecondary pre_checks skip_phase_identifier display_name public_display_name
" Tertiary keywords {}
syntax keyword itemTertiary action_type action_params

" Jinja
syntax match jinjaItem "{[{%]\s?(if|else|elif)?\s?[^%}]+[%}]}"


" Task definitions group 1 []
syntax region taskBlock start="\[" end="\]" fold transparent contains=taskPrimary,taskPrecheck,taskDependson,taskTertiary,jinjaItem keepend
" Task definitions group 2 [{}]
"syntax region taskInnerBlock start="[{" end="}]" fold transparent

" {} group
"syntax region itemInnerBlock start="{" end="}" fold transparent contains=itemPrimary,itemSecondary,itemTertiary keepend

highlight link taskPrimary Keyword
highlight link taskPrecheck Todo
highlight link taskDependson Todo
highlight link taskTertiary Number
highlight link itemPrimary Keyword
highlight link itemSecondary Function
highlight link itemTertiary Number
highlight link jinjaItem Function

let b:current_syntax = "junoworkflow"

