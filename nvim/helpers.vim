
" the built-in vim cabbrev replaces all command strings including search /
" we only want to remap :example commands
" https://stackoverflow.com/questions/3878692/aliasing-a-command-in-vim/3879737#3879737
fu! Cabbrev(key, value)
  exe printf('cabbrev <expr> %s (getcmdtype() == ":" && getcmdpos() <= %d) ? %s : %s',
    \ a:key, 1+len(a:key), string(a:value), string(a:key))
endfu

function! GAddCommit() " add file and commit in one command
  exe ":w"
  "exe ":Gwrite"
  exe "Dispatch git add %:p"
  exe ":Gcommit -v -q"
endfunction

function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction

:command! FileInfo :echo resolve(expand('%:p'))

function! CopyCurrentFilePath() " {{{
  let @+ = expand('%')
  echo @+
endfunction

" -- nerdtree
" returns true iff is NERDTree open/active
function! IsNTOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNTOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" -- deopleete

function! s:my_cr_function()
  return deoplete#mappings#smart_close_popup() . "\<CR>"
endfunction

imap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ deoplete#mappings#manual_complete()

function! s:check_back_space()
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" FZF
" lifted from: https://github.com/junegunn/fzf.vim/issues/47#issuecomment-160237795
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()
" lifted from: https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
command! -bang -nargs=* ProjectGrep call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).' '.s:find_git_root(), 1, <bang>0) " search file content within proj scope
"set grepprg=rg\ --vimgrep

" smart indent when entering insert mode with i on empty lines
" https://stackoverflow.com/questions/3003393/vim-smart-indent-when-entering-insert-mode-on-blank-line
function! IndentWithI()
    if len(getline('.')) == 0
        return "\"_cc"
    else
        return "i"
    endif
endfunction
nnoremap <expr> i IndentWithI()

" expand %%<cr> to current path, eg :e %%/
cabbr <expr> %% expand('%:p:h')
command! -bang -nargs=* VimwikiToggleCalendar call ToggleCalendar()

" -- airline

function! RefreshUI()
  if exists(':AirlineRefresh')
    AirlineRefresh
  else
    " Clear & redraw the screen, then redraw all statuslines.
    redraw!
    redrawstatus!
  endif
endfunction

command! ConfigEdit edit $MYVIMRC " edit config file
command! ConfigReload source $MYVIMRC | :call RefreshUI() " live reload config

command! FileInfo :echo resolve(expand('%:p'))
cmap w!! w !sudo tee % >/dev/null

"autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
" autocmd BufEnter * silent! if bufname('%') !~# 'NERD_tree_' | cd %:p:h | NERDTreeCWD | wincmd p | endif
"autocmd CursorHold,CursorHoldI * call NERDTreeFocus() | call g:NERDTree.ForCurrentTab().getRoot().refresh() | call g:NERDTree.ForCurrentTab().render() | wincmd w

" FIXME sync nerdtree...
"command! -bang -nargs=* NERDTreeSync call g:nt_sync() " search file content within proj scope
"function! g:nt_sync()
"    exe ":NERDTreeFind"
"    exe "<c-w>l"
"endfunction
