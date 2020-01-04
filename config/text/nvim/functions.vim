function! StatuslineGitInfo()
  let git = fugitive#head()
  if git != ''
  return " ".fugitive#head()
  else
  return ""
endfunction
function! StatusLinePaste()
  if &paste
  return "PASTE"
  else
  return ""
  endif
endfunction
function! MyStatusLine(mode)
  let statusline = ""
  if a:mode == "Enter"
  let statusline .= "%#StatusLineColor#"
  else
  let statusline .= "%#NoStatusLineColor#"
  endif
  let statusline .= "\ %f\ %m%r %{StatuslineGitInfo()}\ "
  let statusline .= "%= "
  let statusline .= "%{toupper(mode())}"
  let statusline .= "\ %{StatusLinePaste()}"
  let statusline .= "%= "
  let statusline .= "\ %y\ %{&fileencoding?&fileencoding:&encoding}\/\%{&fileformat}\ \|\ %l:%c\ "
  return statusline
endfunction

function! s:deoplete_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction

" deactivate syntax highlighting when diffing
if &diff
  syntax off
endif

" Zoom / Restore window.
function! s:ToggleZoom() abort
  if exists('t:zoomed') && t:zoomed
  execute t:zoom_winrestcmd
  let t:zoomed = 0
  else
  let t:zoom_winrestcmd = winrestcmd()
  resize
  vertical resize
  let t:zoomed = 1
  endif
endfunction
function! s:TogglePrettier()
  if g:ale_fix_on_save == 0
  let g:ale_fix_on_save = 1
  echomsg "Prettier fixing is now enabled!"
  else
  let g:ale_fix_on_save = 0
  echomsg "Prettier fixing is now disabled!"
  endif
endfunction
