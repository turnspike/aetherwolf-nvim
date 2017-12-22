" fix search hilite colors
"hi Search cterm=NONE ctermfg=Yellow ctermbg=DarkGray
"colorscheme colorsbox-seighties
"colorscheme colorsbox-stblue
set background=dark
colorscheme gruvbox
syntax enable " enable syntax highlighting

" gruvbox color reference: https://github.com/morhetz/gruvbox
" vim color reference: http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
" vim color tutorial: https://www.sbf5.com/~cduan/technical/vi/vi-4.shtml

" hide ~ for blank lines at bottom of buffer - 235 is the gruvbox bg color code
highlight EndOfBuffer ctermfg=235
set hlsearch
"highlight Search cterm=underline ctermfg=White ctermbg=24

set modelines=0
set noshowmode " suppress mode change messages

augroup ErrorHiglights
    autocmd!
    autocmd WinEnter,BufEnter * call clearmatches() | call matchadd('ErrorMsg', '\s\+$', 120) | call matchadd('ErrorMsg', '\%>120v.\+', 100)
augroup END

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

" -- change cursor to vertical bar for insert mode
if exists('$TMUX')
	let &t_SI = "\<esc>Ptmux;\<esc>\<esc>]50;CursorShape=1\x7\<esc>\\"
	let &t_EI = "\<esc>Ptmux;\<esc>\<esc>]50;CursorShape=0\x7\<esc>\\"
else
	let &t_SI = "\<esc>]50;CursorShape=1\x7"
	let &t_EI = "\<esc>]50;CursorShape=0\x7"
endif

