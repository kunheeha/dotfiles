" Plugins
call plug#begin('~/.config/nvim/autoload/plugged')

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Syntax Support
Plug 'sheerun/vim-polyglot'
" NerdTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'
" Nord Theme
Plug 'arcticicestudio/nord-vim'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
" Colorizer
Plug 'norcalli/nvim-colorizer.lua'
" Rainbow parentheses
Plug 'junegunn/rainbow_parentheses.vim'
"Starify
Plug 'mhinz/vim-startify'
" NerdFonts
Plug 'ryanoasis/vim-devicons'
" Git integration
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
" Commenting lines
Plug 'preservim/nerdcommenter'
" WhickKey
Plug 'liuchengxu/vim-which-key'
" Floaterm
Plug 'voldikss/vim-floaterm'
" Surround
Plug 'tpope/vim-surround'
" Taboo
Plug 'gcmt/taboo.vim'
" Maximizer
Plug 'szw/vim-maximizer'
" VisIncr
Plug 'vim-scripts/VisIncr'
" VimWiki
Plug 'vimwiki/vimwiki'
" Visual Multi (select next pattern in Visual mode, like multicursor)
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Visualise undo history
Plug 'mbbill/undotree'
" Tagbar
Plug 'preservim/tagbar'
" IndentGuides
Plug 'nathanaelkane/vim-indent-guides'
" Unimpaired
Plug 'tpope/vim-unimpaired'
" Ranger
Plug 'kevinhwang91/rnvimr'
" Minimap
Plug 'wfxr/minimap.vim'
" ScrollStatus
Plug 'ojroques/vim-scrollstatus'
" Emojis
Plug 'junegunn/vim-emoji'
" Plenary
Plug 'nvim-lua/plenary.nvim'
" Telescope
Plug 'nvim-telescope/telescope.nvim'
" SmoothScroll
Plug 'karb94/neoscroll.nvim'
" GoMove
Plug 'booperlv/nvim-gomove'
" NVIM UI library
Plug 'MunifTanjim/nui.nvim'
" SearchBox
Plug 'VonHeikemen/searchbox.nvim'
" Tabout
Plug 'abecodes/tabout.nvim'

call plug#end()

