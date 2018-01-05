noremap <space> <nop>
let mapleader = "\<space>"
"let maplocalleader = "\<space>"
"nmap <leader><leader> :

" -- override plugin keybinds
"nunmap <leader>fml
nmap <leader>b :Buffers<cr>
nmap <leader>c :call GAddCommit()<cr>
nmap <leader>pf :Pfiles<cr>
nmap <leader>pg :Pgrep<cr>
nmap <leader>pr :ProjectMru --tiebreak=end<cr>
"nmap <leader>s :BLines<cr>
nmap <leader>/ :BLines<cr>
nmap <leader>x :Bdelete!<cr>
nmap <leader>w :w<cr>
nmap <leader>q :w<cr>:Bd<cr>
nnoremap <silent> <leader>f :NERDTreeFind<cr>:TmuxNavigatePrevious<cr>

" edit file relative from current buffer path
nnoremap <leader>e :e <c-r>=expand('%:p:h') . '/'<cr>
" expand %%<cr> to current path, eg :e %%/
cabbr <expr> %% expand('%:p:h')

command! -bang -nargs=* VimwikiToggleCalendar call ToggleCalendar()
call Cabbrev('vct', 'VimwikiToggleCalendar')
call Cabbrev('bo', 'BufOnly')
call Cabbrev('bd', 'Bd') " sane buffer deletion
call Cabbrev('ce', 'ConfigEdit')
call Cabbrev('cr', 'ConfigReload')
call Cabbrev('fs', 'BLines') " _fuzzy _in file
call Cabbrev('fi', 'FileInfo') " file info

" -- config
call Cabbrev('ce', 'e $MYVIMRC')
call Cabbrev('cr', 'so $MYVIMRC')
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
call Cabbrev('pg', 'Pgrep') " _fuzzy _grep (in project)
call Cabbrev('pr', 'Pmru') " _fuzzy _recent (in project)
call Cabbrev('pb', 'Buffers') " _fuzzy _buffer

call Cabbrev('pv', 'VimwikiIndex')
call Cabbrev('pvd', 'VimwikiDiaryIndex')
call Cabbrev('pvn', 'VimwikiMakeDiaryNote')

"nnoremap <leader>ft :NERDTreeToggle<cr>
"" reveal the current file in NERDTree
"nnoremap <leader>fs :NERDTreeFind<cr><c-w><c-w>
""nnoremap <leader>nr :NERDTreeFocus<cr> \| R \| <c-w><c-p>
call Cabbrev('tn', 'NERDTreeToggle')
call Cabbrev('tnf', 'NERDTreeFind')
call Cabbrev('tt', 'TagbarToggle')
call Cabbrev('w=', 'vsplit')
call Cabbrev('w/', 'split')
call Cabbrev('wd', 'q')
call Cabbrev('wm', 'BufOnly')

" -- plugins

"TODO do these blat core vim shortcuts?
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

nnoremap <c-N> :GitGutterNextHunk<cr>
nnoremap <c-P> :GitGutterPrevHunk<cr>
nnoremap <c-S> :GitGutterStageHunk<cr>

"nnoremap <leader>/ :BLines<cr>
nnoremap <leader>/ :call NERDComment(0,"toggle")<cr>
vnoremap <leader>/ :call NERDComment(0,"toggle")<cr>gv

" deoplete
"inoremap <silent><expr> <cr> pumvisible() ? "<c-n>" : "<cr>"
inoremap <silent><expr> <esc> pumvisible() ? "<c-e><esc>" : "<esc>"

" jumps, blatted by supertab
nnoremap [j <C-o>
nnoremap ]j <tab>

"-- movement

" extra ways to exit insert mode
imap <silent> jk <esc>
"imap <s-cr> <esc>

"" home key
"noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
"imap <silent> <Home> <C-O><Home>

" Emacs-like beginning and end of line.
" MFW THAT'S SOME SERIOUS HERESY
imap <c-e> <c-o>$
imap <c-a> <c-o>^
nmap <c-e> $
nmap <c-a> ^

" insert mode control enhancements
imap <silent> <c-f> <right>
imap <silent> <c-b> <left>

" -- searching
" in visual mode, leader-h does a global search/replace of the highlighted text
vnoremap <silent> <leader>h "hy:%s/<c-r>h/<paste>
" in normal mode, leader-h launches search/replace :ex command
nnoremap <silent> <leader>h :%s//<left>

" press esc to clear hilites after searching
" -- neovim only
if has("nvim")
  "nnoremap <esc> :noh<return><esc>
  nmap <silent> <esc>:noh<CR>:echo ""<CR><esc>
endif

"---- buffers
" jump back from gf
nnoremap gb :bf<cr>
"nnoremap <leader>bd :bdelete<cr>
"nnoremap <leader>bn :bnext<cr>
"nnoremap <leader>bp :bprev<cr>
"nnoremap <leader>bc :enew<cr>
"nnoremap <leader>bs :ls<CR>:b<space>

"---- splits

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

"" move point back to original position after yanking
"vmap y ygv<Esc>

" cut to system clipboard
vnoremap <leader>d "+d
nnoremap <leader>D "+D
nnoremap <leader>dd "+dd

" copy to system clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>yy "+yy

" paste from system clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" don't copy the contents of an overwritten selection
"vnoremap p "_dP

" nvim team says don't use pastetoggle :(
" https://github.com/neovim/neovim/issues/6551
" toggle autocommenting etc when pasting from websites
"set pastetoggle=<leader>t
"set pastetoggle=<leader>=

" select most recently edited/pasted text with gp
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" -- editing
nnoremap J mzJ`z
nnoremap n nzz
nnoremap } }zz

" -- cursor
" move cursor naturally through wrapped lines
nnoremap <silent> j gj
nnoremap <silent> k gk

" -- lines

" double-tap leader to select current line in visual mode
nmap <leader><leader> V

" duplicate/clone line
noremap <leader>d "ayy"ap

"---- files
"nnoremap <leader>s :w<cr>
"inoremap <leader>s <C-c>:w<cr>
"nnoremap <leader>e :Explore<cr>
"noremap <leader>q :bd<cr>
" write files as sudo using w!!
"cnoremap w!! %!sudo tee > /dev/null %
cmap w!! w !sudo tee % >/dev/null
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

"---- neovim
if has("nvim")
  " exit terminal mode
  tnoremap jk <C-\><C-n>
endif
