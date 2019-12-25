set shell=/bin/bash

if &compatible
  set nocompatible
endif


" Add the dein installation directory into runtimepath
set runtimepath+=~/Aghiles/Tool/config/office/mail/nvim/dein/repos/github.com/Shougo/dein.vim
"set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim


if dein#load_state('~/Aghiles/Tool/config/office/mail/nvim/dein')
  call dein#begin('~/Aghiles/Tool/config/office/mail/nvim/dein')


  call dein#add($HOME.'/.cache/dein/repos/github.com/Shougo/dein.vim')
  " Add or remove your plugins here:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  "call dein#add('w0rp/ale')
  "Use unite.vim because it's easy to verify the installation.
  call dein#add('Shougo/unite.vim')
  " You can specify revision/branch/tag.
  "call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  call dein#add('~/Aghiles/Tool/config/office/mail/nvim/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif



  call dein#end()
  call dein#save_state()
endif

