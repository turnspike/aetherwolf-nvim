" -- tabs and spaces
set autoindent                   " copy indent from current line when starting a new line
set expandtab                    " spaces not tabs
set shiftwidth=2                 " spaces used in >>, <<, ==, and autoindent
"set smarttab                    " Remove smarttab since you don't want to use tab characters
set softtabstop=2                " set tab to use 4 space characters
set tabstop=2                    " width of tab character

" -- don't hard wrap or autoformat
set nowrap
set textwidth=0
set linebreak
set formatoptions=l

" -- buffers and splits
set hidden " enable multi file editing
set splitbelow " open hsplits down (defaults up)
set splitright " open vsplits right (defaults left)
"set autochdir " set working directory to current file eg for :e

" -- cursor movement
set backspace=indent,eol,start
set nostartofline " preserve column on page movements

augroup Cursor
  autocmd!
  autocmd InsertEnter,InsertLeave * set cul! " underline current line for insert mode only
  "autocmd InsertEnter * set cul
  "autocmd InsertLeave * set nocul
augroup END

" -- timeouts (leader keys, esc)
set ttimeout
set ttimeoutlen=100

" -- commandline
set path+=** " search down into subfolders
set wildmenu " <tab> autocompletion in commandline
set wildmode=list:longest,full " more linuxy filename completion with <tab>
set wildignore+=*/tmp/*,*/.git/*,*.so,*.swp,*.zip " exclude from <tab> completion
"set rtp+=~/.fzf " add fuzzy finder to runtime path

" -- backups
set nobackup
set noswapfile
set nowritebackup

" -- search and replace
"set gdefault " always use /g with %s/
set hlsearch " highlight search hits
set incsearch "incremental search
set wrapscan
set ignorecase
set smartcase
set infercase

" -- copy/paste
"" yank and paste with the system clipboard under x11 (ie not ssh)
"if (executable('pbcopy') || executable('xclip') || executable('xsel')) && has('clipboard')
"    "set clipboard=unnamed
"endif

" -- splits
set hidden " enable multi file editing
set splitbelow " open hsplits down (defaults up)
set splitright " open vsplits right (defaults left)

" -- input
set noshowcmd " don't display keypresses in bottom right of screen - it's distracting
set timeout " use timeouts for keyboard combo mappings
set timeoutlen=200 ttimeoutlen=0 " 200ms for key combos, 0ms for <esc>

" -- mouse
set mouse=n
if exists(':ttymouse')
  set ttymouse = xterm2
endif

" -- folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" -- sessions
"set ssop-=options    " do not store global and local values in a session
"set ssop-=folds      " do not store folds

" -- backups
"let g:cache_home=$XDG_CACHE_HOME.'/nvim'
"silent !mkdir expand(g:cache_home) > /dev/null 2>&1
"execute "set backupdir=".g:cache_home
"execute "set dir=".g:cache_home
"execute "let g:netrw_home='".g:cache_home."'"
"silent !mkdir $HOME/.cache/nvim > /dev/null 2>&1
"set directory=$HOME/.cache/nvim
"set backupdir=$HOME/.cache/nvim
"let g:netrw_home='~/.cache/nvim'
set nobackup
set noswapfile " nvim keeps making huge 50GB .swp files for some reason
set nowritebackup

" -- whitespace
"set list " show trailing whitespace
"set listchars=tab:▸\ ,trail:▫ " whitespace chars

" -- display
"set breakindent " preserve indentation when wrapping
"set noruler
set noshowmode " airline handles mode display
set ruler " show cursor position
set scrolloff=3 " show context above/below cursorline
set title " change the terminal's title
set wmh=0 " window min height = 0, for splits?
set wmw=0 " window min width = 0, for splits?
set noerrorbells " no bell

" -- vc, diffs
set diffopt+=vertical

" -- neovim
let g:python2_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'
