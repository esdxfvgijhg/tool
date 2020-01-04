" remap semi-colon to be colon in normal an visual mode
nnoremap ; :
vnoremap ; :

" Swap v and CTRL-V, because Block mode is more useful
nnoremap v <C-V>
nnoremap <C-V> v
vnoremap v <C-V>
vnoremap <C-V> v

" jk nice behaviour (screen lines vs. shown lines)
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" behave - yank just like D and C
nnoremap Y y$

" auto-yanking with clipper for selected yanking, see leader-y mapping
vnoremap y y :call system('nc localhost 8377', @0)<cr>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap N Nzz
nnoremap n nzz

" use the arrowkeys for usefull stuff in normal mode -- switching buffers
nnoremap <up> :bfirst<cr>
nnoremap <down> :blast<cr>
nnoremap <left> :bp<cr>
nnoremap <right> :bn<cr>

" fix a bug in neovim/tmux-navigator
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" Bubble/indent lines using unimpaired
" using left alt + hjkl on mac usgerman keyboard
" those are some weird mappings, but they work!
nmap ˚ [e
nmap ∆ ]e
nmap ˙ <<
nmap ¬ >>
vmap ˚ [egv
vmap ∆ ]egv
vmap ˙ <gv
vmap ¬ >gv

" no help while mishitting ESC - awesome
" just type :help if you need help is easier
noremap <F1> <ESC>


" Shortcutting split navigation, saving a keypress
 map <C-h> <C-w>h
 map <C-j> <C-w>j
 map <C-k> <C-w>k
 map <C-l> <C-w>l

" Navigating with guides
 inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
 vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
 map <Space><Tab> <Esc>/<++><Enter>"_c4l

" Redraw the screen (clears search highlight)
 map <leader>r :nohl<CR><C-L>


" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck %<CR>

" Open my bibliography file in split
	map <leader>b :vsp<space>$BIB<CR>
	map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>



" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
	
	
" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>


" Goyo plugin makes text more readable when writing prose
 map <leader>f :Goyo \| set linebreak<CR>

" Spellcheck
 map <leader>v :setlocal spell! spelllang=en_us,es<CR>

" Compile document
 map <leader>c :w! \| !compiler <c-r>%<CR><CR>

" Update dwmbar when changed.
 autocmd BufWritePost *dwmbar !killall dwmbar; setsid dwmbar &

" Open corresponding .pdf/.html or preview
 map <leader>p :!opout <c-r>%<CR><CR>

" Replace all is aliased to S.
 nnoremap S :%s//<Left>


" Readmes autowrap text
"    autocmd BufRead,BufNewFile *.md set tw=79

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
 vnoremap <C-c> "+y
 map <C-p> "+P



" hitting jj in insert mode escapes
inoremap jj <ESC>
inoremap jk <ESC>

" deactivate stupid ex-mode and man-page stuff
nnoremap Q <nop>
nnoremap K <nop>

" reload files when set autoread is active with F5
nnoremap <F5> :checktime<CR>:redraw!<CR>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null
