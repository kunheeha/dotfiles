" enable tabline
let g:airline#extensions#tabline#enabled = 1
"Hide close button for tabline
let g:airline#extensions#tabline#show_close_button = 0
"Hide 'buffers' section
let g:airline#extensions#tabline#show_buffers = 0
"Hide numbers
let g:airline#extensions#tabline#show_tab_nr = 0
"Show tab count
let g:airline#extensions#tabline#show_tab_count = 1
"Don't display utf-8
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
"Display short path
let g:airline_stl_path_style = 'short'
" enable powerline fonts
let g:airline_powerline_fonts = 1
" Disable buffer names on the right of tabline
let g:airline#extensions#tabline#show_splits = 0

" Switch to your current theme
let g:airline_theme = 'nord'

" Always show tabs
set showtabline=2

" ScrollStatus
let g:airline_section_x = '%{ScrollStatus()}'
