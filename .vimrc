call plug#begin('~/.vim/plugged')
"Gitgutter
Plug 'airblade/vim-gitgutter'
"Display Syntax errors
Plug 'dense-analysis/ale'
"Surroundings ("". '', (), [] etc)
Plug 'tpope/vim-surround'
"Visual Multi (select next pattern in Visual mode, like multicursor)
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"FuzzyFinder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"RipGrep with FZF
Plug 'wookayin/fzf-ripgrep.vim'
"Goyo with limelight
Plug 'junegunn/goyo.vim' | Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-markdown' | Plug 'ap/vim-css-color'
"NerdTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" VisIncr
Plug 'vim-scripts/VisIncr'
" Colourscheme snow
Plug 'nightsense/snow'
"VimWiki
Plug 'vimwiki/vimwiki'
" Colourscheme Nord
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-fugitive'
Plug 'gcmt/taboo.vim'
"Maximise Window
Plug 'szw/vim-maximizer'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Commenting lines
Plug 'preservim/nerdcommenter'
"post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"Visualise undo history
Plug 'mbbill/undotree'
"Markdown Preview
Plug 'iamcco/markdown-preview.vim'
"Tagbar
Plug 'preservim/tagbar'
"IndentGuides
Plug 'nathanaelkane/vim-indent-guides'
"Dim Inactive
Plug 'blueyed/vim-diminactive'
"Floaterm
Plug 'voldikss/vim-floaterm'
call plug#end()

set nocompatible
filetype plugin on
"Syntax highlighting
syntax on
"Vim8's annoying auto line wrap
set nowrap
"Mouse click
set mouse=a
set encoding=UTF-8
"Relative numbers
set nu rnu
"Cursorline
set cursorline

"Backups (None)
set noswapfile
set nobackup
set nowritebackup

"Colour and theme

"NORD
colorscheme nord
let g:airline_theme='nord'

"Snow
"colorscheme snow


let g:airline_powerline_fonts=1
set termguicolors
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
let g:limelight_conceal_ctermfg=240
let g:limelight_conceal_guifg='#777777'
set wildmenu
set wildmode=longest:full,full

"Horizontal splits to split below
set splitbelow
"Vertical splits to split to right
set splitright

" Tabs for python
"set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab

" Tabs for JSON
set shiftwidth=2 autoindent smartindent tabstop=2 softtabstop=2 expandtab

" Automatic closing brackets and more
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


" Custom keybindings
let mapleader=',,'
" ii for escape
imap ii <Esc>
vmap ii <Esc>
" Reload
nmap <C-z> :source ~/.vimrc<Enter>
" Write
nmap <Leader>w :w<Enter>
" Quit
nmap <Leader>q :q<Enter>
" Open new tab
nmap <Leader>t :tabe<Enter>
" Tab to quick move tabs
nmap <TAB> gt
" Resize window
nmap <Up> :resize +2<Enter>
nmap <Down> :resize -2<Enter>
nmap <Right> :vertical resize -2<Enter>
nmap <Left> :vertical resize +2<Enter>
" Copy in visual mode
vmap <C-c> "*y
" Paste in normal mode
nmap <C-p> <Esc>"*p
" fzf by Ctrl f
nmap <C-f> :Files<Enter>
"Floaterm 
nmap <Leader>f :FloatermToggle<Enter>
"fzf with RipGrep by Ctrl g
nmap <C-g> :Rg<Enter>
"RipGrep on current file
nmap <Leader>g :BLine<Enter>
" Maximise current vim window
nmap <Leader>m :Maximizer<Enter>
" Previous opened file
nmap <Leader>b :e#<Enter>
" NerdTree toggle
nmap <Leader>n :NERDTreeToggle<Enter>
" relative numbers
nmap <Leader>nr :set invrnu<Enter>
" Commenter
nmap <Leader>/ <plug>NERDCommenterToggle
vmap <Leader>/ <plug>NERDCommenterToggle
" Set Cursorline
nmap <Leader>cl :set cursorline!<Enter>
" Set Cursorcolumn
nmap <Leader>cc :set cursorcolumn!<Enter>
" UndoTree toggle 
nmap <Leader>u :UndotreeToggle<Enter>
" Show my custom keybindings
nmap <Leader>kb :vsplit ~/vimwiki/VIMRC.wiki<Enter>
" Rename tab
nmap <Leader>nt :TabooRename 
"ToggleIndentation
nmap <Leader>i :IndentGuidesToggle<Enter>
"ToggleTagbar
nmap <Leader>d :TagbarToggle<Enter>
"Tab completion
imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"indentation in visual mode (stay in visual)
vmap < <gv
vmap > >gv
"Exit term mode with esc
tmap <Esc> <C-n><C-\>


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

