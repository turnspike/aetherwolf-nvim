" initialise vimplug
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.local/share/nvim/plugged')

" TODO: denite.vim instead of cabbrev?

"---- utility

"---- colors
Plug 'flazz/vim-colorschemes'
"colorscheme dusk

"---- editing

Plug 'tpope/vim-repeat' " add . repeat for some plugins
Plug 'tpope/vim-unimpaired' " use ] and [ combos for :ex commands, eg ]b for next buffer
Plug 'tpope/vim-surround' " bracket manipulation eg cs'<p>
Plug 'tpope/vim-dispatch' " execute shell commands in the background
Plug 'idbrii/vim-endoscope' " c-S to close tag/scope
Plug 'matze/vim-move' " move chunks using <A-k> and <A-j>
"Plug 'timkendrick/vim-duplicate' " duplicate chunks using <leader>-d
"nmap <leader>d <Plug>Duplicate
" TODO: osyo-manga/vim-over
" TODO: godlygeek/tabular
" TODO: justinmk/vim-sneak

" visually select outwards using <v>
Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" region commenting
"Plug 'tpope/vim-commentary' " gc to comment, <leader>c<space> to toggle comment
Plug 'scrooloose/nerdcommenter'
let g:NERDDefaultAlign = 'left' " comment delimiters hard left
let g:NERDCompactSexyComs = 1 " use compact syntax for prettified multi-line comments
let g:NERDCommentEmptyLines = 1 " allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " enable trimming of trailing whitespace when uncommenting

" whitespace
"Plug 'thirtythreeforty/lessspace.vim' "strip whitespace only on edited lines
Plug 'ntpeters/vim-better-whitespace' " hilight and work with trailing whitespace
autocmd BufEnter * EnableStripWhitespaceOnSave " auto strip whitespace

"---- buffers
Plug 'schickling/vim-bufonly' " :BufOnly to close other buffers
Plug 'bogado/file-line' " open file at specific line, eg vim app/models/user.rb:1337

"---- searching
Plug 'wincent/loupe' " make current search match more obvious
let g:LoupeVeryMagic=0 " don't prepend \v to searches

"---- version control

" show git line status in left gutter
Plug 'airblade/vim-gitgutter'
let g:gitgutter_max_signs=10000 " limit signs on large files
"nmap <leader>gg :GitGutterToggle<CR>
nmap <leader>ghk <Plug>GitGutterPrevHunk
nmap <leader>ghj <Plug>GitGutterNextHunk
nmap <leader>ghp <Plug>GitGutterPreviewHunk
nmap <leader>ghr <Plug>GitGutterUndo
nmap <leader>ghs <Plug>GitGutterStageHunk

Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'

call Cabbrev('gac', 'call GAddCommit()')
nmap <leader>c :call GAddCommit()<cr>
function! GAddCommit() " add file and commit in one command
    exe ":w"
    "exe ":Gwrite"
	exe "Dispatch git add %:p"
    exe ":Gcommit -v -q"
endfunction

"autocmd BufReadPost fugitive://* set bufhidden=delete
call Cabbrev('ga', 'Gwrite')
"nmap <leader>ga :Dispatch git add %:p<CR><CR>
call Cabbrev('gs', 'Gstatus')
call Cabbrev('gc', 'Gcommit -v -q')
" TODO: how to chain Cabbrev commands??
"call Cabbrev('gac', 'Dispatch git add %:p<CR><CR>Gcommit -v -q')
call Cabbrev('gd', 'Gdiff')
call Cabbrev('gD', 'diffoff!<CR><c-w>h:bd') "clean way to close fugitive diff window
call Cabbrev('ge', 'Gedit')
call Cabbrev('gr', 'Gread')
"call Cabbrev('gl', 'silent! Glog<CR>:bot copen')
"call Cabbrev('gg', 'Ggrep<space>')
"call Cabbrev('gm', 'Gmove<space>')
"call Cabbrev('gb', 'Git branch<space>')
"call Cabbrev('go', 'Git checkout<space>')
call Cabbrev('gp', 'Dispatch! git push')
call Cabbrev('gu', 'Dispatch! git pull')
:command! Gwho Gblame " eeeeliminate the negativity

"---- codesense

