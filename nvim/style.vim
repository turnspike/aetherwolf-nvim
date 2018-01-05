" gruvbox color reference: https://github.com/morhetz/gruvbox
" vim color reference: http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
" vim color tutorial: https://www.sbf5.com/~cduan/technical/vi/vi-4.shtml

set hlsearch
"highlight Search cterm=underline ctermfg=White ctermbg=24

set modelines=0
set noshowmode " suppress mode change messages

"augroup ErrorHiglights
"    autocmd!
"    "autocmd WinEnter,BufEnter * call clearmatches() | call matchadd('ErrorMsg', '\s\+$', 120) | call matchadd('ErrorMsg', '\%>120v.\+', 100)
"    autocmd WinEnter,BufEnter * call clearmatches() | call matchadd('ErrorMsg', '\s\+$', 120)
"augroup END

" -- hilight cursor position
set nocursorline
set nocursorcolumn
augroup Cursor
  autocmd!
  autocmd InsertEnter * set cursorline
  autocmd InsertLeave * set nocursorline
  "autocmd InsertEnter * set cursorcolumn
  "autocmd InsertLeave * set nocursorcolumn
  "autocmd InsertEnter * highlight CursorColumn ctermbg=237
  "autocmd InsertEnter * highlight CursorLine ctermbg=237 cterm=underline
  autocmd InsertEnter * highlight CursorLine ctermbg=none cterm=underline
augroup END

set background=dark
colorscheme gruvbox
syntax enable " enable syntax highlighting
" -- gutter
highlight GitGutterAdd ctermbg=235 ctermfg=142
highlight GitGutterChange ctermbg=235 ctermfg=106
highlight GitGutterDelete ctermbg=235 ctermfg=142
highlight GitGutterChangeDelete ctermbg=235 ctermfg=142
highlight SignColumn ctermbg=235 guibg=#282828

highlight StatusLine ctermbg=235 cterm=none gui=none
highlight StatusLineNC ctermbg=235 cterm=none gui=none
"highlight Normal ctermbg=235 cterm=none gui=none guibg=#282828
"
highlight TabLineFill ctermbg=235 cterm=none gui=none
"highlight TabLine ctermfg=Blue
"highlight TabLineSel ctermfg=124
"highlight Title ctermfg=LightBlue
" hide ~ for blank lines at bottom of buffer - 235 is the gruvbox bg color code
highlight EndOfBuffer ctermfg=235
highlight VertSplit ctermbg=235 ctermfg=235

augroup Highlights
  autocmd!
  " fix search hilite colors
  "hi Search cterm=NONE ctermfg=Yellow ctermbg=DarkGray
  "colorscheme colorsbox-seighties
  "colorscheme colorsbox-stblue
augroup END

"augroup PluginTabline
"  autocmd!
"  " set alternate color for modified active/inactive tabs
"  autocmd VimEnter *
"   \ let g:airline#themes#gruvbox#palette.tabline = {
"   \    'airline_tabmod':       ['#f8f8f8','#780000',231,88,''],
"   \    'airline_tabmod_unsel': ['#dddddd','#463030',231,52,''],
"   \ } | :AirlineRefresh
"  "hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
"  "hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
"  "hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE
"augroup END

" -- split dividers
" don't use silly | characters for vertical split dividers (note significant whitespace)
set fillchars+=vert:\

"let opt_DimInactiveWin=0
"hi Inactive ctermfg=235
"fun! ToggleDimInactiveWin()
"  if g:opt_DimInactiveWin
"    autocmd! DimWindows
"    windo syntax clear Inactive
"  else
"    windo syntax region Inactive start='^' end='$'
"    syntax clear Inactive
"    augroup DimWindows
"      autocmd BufEnter * syntax clear Inactive
"      autocmd BufLeave * syntax region Inactive start='^' end='$'
"    augroup end
"  end
"  let g:opt_DimInactiveWin=!g:opt_DimInactiveWin
"endfun

"" -- change cursor to vertical bar for insert mode
"if exists('$TMUX')
"  let &t_SI = "\<esc>Ptmux;\<esc>\<esc>]50;CursorShape=1\x7\<esc>\\"
"  let &t_EI = "\<esc>Ptmux;\<esc>\<esc>]50;CursorShape=0\x7\<esc>\\"
"else
"  let &t_SI = "\<esc>]50;CursorShape=1\x7"
"  let &t_EI = "\<esc>]50;CursorShape=0\x7"
"endif

