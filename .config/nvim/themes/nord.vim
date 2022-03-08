let g:nord_bold_vertical_split_line = 0
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

augroup nord-theme-custom
  autocmd!
  " Use 'nord7' as foreground color for Vim comment titles.
  autocmd ColorScheme nord highlight vimCommentTitle ctermfg=14 guifg=#8FBCBB
let s:nord0_gui = "#1b1e24"
augroup END

colorscheme nord
