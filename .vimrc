call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim' | Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-markdown' | Plug 'ap/vim-css-color'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nightsense/snow'
Plug 'vimwiki/vimwiki'
Plug 'arcticicestudio/nord-vim'
call plug#end()
set nocompatible
filetype plugin on
syntax on
set encoding=UTF-8

" Colour and theme
colorscheme nord
let g:airline_theme='nord'
let g:airline_powerline_fonts=1
set termguicolors
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
let g:limelight_conceal_ctermfg=240
let g:limelight_conceal_guifg='#777777'
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab
set wildmenu
set wildmode=longest:full,full

set splitbelow
set splitright


" Custom keybindings
" Reload
nmap <C-z> :source ~/.vimrc<Enter>
" Resize tab
nmap <Up> :resize +2<Enter>
nmap <Down> :resize -2<Enter>
nmap <Right> :vertical resize -2<Enter>
nmap <Left> :vertical resize +2<Enter>
" Copy in visual mode
vmap <C-c> "*y
" Paste in normal mode
nmap <C-p> <Esc>"*p
" Go to start of line in insert mode
imap <C-a> <Esc>^i


"Goyo Configuration

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  hi! Normal ctermbg=NONE guibg=NONE
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
