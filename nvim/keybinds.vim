noremap <space> <nop>
let mapleader = "\<space>"
"let maplocalleader = "\<space>"
nmap <leader><leader> :


" -- LEADER KEYS --

"nunmap <leader>fml
nnoremap <leader>b :Buffers<cr>
"nmap <leader>c :call GAddCommit()<cr>
"" duplicate/clone line
"noremap <leader>d "ayy"ap
" cut to system clipboard
vnoremap <leader>d "+d
nnoremap <leader>D "+D
nnoremap <leader>dd "+dd
" in visual mode, leader-h does a global search/replace of the highlighted text
vnoremap <silent> <leader>h "hy:%s/<c-r>h/<paste>
" in normal mode, leader-h launches search/replace :ex command
nnoremap <silent> <leader>h :%s//<left>
" edit file relative from current buffer path
nnoremap <leader>e :e <c-r>=expand('%:p:h') . '/'<cr>
nnoremap <leader>ff :ProjectFiles<cr>
nnoremap <leader>fg :ProjectGrep<cr>
"nmap <leader>fr :ProjectMru --tiebreak=end<cr>
"nmap <leader>fr :FilesMru --tiebreak=end<cr>
nnoremap <leader>fr :History<cr>
nnoremap <leader>fb :BLines<cr>
" paste from system clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
"nmap <leader>/ :BLines<cr>
" double-tap leader to select current line in visual mode
"nmap <leader><leader> V
nnoremap <leader>q :w<cr>:Bd<cr>
nnoremap <leader>r :call NTChangeRoot()<cr>
nnoremap <leader>s :call SyncTree()<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>x :Bdelete!<cr>
" copy to system clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>yy "+yy
"nnoremap <silent> <leader>r :NERDTreeFind<cr>:TmuxNavigatePrevious<cr>
"nnoremap <leader>/ :BLines<cr>
nnoremap <leader>C :call NERDComment(0,"toggle")<cr>
vnoremap <leader>C :call NERDComment(0,"toggle")<cr>gv

call Cabbrev('vct', 'VimwikiToggleCalendar')
call Cabbrev('bi', 'FileInfo') " buffer info
call Cabbrev('bo', 'BufOnly')
call Cabbrev('bd', 'Bd') " sane buffer deletion
"call Cabbrev('bd', 'call CloseSplitOrDeleteBuffer()') " sane buffer deletion
call Cabbrev('ce', 'ConfigEdit')
call Cabbrev('cr', 'ConfigReload')
"" -- config
"call Cabbrev('ce', 'e $MYVIMRC')
"call Cabbrev('cr', 'so $MYVIMRC')
call Cabbrev('ff', 'ProjectGrep') " _fuzzy _in file
call Cabbrev('fb', 'Blines') " _fuzzy _in file

"nnoremap <leader>ff :Pfiles<cr>
"nnoremap <leader>fg :ProjectGrep<cr>
"nnoremap <leader>fr :ProjectMru --tiebreak=end<cr>
"nnoremap <leader>fb :BLines<cr>

"call Cabbrev('tf', 'FileInfo') " file info
"autocmd BufReadPost fugitive://* set bufhidden=delete
call Cabbrev('ga', 'Gwrite')
"nmap <leader>ga :Dispatch git add %:p<CR><CR>
call Cabbrev('gs', 'Gstatus')
call Cabbrev('gc', 'Gcommit -v -q')
call Cabbrev('gac', 'call GAddCommit()')
" TODO: how to chain Cabbrev commands??
"call Cabbrev('gac', 'Dispatch git add %:p<CR><CR>Gcommit -v -q')
call Cabbrev('gd', 'Gdiff')
call Cabbrev('gD', 'diffoff!<CR><c-w>h:bd') "clean way to close fugitive diff window
call Cabbrev('ge', 'Gedit')
call Cabbrev('ghn', 'GitGutterNextHunk')
call Cabbrev('ghp', 'GitGutterPrevHunk')
call Cabbrev('ghs', 'GitGutterStageHunk')
call Cabbrev('ghu', 'GitGutterUndoHunk')
call Cabbrev('gr', 'Gread')
"call Cabbrev('gl', 'silent! Glog<CR>:bot copen')
"call Cabbrev('gg', 'Ggrep<space>')
"call Cabbrev('gm', 'Gmove<space>')
"call Cabbrev('gb', 'Git branch<space>')
"call Cabbrev('go', 'Git checkout<space>')
call Cabbrev('gp', 'Dispatch! git push')
call Cabbrev('gu', 'Dispatch! git pull')
:command! Gwho Gblame " eeeeliminate the negativity
call Cabbrev('pf', 'Pfiles') " _fuzzy _filenames (in project)
call Cabbrev('pg', 'ProjectGrep') " _fuzzy _grep (in project)
call Cabbrev('pr', 'Pmru') " _fuzzy _recent (in project)
call Cabbrev('pb', 'Buffers') " _fuzzy _buffer

call Cabbrev('pv', 'VimwikiIndex')
call Cabbrev('pvd', 'VimwikiDiaryIndex')
call Cabbrev('pvn', 'VimwikiMakeDiaryNote')

