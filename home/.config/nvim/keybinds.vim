"map <space> :
let mapleader = "\<space>"
let maplocalleader = "\<space>"

"---- movement

" extra ways to exit insert mode
imap <silent> jk <esc>
"imap <s-cr> <esc>

" insert mode control enhancements
imap <silent> <c-f> <right>
imap <silent> <c-b> <left>

"---- searching
" in visual mode, leader-h does a global search/replace of the highlighted text
vnoremap <silent> <leader>h "hy:%s/<c-r>h/<paste>
" in normal mode, leader-h launches search/replace :ex command
nnoremap <silent> <leader>h :%s//<left>

" press esc to clear hilites after searching
"---- neovim only
if has("nvim")
	"nnoremap <esc> :noh<return><esc>
	nmap <silent> <esc>:noh<CR>:echo ""<CR><esc>
endif

"---- buffers
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

call Cabbrev('sv', 'vsplit')
call Cabbrev('sh', 'split')
call Cabbrev('sd', 'q')
call Cabbrev('shg', 'resize +5')
call Cabbrev('shs', 'resize -5')
"call Cabbrev('shs', 'eq')
"call Cabbrev('svg', 'eq')

"---- copy/paste
" move point back to original position after yanking
vmap y ygv<Esc>
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

"---- cursor
" move cursor naturally through wrapped lines
nnoremap <silent> j gj
nnoremap <silent> k gk

"---- lines

" double-tap leader to select current line in visual mode
nmap <leader><leader> V

" duplicate/clone line
noremap <leader>d "ayy"ap

"---- paragraphs
" clone
noremap <leader>pc vipy'>pO<esc>j
" delete
noremap <leader>pd vipddd

"---- selections
" clone
noremap <leader>vc y'>pO<esc>j
" delete
noremap <leader>vd gvd

"---- files
"nnoremap <leader>s :w<cr>
"inoremap <leader>s <C-c>:w<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>x :w<cr>:bd<cr>
"nnoremap <leader>e :Explore<cr>
noremap <leader>q :bd<cr>
" write files as sudo using w!!
"cnoremap w!! %!sudo tee > /dev/null %
cmap w!! w !sudo tee % >/dev/null
" show file uri in command area
"nnoremap <leader>g :echo resolve(expand('%:p'))<CR>
:command! FileInfo :echo resolve(expand('%:p'))
call Cabbrev('af', 'FileInfo') " af About File

" vimrc
"nnoremap <leader>ce :e $MYVIMRC<cr>
"nnoremap <leader>cr :so $MYVIMRC<cr>

call Cabbrev('ce', 'e $MYVIMRC')
call Cabbrev('cr', 'so $MYVIMRC')

"---- fix common typos
cnoreabbrev W w
cnoreabbrev Q q
" q will quit help buffer
autocmd FileType help noremap <buffer> q :q<cr>
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
