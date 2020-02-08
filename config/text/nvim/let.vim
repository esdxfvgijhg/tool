"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
"let g:airline_theme='angr'
let g:ale_fix_on_save = 0
let g:ale_linters_explicit = 1
let g:ale_lint_on_enter=1
let g:ale_lint_on_save=1
let g:ale_lint_on_text_changed=0
let g:deoplete#auto_complete_delay=150
let g:deoplete#auto_completion_start_length=4
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_smart_case=1
let g:EasyMotion_do_mapping=0
let g:EasyMotion_smartcase=1
let g:hybrid_custom_term_colors=1
let g:hybrid_reduced_contrast=0
let g:mapleader=","
let g:maplocalleader=","
let g:minimap_close='<leader>mc'
let g:minimap_highlight='Visual'
let g:minimap_show='<leader>mm'
let g:minimap_toggle='<leader>mt'
let g:minimap_update='<leader>mu'
let g:neosnippet#disable_runtime_snippets={ "_": 1 }
let g:neosnippet#scope_aliases={}
let g:neosnippet#scope_aliases['php']='php,html'
let g:neosnippet#scope_aliases['scss']='scss,css'
let g:neosnippet#snippets_directory='~/.config/nvim/dein/repos/github.com/webgefrickel/vim-snippets/snippets'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeDirArrowExpandable = '▸'
let g:Powerline_symbols='unicode'
let g:Powerline_theme='long'
let g:python_highlight_all = 1
let g:rehash256 = 1
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"

let g:polyglot_disabled = ['latex']
let g:Tex_CompileRule_pdf = 'pdflatex --synctex=1 -interaction=nonstopmode $*'
let g:tex_conceal = ''
let g:Tex_DefaultTargetFormat = 'pdf'
let g:tex_flavor  = 'latex'
let g:Tex_ViewRule_pdf = 'evince_dbus.py'

let g:livepreview_engine = 'latexmk' . ' -lualatex -output-directory=.bin -shell-escape -synctex=1'
let g:livepreview_previewer = 'mupdf'

let g:vimtex_compiler_engine = 'latexmk -lualatex -output-directory=.bin -shell-escape -synctex=1'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_latexmk_options = '-lualatex -shell-escape -verbose -file-line-error -synctex=1 -interaction=nonstopmode'
let g:vimtex_latexmk_progname = 'nvr'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_viewer = 'evince'
"let g:vimtex_view_method='evince'

let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'} " Ensure files are read as what I want:
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}] " Ensure files are read as what I want:
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'} " Ensure files are read as what I want:
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let g:languagetool_jar='$LANGUAGETOOLPATH/languagetool-commandline.jar'
let g:languagetool_server_command='$LANGUAGETOOLPATH/languagetool-server.jar'


let g:ale_linters = {
  \ 'css': [],
  \ 'html': ['htmlhint'],
  \ 'javascript': ['eslint'],
  \ 'scss': ['sasslint'],
\}
let g:ale_fixers = {
  \ 'css': ['prettier'],
  \ 'javascript': ['prettier'],
  \ 'json': ['prettier'],
  \ 'jsx': ['prettier'],
  \ 'markdown': ['prettier'],
  \ 'scss': ['prettier'],
  \ 'yaml': ['prettier'],
\}



"let g:languagetool = {
  "\'.' : {
  "\  {model1} for all filetypes
  "\},
  "\'my_filetype' : {
  "\  {model1} for my_filetype
  "\}
  "\}{model1} = {
  "\'enabledRules' : list of enabled rules,
  "\'disabledRules' : list of disabled rules,
  "\'enabledCategories' : list of enabled categories,
  "\'disabledCategories' : list of disabled categories,
  "\'language' : the code of the language to check,
  "\  as given by :LanguageToolSupportedLanguages
  "\}
  
  
  
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf = 'latexmk -lualatex -output-directory=.bin -shell-escape -synctex=1 $*'
let g:vimtex_compiler_latexrun = { 
  \ 'background' : 1,
  \ 'build_dir' : 'latex.out',
  \ 'options' : [ 
  \   '--verbose-cmds',
  \   '--latex-cmd="latexmk"',
  \   '--latex-args="-lualatex -shell-escape"',
  \ ],
  \}
let g:vimtex_compiler_latexmk = {
  \ 'options' : [
  \   '-lualatex',
  \   '-shell-escape',
  \   '-verbose',
  \   '-file-line-error',
  \   '-synctex=1',
  \   '-interaction=nonstopmode',
  \ ],
  \}
let g:vimtex_compiler_latexmk = {
  \ 'options' : [
  \   '-pdf',
  \   '-pdflatex="lualatex --shell-escape %O %S"',
  \   '-verbose',
  \   '-file-line-error',
  \   '-synctex=1',
  \   '-interaction=nonstopmode',
  \ ]
  \}



" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}
" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'




