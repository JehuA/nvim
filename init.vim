set exrc
syntax on
set mouse=r
set hidden

" Handling Lines
set nu
set tabstop=4
set shiftwidth=4
set nowrap
set smartindent

" Searching stuff
set showmatch
set ignorecase
set nohlsearch

" quality of life stuff
set scrolloff=10
set cc=80
set signcolumn=yes
set noerrorbells

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Call plugin system
call plug#begin('~/.config/nvim/autoload/plugged')

	" File Explorer
    Plug 'preservim/nerdtree'
	
	" Fuzzy Finder
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	" Use release branch (recommend)
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" Closing bracketes automatically
	Plug 'jiangmiao/auto-pairs'

	" Start Screen
	Plug 'mhinz/vim-startify'

	" Colorscheme
	Plug 'dracula/vim', { 'as': 'dracula' }


" Init plugin system
call plug#end()

colorscheme dracula
set termguicolors

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