"Plug 'ervandew/supertab' " autocomplete by pressing tab (overlay for ctrl-p, ctrl-x etc)
Plug 'luochen1990/rainbow' " color paren pairs, good for lisps
"Plug 'kien/rainbow_parentheses.vim' " color paren pairs, good for lisps
"Plug 'SirVer/ultisnips' " insert code snips
"Plug 'honza/vim-snippets' "insert code snips
Plug 'tpope/vim-ragtag'

" TODO: YCM?
" TODO: kspell
" TODO: ctags

" Plug 'Shougo/neocomplete.vim'
" Plug 'xolox/vim-easytags'
" g:easytags_async = 1

"---- sessions
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" g:cache_home is set in env.vim, ususally ~/.cache/nvim
"silent !mkdir expand(g:cache_home)/sessions > /dev/null 2>&1
"execute "let g:session_directory='".g:cache_home."/sessions'"
silent !mkdir ~/.cache/nvim/sessions > /dev/null 2>&1
let g:session_directory='~/.cache/nvim/sessions'
let g:session_autoload='yes'
let g:session_autosave='yes'
let g:session_command_aliases=1

"---- project plugins (files, outlines, layouts...)

"Plug 'justinmk/vim-dirvish'

"Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
" autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
" autocmd BufEnter * silent! if bufname('%') !~# 'NERD_tree_' | cd %:p:h | NERDTreeCWD | wincmd p | endif

" FIXME sync nerdtree...
"command! -bang -nargs=* NERDTreeSync call g:nt_sync() " search file content within proj scope
"function! g:nt_sync()
"    exe ":NERDTreeFind"
"    exe "<c-w>l"
"endfunction

nmap <leader>nt :NERDTreeToggle<cr>
" reveal the current file in NERDTree
nmap <leader>nf :NERDTreeFind<cr><c-w><c-w>
call Cabbrev('nt', 'NERDTreeToggle')
call Cabbrev('nf', 'NERDTreeFind')

"let g:nerdtree_sync_cursorline = 1
"let g:NERDTreeHighlightCursorline = 1 " highlight current line
" don't blat <c-j> and <c-k> (used for split movement)
let g:NERDTreeMapJumpPrevSibling='<Nop>'
let g:NERDTreeMapJumpNextSibling='<Nop>'

" use vimfiler instead of netrw
"Plug 'Shougo/unite.vim'
"Plug 'Shougo/vimfiler.vim'
"let g:vimfiler_as_default_explorer = 1

"Plug 'tpope/vim-vinegar' " use - (minus) to launch a modified netrw file browser
"autocmd FileType netrw setl bufhidden=wipe " bugfix for :bd on netrw

" vinegar is bugged so use filebeagle for now

let g:filebeagle_suppress_keymaps = 1
Plug 'jeetsukumaran/vim-filebeagle'
map <silent> - <Plug>FileBeagleOpenCurrentBufferDir

" tpope/vim-sleuth

" show tag sidebar for current file
Plug 'majutsushi/tagbar'
let g:tagbar_usearrows = 1
call Cabbrev('tt', 'TagbarToggle')

" TODO macos/homebrew

Plug 'junegunn/vim-peekaboo' " show contents of registers

" fuzzy finder navigator
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " base fzf
Plug 'junegunn/fzf.vim' " load Ex commands
"let g:fzf_command_prefix = 'F' " use :Fzf prefix for Ex commands
Plug 'tweekmonster/fzf-filemru' " provides :FilesMru :ProjectMru

" linewise completion
imap <c-x><c-l> <plug>(fzf-complete-line)
nmap <leader>l <plug>(fzf-complete-line)

" lifted from: https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
command! -bang -nargs=* FPgrep call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).' '.s:get_project_root(), 1, <bang>0) " search file content within proj scope
"set grepprg=rg\ --vimgrep

" lifted from: https://github.com/junegunn/fzf.vim/issues/47#issuecomment-160237795
function! s:get_project_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

" find filenames within project scope TODO: add search string as second param
command! Pfiles execute 'Files' s:get_project_root()
"command! FPfiles execute 'FFiles '.s:get_project_root().' '.shellescape(<q-args>)

call Cabbrev('ff', 'Pfiles') " _fuzzy _filenames (in project)
call Cabbrev('fg', 'Pgrep') " _fuzzy _grep (in project)
call Cabbrev('fb', 'Buffers') " _fuzzy _buffer
call Cabbrev('fi', 'BLines') " _fuzzy _in file

