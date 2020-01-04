let mapleader =","

"To ignore plugin indent changes, instead use:
"filetype plugin on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
	Plug 'bling/vim-airline'
	Plug 'honza/vim-snippets'
	Plug 'jreybert/vimagit'
	Plug 'junegunn/goyo.vim'
	Plug 'Konfekt/FastFold'
	Plug 'kovetskiy/sxhkd-vim'
	Plug 'lervag/vimtex'
	Plug 'LukeSmithxyz/vimling'
	Plug 'matze/vim-tex-fold'
"	Plug 'vigoux/LanguageTool.nvim'
	Plug 'dpelle/vim-LanguageTool'
	Plug 'PotatoesMaster/i3-vim-syntax'
	Plug 'scrooloose/nerdtree'
"	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'SirVer/ultisnips'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'vifm/vifm.vim'
	Plug 'vimwiki/vimwiki'
	Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
call plug#end()


set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.config/nvim/autoload/Vundle.vim
call vundle#begin('~/.config/nvim/plugins')		" required, all plugins must appear after this line.
	Plugin 'gmarik/Vundle.vim'							" Vundle
	Plugin 'vim-airline/vim-airline'					" Airline
	Plugin 'vim-airline/vim-airline-themes'				" Airline Themes
	Plugin 'scrooloose/nerdtree'						" added nerdtree
	Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plugin 'ryanoasis/vim-devicons'
	Plugin 'vim-python/python-syntax'
	Plugin 'jreybert/vimagit'
	Plugin 'severin-lemaignan/vim-minimap'
	Plugin 'vimwiki/vimwiki'                            " Vim wiki
	Plugin 'ap/vim-css-color'                           " Color previews for CSS
	Plugin 'tpope/vim-surround'                         " Change surrounding marks
	Plugin 'hsitz/VimOrganizer'							" Org Mode
call vundle#end()		" required, all plugins must appear before this line.


set rtp+=~/.config/nvim/autoload/dein.vim
if dein#load_state('~/.config/nvim/dein')
call dein#begin(expand('~/.config/nvim/dein'))
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('junegunn/fzf', { 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('junegunn/gv.vim')
  call dein#add('maxbrunsfeld/vim-yankstack')
  call dein#add('moll/vim-node')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/unite.vim')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-eunuch')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-ragtag')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('tpope/vim-vinegar')
  call dein#add('w0ng/vim-hybrid')
  call dein#add('w0rp/ale')
  call dein#add('webgefrickel/vim-snippets')
  call dein#add('wellle/targets.vim')
  call dein#add('wellle/tmux-complete.vim')
  call dein#add('wincent/terminus')
call dein#end()
call dein#save_state()
endif
 if dein#check_install()
  call dein#install()
endif



execute pathogen#infect()
syntax enable
syntax on
filetype plugin indent on
startinsert
language en_US.UTF-8
execute pathogen#helptags()


source ~/.config/nvim/functions.vim
source ~/.config/nvim/set.vim
source ~/.config/nvim/autocmd.vim
source ~/.config/nvim/map.vim
source ~/.config/nvim/let.vim


