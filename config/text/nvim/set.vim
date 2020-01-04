au BufEnter *.org            call org#SetOrgFileType()
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
au WinLeave * setlocal statusline=%!MyStatusLine('Leave')
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit! " Save file as sudo on files that require root permission
hi clear SpellBad
hi CursorLineNr ctermfg=15
hi LineNr ctermfg=242
hi NoStatusLineColor ctermbg=black ctermfg=lightgrey
hi SpellBad cterm=underline ctermfg=red
hi SpellBad gui=undercurl
hi Statement ctermfg=3
hi StatusLineColor ctermbg=white ctermfg=black
hi VertSplit ctermfg=8 ctermbg=0
hi LanguageToolGrammarError  guisp=blue gui=undercurl guifg=NONE guibg=NONE ctermfg=white ctermbg=blue term=underline cterm=none
hi LanguageToolSpellingError guisp=red  gui=undercurl guifg=NONE guibg=NONE ctermfg=white ctermbg=red  term=underline cterm=none

"ino <Down> <Nop> "Disable arrow keys in Insert mode
"ino <Left> <Nop> "Disable arrow keys in Insert mode
"ino <Right> <Nop> "Disable arrow keys in Insert modes
"ino <Up> <Nop> "Disable arrow keys in Insert mode
nnoremap c "_c
"no <Down> <Nop> "Disable arrow keys in Normal mode
"no <Left> <Nop> "Disable arrow keys in Normal mode
"no <Right> <Nop> "Disable arrow keys in Normal mode
"no <Up> <Nop> "Disable arrow keys in Normal mode

set autoindent
set background=dark
set bg=light
set breakindent
set clipboard+=unnamedplus
set cmdheight=2
set cpoptions+=$ " Add a $ to the end of a selection
set cpoptions+=J " 2 spaces after a sentence for easier text manupulation
"set cursorline
set encoding=utf-8 " Some basics:
set expandtab
set fileformat=unix
set fillchars=
set foldignore=
set foldlevelstart=1 " deactivate folding on fileload
set foldmethod=indent " indent folding
set foldnestmax=20 " max 20 levels of folding
set gdefault
set go=a
set grepprg=ag " use ag for grepping
set hidden
set hlsearch
set ignorecase
set incsearch
set infercase
set laststatus=2 " Always show statusline
set lazyredraw
set list!
set listchars=extends:»,precedes:«,tab:▸\ ,trail:·
set modifiable
set mouse=a
set mouse=nicr
set nobackup
set noerrorbells
set nofoldenable
set nohlsearch
set noshowmode " Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noswapfile
set nowrap
set nowritebackup 
set number relativenumber " Some basics:
set pastetoggle=<F2>
set path+=**					" Searches current directory recursively.
set relativenumber
set scrolljump=5
set scrolloff=3
set shell=/bin/bash
set shiftround
set shiftwidth=2
set showbreak=\\\\\
set showmatch
set sidescroll=10
set sidescrolloff=5
set statusline=%!MyStatusLine('Enter')
set smartcase
set smartindent
set smarttab
set softtabstop=2
set spell spelllang=en
set splitbelow splitright " Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set tabstop=2
set ts=4 sw=4
set virtualedit=all
set visualbell
set wildmenu					" Display all matches when tab complete.
set wildmode=list:longest,list:full
set wildmode=longest,list,full " Enable autocompletion:
set wrapscan