" ctrlp navigator
"let g:ctrlp_extensions = ['funky']
"let g:ctrlp_extensions = ['funky','switcher']
"Plug 'ctrlpvim/ctrlp.vim'
"if executable('ag')
"  set grepprg=ag\ --nogroup\ --nocolor " use ag over grep
"  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""' " use ag in CtrlP for listing files
"  let g:ctrlp_use_caching = 0 " ag is fast enough that CtrlP doesn't need to cache
"endif
"
"nnoremap <leader>b :CtrlPBuffer<cr>

"Plug 'tacahiroy/ctrlp-funky'
"nnoremap <leader>cu :CtrlPFunky<Cr>
"" narrow the list down with a word under cursor
"nnoremap <leader>cU :execute 'CtrlPFunky ' . expand('<cword>')<cr>

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
"nnoremap <leader>r :QuickRun<cr>
"call Cabbrev('tt', 'eq')

"Plug 'benmills/vimux'
"Plug 'epeli/slimux'

"---- terminal enhancements

" tmux integration
"Plug 'tmux-plugins/vim-tmux-focus-events'
"Plug 'roxma/vim-tmux-clipboard'
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
"TODO do these blat core vim shortcuts?
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
"let g:airline_theme = 'powerlineish'
"let g:airline_theme = 'sol'
let g:airline_theme = 'base16_tomorrow'

" show marks in left gutter
Plug 'kshenoy/vim-signature'

" start screen menu
Plug 'mhinz/vim-startify'

"---- orgmode
Plug 'mattn/calendar-vim'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-speeddating' " use CTRL-A/CTRL-X to increment dates, times
"Plug 'jceb/vim-orgmode'

let g:vimwiki_global_ext = 0
let g:vimwiki_list = [
\  {'path': '~/Dropbox/wiki/notes/', 'syntax': 'markdown', 'ext': '.md'},
\  {'path': '~/Dropbox/wiki/blog/', 'syntax': 'markdown', 'ext': '.md'},
\  {'path': '~/Dropbox/wiki/personal/', 'syntax': 'markdown', 'ext': '.md'}
\]

" FIXME these apply to all open buffers when a vimwiki buffer is open
"au BufRead,BufNewFile *.wiki set filetype=vimwiki
"autocmd FileType vimwiki map d :VimwikiMakeDiaryNote<cr>
"autocmd FileType vimwiki map c :call ToggleCalendar()<cr>

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

call Cabbrev('vw', 'VimwikiIndex')
call Cabbrev('vd', 'VimwikiDiaryIndex')
call Cabbrev('vn', 'VimwikiMakeDiaryNote')

command! -bang -nargs=* VimwikiToggleCalendar call ToggleCalendar()
call Cabbrev('vct', 'VimwikiToggleCalendar')

"---- clojure

Plug 'tpope/vim-classpath', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-salve', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }

"---- other languages

"Plug 'aklt/plantuml-syntax' " plantuml
Plug 'scrooloose/vim-slumlord' " plantuml live preview

Plug 'tpope/vim-cucumber' ", { 'for': 'rails'} ' cucumber syntax
Plug 'vim-ruby/vim-ruby' ", { 'for': 'ruby' } ' ruby syntax
Plug 'tpope/vim-rails' " rails syntax
Plug 'tpope/vim-haml' ", { 'for': 'rails' } rails syntax
Plug 'sheerun/vim-polyglot' " multi-language syntax pack
"Plug 'letientai299/vim-react-snippets', { 'branch': 'es6' } " react code snips, ./UltiSnips/javascript.snippets
"Plug 'skalnik/vim-vroom' " run tests

"Bundle 'astashov/vim-ruby-debugger'
"Bundle 'ecomba/vim-ruby-refactoring'
"Bundle 'skwp/vim-ruby-conque'
"Bundle 'tpope/vim-rake.git'
"Bundle 'tpope/vim-rvm.git'
"Bundle 'vim-scripts/Specky.git'
"Bundle 'ck3g/vim-change-hash-syntax'

"---- misc

"Description {===============================
" Vim plugin for showing all your <Leader>
" mappings in a readable table including the descriptions.
" <leader>fml
"}===========================================
let g:fml_all_sources = 1
Plug 'ktonga/vim-follow-my-lead'

call plug#end()
