"-- tabs and spaces
set tabstop=4
"set shiftwidth=2
"set softtabstop=2
set expandtab
set autoindent
set cindent
set smarttab

"-- cursor movement
set backspace=indent,eol,start
set nostartofline " preserve column on page movements

"-- copy/paste
" yank and paste with the system clipboard under x11 (ie not ssh)
if (executable('pbcopy') || executable('xclip') || executable('xsel')) && has('clipboard')
  set clipboard=unnamed
endif

"-- splits
set hidden " enable multi file editing
set splitbelow " open hsplits down (defaults up)
set splitright " open vsplits right (defaults left)

"-- input
set timeout " use timeouts for keyboard combo mappings
set timeoutlen=600 ttimeoutlen=0 " 600ms for key combos, 0ms for <esc>

"-- commandline
set wildmode=list:longest,full " more linuxy filename completion with <tab>
set wildmenu

"-- search and replace
set gdefault " always use /g with %s/
set hlsearch " highlight search hits
set incsearch "incremental search
set wrapscan
set ignorecase
set smartcase
set infercase

"-- folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

"-- backups
set backupdir=~/.temp,.
set dir=~/.temp//,.
"set nobackup
"set noswapfile
"set nowritebackup

"-- whitespace
"set list " show trailing whitespace
"set listchars=tab:▸\ ,trail:▫ " whitespace chars

"-- display
set breakindent " preserve indentation when wrapping
"set noruler
set noshowmode " airline handles mode display
set ruler " show cursor position
set scrolloff=3 " show context above/below cursorline
set title " change the terminal's title
set wmh=0 " window min height = 0, for splits?
set wmw=0 " window min width = 0, for splits?

"-- general

"-- buffer hooks

" directly go to insert mode when swtich to terminal window
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

"-- helper functions
:command! ConfigEdit edit $MYVIMRC " edit config file
:command! ConfigReload source $MYVIMRC " live reload config
