"#-- note: plugin specific keybinds live in plugins.vim

" use space as leader key
map <space> <leader>
map <space><space> <leader><leader>
"let maplocalleader = ","

"#-- movement

" extra ways to exit insert mode
imap jk <esc>
"imap <s-cr> <esc>
map <c-j> <c-d>
map <c-k> <c-u>

" insert mode control enhancements
imap <c-f> <Right>
imap <c-b> <Left>

"#-- buffers
map <leader>bd :bdelete<cr>
map <leader>bn :bnext<cr>
map <leader>bp :bprev<cr>
map <leader>bc :enew<cr>

"#-- splits

" quicker window movement
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" manipulate splits
nmap <leader>sv :vsplit<cr>
nmap <leader>sh :split<cr>
nmap <leader>sd :q<cr>
nmap <leader>shg :resize +5<cr>
nmap <leader>shs :resize -5<cr>
nmap <leader>svg :vertical resize -5<cr>
nmap <leader>svs :vertical resize +5<cr>

"#-- copy/paste

" copy to system clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>yy "+yy

" paste from system clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" don't copy the contents of an overwritten selection
"vnoremap p "_dP

" toggle autocommenting etc when pasting from websites
set pastetoggle=<leader>zx

"#-- cursor
" move cursor naturally through wrapped lines
nnoremap j gj
nnoremap k gk

"#-- lines

" double-tap leader to select current line in visual mode
nmap <leader><leader> V

" duplicate/clone line
noremap <leader>d "ayy"ap

" join line
"...

"#-- paragraphs
" clone
noremap <leader>pc vipy'>pO<esc>j
" delete
noremap <leader>pd vipd

"#-- selections
" clone
noremap <leader>vc y'>pO<esc>j
" delete
noremap <leader>vd gvd

"-- files
"nnoremap <leader>s :w<cr>
"inoremap <leader>s <C-c>:w<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>e :Explore<cr>
noremap <leader>q :q<cr>
" write files as sudo using w!!
"cnoremap w!! %!sudo tee > /dev/null %
cmap w!! w !sudo tee % >/dev/null

" vimrc
nnoremap <leader>ce :e $MYVIMRC<cr>
nnoremap <leader>cr :so $MYVIMRC<cr>

"#-- fix common typos
" use Q to record macros (don't use Ex mode)
nnoremap Q q
" normal q does nothing
nnoremap q <nop>
" don't use q: command (TODO: find a remap for q:)
map q: <nop>

"#-- neovim
" exit terminal mode
tnoremap jk <C-\><C-n>
