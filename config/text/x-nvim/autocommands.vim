" define a group `init` and initialize.
augroup init
  autocmd!

  " Remember last location/cursor in file
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

  " Autoresize windows/splits when vim resizes
  autocmd VimResized * wincmd =

  " spell correction on markdown files and mail (for mutt)
  autocmd FileType mail,markdown setlocal spell
  autocmd FileType mail,markdown setlocal wrap
  autocmd FileType mail,markdown setlocal spelllang=en,de

  " special settings for writing emails, flowed text at 72 width
  autocmd FileType mail setlocal textwidth=72
  autocmd FileType mail setlocal comments+=nb:>
  autocmd FileType mail setlocal formatoptions+=awq
  
  " Disable automatic commenting on newline
 autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right
 set splitbelow splitright


" Delete trailing whitespace on save
 autocmd BufWritePre * %s/\s\+$//e


" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Enable Goyo by default for mutt writting
	" Goyo's width will be the line limit in mutt.
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo \| set bg=light

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and vifm configs with new material:
	autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %



" Markdown shortcuts
 autocmd Filetype markdown map <F5> :w! \| :!compiler <c-r>%<CR><CR> \| :!opout <c-r>%<CR><CR>
 autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
 autocmd Filetype markdown,rmd inoremap ;n ---<Enter><Enter>
 autocmd Filetype markdown,rmd inoremap ;b ****<++><Esc>F*hi
 autocmd Filetype markdown,rmd inoremap ;s ~~~~<++><Esc>F~hi
 autocmd Filetype markdown,rmd inoremap ;e **<++><Esc>F*i
 autocmd Filetype markdown,rmd inoremap ;h ====<Space><++><Esc>F=hi
 autocmd Filetype markdown,rmd inoremap ;i ![](<++>)<++><Esc>F[a
 autocmd Filetype markdown,rmd inoremap ;a [](<++>)<++><Esc>F[a
 autocmd Filetype markdown,rmd inoremap ;1 #<Space><Enter><++><Esc>kA
 autocmd Filetype markdown,rmd inoremap ;2 ##<Space><Enter><++><Esc>kA
 autocmd Filetype markdown,rmd inoremap ;3 ###<Space><Enter><++><Esc>kA
 autocmd Filetype markdown,rmd inoremap ;l --------<Enter>



  " add the dash to keywords -- makes better css/js/html search
  " do this for specific files only (not in php/rb e.g.) where dashes are
  " not used in variable names (use camelCase instead here)
  autocmd BufNewFile,BufRead *.{js,css,scss,html} set iskeyword+=-
  autocmd BufNewFile,BufRead *.{js,css,scss,html} set iskeyword-=_
  autocmd BufNewFile,BufRead *.php set iskeyword-=-
  autocmd BufNewFile,BufRead neomutt-* set ft=mail

" Ensure files are read as intended
 let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
 autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
 autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
 autocmd BufRead,BufNewFile *.tex set filetype=tex


  " omnicompletion for some filetypes
  autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,php,twig setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

