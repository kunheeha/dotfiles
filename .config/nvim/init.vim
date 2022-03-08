" auto source when writing to init.vim
au! BufWritePost $MYVIMRC source %
" Source plugins
source $HOME/.config/nvim/vimplug/plugins.vim

" Leader Key
let g:mapleader = ",,"

syntax enable
set hidden

" No wrapping of long line
"set nowrap
" Avoid wrapping in middle of word
set linebreak

" Encoding UTF-8
set encoding=UTF-8
set fileencoding=UTF-8

" Cursorline when starting
set cursorline
" Display cursor position always
set ruler

" Lines to keep above and below
set scrolloff=5

" Enable mouse
set mouse=a

" Split directions
set splitbelow
set splitright

" Support 256 colours
set t_Co=256

" Line Numbers (relative)
set nu rnu

" Backups (None)
set noswapfile
set nobackup
set nowritebackup

" Show tabs
set showtabline=2

" Autoindent
set smartindent autoindent expandtab smarttab
" (2 spaces - JSON)
set tabstop=2 shiftwidth=2
" (4 spaces - Python)
" set tabstop=4 shiftwidth=4

" Partial matches in search
set incsearch
" Case-sensitive only when capital letter is searched
set smartcase

" Confirmation when closing unsaved file
set confirm


" Faster completion
set updatetime=300

" Sudo write
cmap w!! w !sudo tee %

" Keybindings
" Escape
inoremap ii <Esc>
vnoremap ii <Esc>
" Quit all
noremap <Leader>q :qa<CR>
" Write
noremap <Leader>w :w<CR>
" New tab
noremap <Leader>et :tabe<CR>
" Close tab
noremap <Leader>ct :tabc<CR>
" Tab to move between buffers
"noremap <TAB> :bnext<CR>
"noremap <S-TAB> :bprevious<CR>
" Better tabbing
vnoremap < <gv
vnoremap > >gv
" Commenter
nmap <Leader>/ <plug>NERDCommenterToggle
vmap <Leader>/ <plug>NERDCommenterToggle
" WhichKey
source $HOME/.config/nvim/keys/which-key.vim
" Resize window
nmap <Up> :resize +2<Enter>
nmap <Down> :resize -2<Enter>
nmap <Right> :vertical resize -2<Enter>
nmap <Left> :vertical resize +2<Enter>
" Maximise current vim window
nmap <Leader>m :Maximizer<Enter>
"Floaterm
nmap <Leader>f :FloatermToggle<Enter>
" Rename tab
nmap <Leader>nt :TabooRename
" relative numbers
nmap <Leader>nr :set invrnu<Enter>
"Exit term mode with esc
tmap <Esc> <C-\><C-n>
"Floaterm
nmap <Leader>f :FloatermToggle<Enter>
" Minimap
nmap <Leader>vs :MinimapToggle<CR> :MinimapRefresh<CR>
" SearchBox
nmap <Leader>ss :SearchBoxIncSearch<CR>
nmap <Leader>sr :SearchBoxReplace<CR>
nmap <Leader>src :SearchBoxReplace confirm=menu<CR>
vmap <Leader>sr :SearchBoxReplace exact=true visual_mode=true<CR>
vmap <Leader>src :SearchBoxReplace confirm=menu visual_mode=true<CR>


" SmoothScroll
lua require('neoscroll').setup()

" GoMove
lua require('gomove').setup({map_defaults = false, reindent = true, undojoin = ture, move_past_end_col = false})
nmap <C-h> <Plug>GoNSMLeft
nmap <C-j> <Plug>GoNSMDown
nmap <C-k> <Plug>GoNSMUp
nmap <C-l> <Plug>GoNSMRight
vmap <C-h> <Plug>GoVSMLeft
vmap <C-j> <Plug>GoVSMDown
vmap <C-k> <Plug>GoVSMUp
vmap <C-l> <Plug>GoVSMRight

" Tabout
"lua require('tabout').setup({tabkey='<TAB>', backwards_tabkey='<S-TAB>', act_as_tab=true, enable_backwards=true, tabouts={{open="'", close="'"}, {open='"', close='"'}, {open='(', close=')'}, {open='[', close=']'}, {open='{', close='}'}}, ignore_beginning=true})



" Telescope config
nmap <C-f> :Telescope find_files<CR>
nmap <Leader>g :Telescope live_grep<CR>
nmap <Leader>b :Telescope buffers<CR>

" FuzzyFinder config
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

"map <C-f> :Files<CR>
"map <leader>b :Buffers<CR>
"nnoremap <leader>g :Rg<CR>


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"



"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)



" Colours
set background=dark
" Theme
source $HOME/.config/nvim/themes/nord.vim
" Enable termguicolors
set termguicolors
" Set background to reflect Alacritty transparent
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
" Airline
source $HOME/.config/nvim/themes/airline.vim
" Floaterm Colours
" floaterm window's background
hi! Floaterm guibg=NONE
" floating window border line colour
hi! FloatermBorder guibg=#1b1e24
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Colorizer
lua require'plug-colorizer'

" Rainbow parentheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

autocmd FileType json,python,javascript RainbowParentheses


"Startify
"Session directory
let g:startify_session_dir='~/.config/.vim/sessions'
"Bookmarks
let g:startify_bookmarks = [
  \ { 'w': '~/Work/webapp-alpha'},
  \ { 'b': '~/Work/webapp-alpha/app/common/workflow/data/buying_workflow_v0.2'},
  \ { 's': '~/Work/webapp-alpha/app/common/workflow/data/selling_workflow_v0.1'},
  \ { 'l': '~/Work/webapp-alpha/app/common/workflow/data/lending_v1'},
  \ { 'r': '~/Work/webapp-alpha/app/common/workflow/data/remortgaging_v1'},
  \ ]
"Lists
let g:startify_lists = [
  \ { 'type': 'sessions',   'header': ['Sessions']},
  \ { 'type': 'files',      'header': ['Recent Files']},
  \ { 'type': 'bookmarks',  'header': ['Bookmarks']},
  \ ]
" Automatically update sessions
let g:startify_session_persistence = 1
" Remove empty buffers on quit
let g:startify_enable_special = 0
" Startify Header
let g:startify_custom_header = [
      \ '   ███████     ██ ██ ██████  ███████     ██ ██    ██ ██ ███    ███     ██  ██████  ',
      \ '██ ██         ██  ██ ██   ██ ██         ██  ██    ██ ██ ████  ████    ██  ██       ',
      \ '   ███████   ██   ██ ██   ██ █████     ██   ██    ██ ██ ██ ████ ██   ██   ██   ███ ',
      \ '██      ██  ██    ██ ██   ██ ██       ██     ██  ██  ██ ██  ██  ██  ██    ██    ██ ',
      \ '   ███████ ██     ██ ██████  ███████ ██       ████   ██ ██      ██ ██      ██████  ',
      \]

" Signify (Gitgutter alternative)
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" Don't show numbers
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1


" Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk


" Colours for signify
" highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
" highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
" highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00

" reset terminal when exiting vim
":autocmd BufWinLeave * !~/post-quit-vim

" Juno
" For Workflow
set iskeyword=@,48-57,192-255
"au! BufNewFile,BufRead *.json set filetype=junoworkflow
" Clipboard shared between vim and all else
set clipboard=unnamedplus
" Juno plugin
source $HOME/.config/nvim/juno.vim
