"" initialise vimplug
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.local/share/nvim/plugged')

"---- editing

Plug 'tpope/vim-unimpaired' " use ] and [ combos for :ex commands, eg ]b for next buffer
Plug 'matze/vim-move' " move chunks using <A-k> and <A-j>
Plug 'timkendrick/vim-duplicate' " duplicate chunks using <leader>-d
map <leader>d <Plug>Duplicate

" visually select outwards using <v>
Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" region commenting
Plug 'scrooloose/nerdcommenter'
let g:NERDDefaultAlign = 'left' " comment delimiters hard left
"let g:NERDCompactSexyComs = 1 " use compact syntax for prettified multi-line comments
let g:NERDCommentEmptyLines = 1 " allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " enable trimming of trailing whitespace when uncommenting

" whitespace
"Plug 'thirtythreeforty/lessspace.vim' "strip whitespace only on edited lines
Plug 'ntpeters/vim-better-whitespace' " hilight and work with trailing whitespace
autocmd BufEnter * EnableStripWhitespaceOnSave " auto strip whitespace

"---- searching
Plug 'wincent/loupe' " make current search match more obvious
let g:LoupeVeryMagic=0 " don't prepend \v to searches

"---- version control

" show git line status in left gutter
Plug 'airblade/vim-gitgutter'
"nnoremap <leader>gg :GitGutterToggle<CR>

" TODO: add fugitive and learn it

"---- codesense

Plug 'tpope/vim-surround' " bracket manipulation eg cs'<p>
Plug 'idbrii/vim-endoscope' " c-S to close tag/scope
Plug 'ervandew/supertab' " autocomplete by pressing tab (overlay for ctrl-p, ctrl-x etc)
" TODO: kspell
" TODO: ctags

"---- sessions
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

silent !mkdir ~/.cache/vim/sessions > /dev/null 2>&1
let g:session_directory = "~/.cache/vim/sessions"
let g:session_autoload = "yes"
let g:session_autosave = "yes"
let g:session_command_aliases = 1

nnoremap <leader>so :OpenSession<cr>
nnoremap <leader>ss :SaveSession<cr>
nnoremap <leader>sd :DeleteSession<cr>
nnoremap <leader>sc :CloseSession<cr>

"---- project plugins (files, outlines, layouts...)

"Plug 'justinmk/vim-dirvish'

"Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
nnoremap <leader>nt :NERDTreeToggle<cr>
" reveal the current file in NERDTree
nnoremap <leader>nf :NERDTreeFind<cr>
" don't blat <c-j> and <c-k> (used for split movement)
let g:NERDTreeMapJumpPrevSibling='<Nop>'
let g:NERDTreeMapJumpNextSibling='<Nop>'

Plug 'tpope/vim-vinegar' " use - (minus) to launch a modified netrw file browser

" tpope/vim-sleuth

" show tag sidebar for current file
Plug 'majutsushi/tagbar'
let g:tagbar_usearrows = 1
nnoremap <leader>tt :TagbarToggle<CR>

" TODO macos/homebrew
" set rtp+=/usr/local/opt/fzf

" fuzzy finder navigator
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_command_prefix = 'Fzf' " use :Fzf prefix
nnoremap <leader>ff :FzfFiles<cr>
nnoremap <leader>fb :FzfBuffers<cr>

" ctrlp navigator
let g:ctrlp_extensions = ['funky']
"let g:ctrlp_extensions = ['funky','switcher']
Plug 'ctrlpvim/ctrlp.vim'
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor " use ag over grep
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""' " use ag in CtrlP for listing files
  let g:ctrlp_use_caching = 0 " ag is fast enough that CtrlP doesn't need to cache
endif

nnoremap <leader>b :CtrlPBuffer<cr>

Plug 'tacahiroy/ctrlp-funky'
nnoremap <leader>cu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <leader>cU :execute 'CtrlPFunky ' . expand('<cword>')<cr>

"Bundle 'iurifq/ctrlp-rails.vim'
":CtrlPModels
":CtrlPControllers
":CtrlPViews
":CtrlPLibs
":CtrlPSpecs
":CtrlPMigrations

"Plug 'ivan-cukic/vim-ctrlp-switcher'
"let g:ctrlpswitcher_mode = 1

"---- REPL

Plug 'thinca/vim-quickrun'
nnoremap <leader>5 :QuickRun<cr>

"Plug 'benmills/vimux'
"Plug 'epeli/slimux'

"---- terminal enhancements

" tmux integration
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

"Plug 'wincent/terminus' " change cursor shape with mode
"let g:TerminusMouse=0

"---- linting

 "Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') } " in-buffer word completion
 "let g:deoplete#enable_at_startup = 1 " enable deoplete

"---- status bar mods
Plug 'bling/vim-airline'

" airline - use unicode symbols (terminal friendly)
" TODO make conditional on term mode
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '❖'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = '✂' " :set paste symbol
let g:airline_symbols.spell = 's'
let g:airline_symbols.notexists = '✖'
let g:airline_symbols.whitespace = '☰' " mixed whitespace warnings

"let g:airline_section_c = '' " default is (bufferline or filename)
"let g:airline_section_x = '' " default is (tagbar, filetype, virtualenv)
let g:airline_section_y = '' " default is (fileencoding, fileformat)

"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#show_buffers = 0
"let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#branch#empty_message  =  "no .git"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#syntastic#enabled     =  1
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter

Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'powerlineish'

" show marks in left gutter
Plug 'kshenoy/vim-signature'

" start screen menu
Plug 'mhinz/vim-startify'

"---- languages
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'aklt/plantuml-syntax' " plantuml
Plug 'scrooloose/vim-slumlord' " plantuml live preview
Plug 'vim-ruby/vim-ruby' " ruby syntax
Plug 'tpope/vim-rails' " rails syntax
"Plug 'skalnik/vim-vroom' " run tests

"Bundle 'astashov/vim-ruby-debugger'
"Bundle 'ecomba/vim-ruby-refactoring'
"Bundle 'skwp/vim-ruby-conque'
"Bundle 'tpope/vim-rails.git'
"Bundle 'tpope/vim-rake.git'
"Bundle 'tpope/vim-rvm.git'
"Bundle 'vim-ruby/vim-ruby.git'
"Bundle 'vim-scripts/Specky.git'
"Bundle 'ck3g/vim-change-hash-syntax'

call plug#end()

