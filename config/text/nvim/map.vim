
noremap <F3> :Autoformat<CR>
cmap w!! w !sudo tee % >/dev/null " For when you forget to sudo.. Really Write the file.
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit! " Save file as sudo on files that require root permission
command! TogglePrettier call s:TogglePrettier()
command! ToggleZoom call s:ToggleZoom() " shortcust for functions
imap <C-j> <Plug>(neosnippet_expand_or_jump)
imap ii <Esc> "Remap ESC to ii
imap <leader>d <esc>:call ToggleDeadKeys()<CR>a " vimling:
imap <leader>i <esc>:call ToggleIPA()<CR>a " vimling:
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap jj <ESC> " hitting jj in insert mode escapes
inoremap jk <ESC>
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l 
"inoremap <silent> <CR> <C-r>=<SID>deoplete_cr_function()<CR>
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <C-h> <C-w>h " Shortcutting split navigation, saving a keypress:
map <C-j> <C-w>j " Shortcutting split navigation, saving a keypress:
map <C-k> <C-w>k " Shortcutting split navigation, saving a keypress:
map <C-l> <C-w>l " Shortcutting split navigation, saving a keypress:
map <C-n> :NERDTreeToggle<CR>
map <C-q> :q!<Enter>
map <C-S> :w
map <C-s> :w<Enter>
map <C-p> "+P
map <leader>b :vsp<space>$BIB<CR> " Open my bibliography file in split
map <leader>c :w! \| !compiler <c-r>%<CR> " Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler <c-r>%<CR><CR> " Compile document
map <leader>f :Goyo \| set bg=light \| set linebreak<CR> " Goyo plugin makes text more readable when writing prose:
map <leader>f :Goyo \| set linebreak<CR> " Goyo plugin makes text more readable when writing prose
map <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader>n :NERDTreeToggle<CR> " Nerd tree
map <leader>o :setlocal spell! spelllang=en_us<CR> " Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>p :!opout <c-r>%<CR><CR> " Open corresponding .pdf/.html or preview
map <leader>r :nohl<CR><C-L> " Redraw the screen (clears search highlight)
map <leader>r :vsp<space>$REFER<CR> " Open my bibliography file in split
map <leader>s :!clear && shellcheck %<CR> " Check file in shellcheck:
map <leader>v :setlocal spell! spelllang=en_us,es<CR> " Spellcheck
map <Space><Tab> <Esc>/<++><Enter>"_c4l
nmap ¬ >>
nmap ˙ <<
nmap ∆ ]e
nmap ˚ [e " Bubble/indent lines using unimpaired using left alt + hjkl on mac usgerman keyboard those are some weird mappings, but they work!
nmap <leader>s <Plug>(easymotion-overwin-f)
nmap <leader>S <Plug>(easymotion-overwin-f2)
nmap ∏ <Plug>yankstack_substitute_newer_paste
nmap π <Plug>yankstack_substitute_older_paste
nm <leader>d :call ToggleDeadKeys()<CR> " vimling:
nm <leader>i :call ToggleIPA()<CR> " vimling:
nm <leader>q :call ToggleProse()<CR> " vimling:
nnoremap c "_c
nnoremap <C-V> v
nnoremap <down> :blast<cr>
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj' " jk nice behaviour (screen lines vs. shown lines)
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
nnoremap <F5> :checktime<CR>:redraw!<CR> " reload files when set autoread is active with F5
nnoremap K <nop>
nnoremap <leader>\ <C-w>v<C-w>l " open new vertical split and change to split
nnoremap <leader>f :TogglePrettier<CR> " ale fixing shortcut toggle
nnoremap <leader>gf /\v^[<\|=>]{7}( .*\|$)<CR> " Find merge conflict markers
nnoremap <leader>o :e <C-R>=expand("%:p:h") . "/" <CR> " Opens an edit command with the path of the currently edited file filled in
nnoremap <leader>p p`[v`]= " paste keeping indentation
nnoremap <leader>r :checktime<CR> " reload files when set autoread is active with F5
nnoremap <leader>ve <C-w>v<C-w>l :e ~/.config/nvim/init.vim<cr> " open a new split and edit the vimrc // easy sourcing vimrc
nnoremap <leader>vs :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>w :set wrap! wrap?<CR> " toggle wrapping
nnoremap <leader>y :call system('nc localhost 8377', @0)<CR> " Yank to clipboard with clipper -- see https://github.com/wincent/clipper
nnoremap <leader>z :ToggleZoom<CR> " zoomwindow
nnoremap <left> :bp<cr>
nnoremap n nzz
nnoremap N Nzz " Search mappings: These will make it so that going to the next one in a search will center on the line it's found in.
nnoremap Q <nop> " deactivate stupid ex-mode and man-page stuff
nnoremap ; : " remap semi-colon to be colon in normal an visual mode
nnoremap <right> :bn<cr>
nnoremap <silent> <BS> :TmuxNavigateLeft<cr> " fix a bug in neovim/tmux-navigator
nnoremap <silent> <leader>gb :Gblame<CR><C-w>20+
nnoremap <silent> <leader>gc :Gcommit<CR><C-w>20+
nnoremap <silent> <leader>gd :Gvdiff<CR><C-w>20+
nnoremap <silent> <leader>gs :Gstatus<CR><C-w>20+
nnoremap <silent> <leader>gw :Gwrite<CR><C-w>20+
nnoremap <silent> <space>a :Rg<cr>
nnoremap <silent> <space>. :Buffers<cr>
nnoremap <silent> <space>, :Files<cr>
nnoremap <silent> <space>h :History:<cr>
nnoremap <silent> <space>l :Lines<cr>
nnoremap S :%s//g<Left><Left> " Replace all is aliased to S.
nnoremap S :%s//<Left> " Replace all is aliased to S.
nnoremap <up> :bfirst<cr> " use the arrowkeys for usefull stuff in normal mode -- switching buffers
nnoremap v <C-V> " Swap v and CTRL-V, because Block mode is more useful
nnoremap Y y$ " behave - yank just like D and C
noremap <F1> <ESC> " no help while mishitting ESC - awesome just type :help if you need help is easier
smap <C-j> <Plug>(neosnippet_expand_or_jump)
vmap ∆ ]egv
vmap ˚ [egv
vmap ¬ >gv
vmap ˙ <gv
vnoremap ; :
vnoremap <C-c> "+y
vnoremap <C-V> v
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap v <C-V>
vnoremap y y :call system('nc localhost 8377', @0)<cr> " auto-yanking with clipper for selected yanking, see leader-y mapping
xmap <C-j> <Plug>(neosnippet_expand_target)

