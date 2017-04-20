"---- note: plugin specific keybinds live in plugins.vim, filetype keybinds live in filetypes.vim

let mapleader = "\<space>"
let maplocalleader = "\<space>"

"---- movement

" extra ways to exit insert mode
imap jk <esc>
"imap <s-cr> <esc>

" insert mode control enhancements
imap <c-f> <right>
imap <c-b> <left>

"---- searching
" in visual mode, leader-h does a global search/replace of the highlighted text
vnoremap <leader>h "hy:%s/<c-r>h//g<left><left><paste>
" in normal mode, leader-h launches search/replace :ex command
nnoremap <leader>h :%s///g<left><left><left>
" press esc to clear hilites after searching
nnoremap <esc> :noh<return><esc>

"---- buffers
"nnoremap <leader>bd :bdelete<cr>
"nnoremap <leader>bn :bnext<cr>
"nnoremap <leader>bp :bprev<cr>
"nnoremap <leader>bc :enew<cr>
"nnoremap <leader>bs :ls<CR>:b<space>

"---- splits

" manipulate splits
nmap <leader>sv :vsplit<cr>
nmap <leader>sh :split<cr>
nmap <leader>sd :q<cr>
nmap <leader>shg :resize +5<cr>
nmap <leader>shs :resize -5<cr>
nmap <leader>svg :vertical resize -5<cr>
nmap <leader>svs :vertical resize +5<cr>

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

" toggle autocommenting etc when pasting from websites
"set pastetoggle=<leader>t
"set pastetoggle=<leader>=

"---- cursor
" move cursor naturally through wrapped lines
nnoremap j gj
nnoremap k gk

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
"nnoremap <leader>e :Explore<cr>
noremap <leader>q :q<cr>
" write files as sudo using w!!
"cnoremap w!! %!sudo tee > /dev/null %
cmap w!! w !sudo tee % >/dev/null

" vimrc
nnoremap <leader>ce :e $MYVIMRC<cr>
nnoremap <leader>cr :so $MYVIMRC<cr>

"---- fix common typos
" use Q to record macros (don't use Ex mode)
nnoremap Q q
" normal q does nothing
nnoremap q <nop>
" don't use q: command (TODO: find a replacement for q:)
map q: <nop>

"---- neovim
if has("nvim")
  " exit terminal mode
  tnoremap jk <C-\><C-n>
endif
