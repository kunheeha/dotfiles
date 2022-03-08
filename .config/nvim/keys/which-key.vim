" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey ',,'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual ',,'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'

" Floating window for whichkey
let g:which_key_use_floating_win = 0

" Hide statusline when whichkey displays
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Whichkey colours
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Single mappings
let g:which_key_map['v'] = [ '<C-W>v'                     , 'split right']

" Floaterm
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ 't' : [':FloatermNew'                                   , 'terminal'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'n' : [':FloatermNew node'                              , 'node'],
      \ 'p' : [':FloatermNew python'                            , 'python'],
      \ }

let g:which_key_map.c = {
      \ 'name': '+cursor',
      \ 'c': [':set cursorcolumn!', 'column'],
      \ 'l': [':set cursorline!', 'line']
      \ }

" Register which key map
call which_key#register(',,', "g:which_key_map")