"nnoremap <leader>ft :NERDTreeToggle<cr>
"" reveal the current file in NERDTree
"nnoremap <leader>fs :NERDTreeFind<cr><c-w><c-w>
""nnoremap <leader>nr :NERDTreeFocus<cr> \| R \| <c-w><c-p>
" edit file relative from current buffer path
call Cabbrev('tn', 'NERDTreeToggle')
call Cabbrev('tnf', 'NERDTreeFind')
call Cabbrev('tt', 'TagbarToggle')
call Cabbrev('w=', 'vsplit')
call Cabbrev('w/', 'split')
call Cabbrev('wd', 'call CloseSplitOrDeleteBuffer()')
call Cabbrev('wm', 'BufOnly')

" -- plugins

"TODO do these blat core vim shortcuts?
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

nnoremap ]h :GitGutterNextHunk<cr>zz
nnoremap [h :GitGutterPrevHunk<cr>zz
" note - gs blats shortcut for :sleep
nnoremap ghs :GitGutterStageHunk<cr>

nmap [p <plug>yankstack_substitute_older_paste
nmap ]p <plug>yankstack_substitute_newer_paste

" deoplete
"inoremap <silent><expr> <cr> pumvisible() ? "<c-n>" : "<cr>"
" esc closes popup
inoremap <silent><expr><esc> pumvisible() ? "<c-e><esc>" : "<esc>"
" enter inserts popup text and closes it
inoremap <silent><expr><cr> pumvisible() ? deoplete#mappings#close_popup() : "\<cr>"

" jumps, blatted by supertab
nnoremap [j <C-o>zz
nnoremap ]j <tab>zz

"-- movement

" extra ways to exit insert mode
inoremap <silent> jk <esc>
"imap <s-cr> <esc>

"" home key
"noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
"imap <silent> <Home> <C-O><Home>

" Emacs-like beginning and end of line.
" MFW THAT'S SOME SERIOUS HERESY
inoremap <c-e> <c-o>$
inoremap <c-a> <c-o>^
nnoremap <c-e> $
nnoremap <c-a> ^

" insert mode control enhancements
inoremap <silent> <c-f> <right>
inoremap <silent> <c-b> <left>

" press esc esc to clear hilites after searching
nnoremap <silent> <esc><esc> :nohlsearch<cr><esc>
"" -- neovim only
"if has("nvim")
"  "nnoremap <esc> :noh<return><esc>
"  nmap <silent> <esc>:noh<CR>:echo ""<CR><esc>
"endif

"---- buffers
" jump back from gf FIXME this doesn't really work
nnoremap gb :bf<cr>
"nnoremap <leader>bd :bdelete<cr>
"nnoremap <leader>bn :bnext<cr>
"nnoremap <leader>bp :bprev<cr>
"nnoremap <leader>bc :enew<cr>
"nnoremap <leader>bs :ls<CR>:b<space>

"---- splits
" Universal closing behavior
nnoremap <silent> Q :call CloseSplitOrDeleteBuffer()<cr>

"" manipulate splits
"nmap <leader>sv :vsplit<cr>
"nmap <leader>sh :split<cr>
"nmap <leader>sd :q<cr>
"nmap <leader>shg :resize +5<cr>
"nmap <leader>shs :resize -5<cr>
"nmap <leader>svg :vertical resize -5<cr>
"nmap <leader>svs :vertical resize +5<cr>

"call Cabbrev('shg', 'resize +5')
"call Cabbrev('shs', 'resize -5')
"call Cabbrev('shs', 'eq')
"call Cabbrev('svg', 'eq')

" -- selection

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
vmap V <Plug>(expand_region_shrink)

" -- indenting
" keep selection when indenting
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" -- copy/paste

" move point back to original position after yanking
vmap y ygv<esc>



" don't copy the contents of an overwritten selection
"vnoremap p "_dP

" nvim team says don't use pastetoggle :(
" https://github.com/neovim/neovim/issues/6551
" toggle autocommenting etc when pasting from websites
"set pastetoggle=<leader>t
"set pastetoggle=<leader>=

" select most recently edited/pasted text with gp
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" -- keep screen centered
nnoremap J mzJ`z
nnoremap n nzz
nnoremap { {zz
nnoremap } }zz
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" -- cursor
" move cursor naturally through wrapped lines
nnoremap <silent> j gj
nnoremap <silent> k gk

" -- lines

"---- files
"nnoremap <leader>s :w<cr>
"inoremap <leader>s <C-c>:w<cr>
"nnoremap <leader>e :Explore<cr>
"noremap <leader>q :bd<cr>
" write files as sudo using w!!
"cnoremap w!! %!sudo tee > /dev/null %
cnoremap w!! w !sudo tee % >/dev/null
" show file uri in command area
"nnoremap <leader>g :echo resolve(expand('%:p'))<CR>

" -- fix common typos
cnoreabbrev W w
cnoreabbrev X x
"cnoreabbrev Q q
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>

augroup Keybinds
  autocmd!
  "" q will quit help buffer
  autocmd FileType help noremap <buffer> q :q<cr>
augroup END
"" use Q to record macros (don't use Ex mode)
"nnoremap Q q
"" normal q does nothing
"nnoremap q <nop>
"" don't use q: command (TODO: find a replacement for q:)
"nmap q: <nop>

""---- fix macos arrow keys
"map ^[[A <up>
"map ^[[B <down>
"map ^[[C <right>
"map ^[[D <left>
"
"---- neovim
if has("nvim")
  " exit terminal mode
  tnoremap jk <C-\><C-n>
endif
