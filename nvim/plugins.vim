" initialise vimplug
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.local/share/nvim/plugged')
" TODO: denite.vim instead of cabbrev?

"---- FILES ----
Plug 'danro/rename.vim' " add :rename
Plug 'EinfachToll/DidYouMean' " running 'vim <partial filename>' will prompt for matching files
Plug 'bogado/file-line' " open file at specific line, eg vim app/models/user.rb:1337

"---- COLORS ----

Plug 'flazz/vim-colorschemes'
"colorscheme dusk

"---- EDITING ----
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

" ---- COMMENTING ----

"Plug 'tpope/vim-commentary' " gc to comment, <leader>c<space> to toggle comment
Plug 'scrooloose/nerdcommenter'
let g:NERDDefaultAlign = 'left' " comment delimiters hard left
let g:NERDCompactSexyComs = 1 " use compact syntax for prettified multi-line comments
let g:NERDCommentEmptyLines = 1 " allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " enable trimming of trailing whitespace when uncommenting

" whitespace
Plug 'thirtythreeforty/lessspace.vim' "strip whitespace only on edited lines
"Plug 'ntpeters/vim-better-whitespace' " hilight and work with trailing whitespace
"autocmd BufEnter * EnableStripWhitespaceOnSave " auto strip whitespace

"---- BUFFERS ----
Plug 'schickling/vim-bufonly' " :BufOnly to close other buffers
Plug 'moll/vim-bbye' " :Bdelete for a better buffer closer

"---- SEARCHING ----

Plug 'wincent/loupe' " make current search match more obvious
let g:LoupeVeryMagic=0 " don't prepend \v to searches

"---- VERSION CONTROL ----

" show git line status in left gutter
Plug 'airblade/vim-gitgutter'
let g:gitgutter_max_signs=10000 " limit signs on large files
"nmap <leader>gg :GitGutterToggle<CR>
"nmap <leader>ghk <Plug>GitGutterPrevHunk
"nmap <leader>ghj <Plug>GitGutterNextHunk
"nmap <leader>ghp <Plug>GitGutterPreviewHunk
"nmap <leader>ghr <Plug>GitGutterUndo
"nmap <leader>ghs <Plug>GitGutterStageHunk

Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'

"---- CODESENSE ----

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

"---- SESSIONS ----

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

"---- PROJECT PLUGINS ----

Plug 'airblade/vim-rooter'
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_resolve_links = 1
let g:rooter_silent_chdir = 1

"Plug 'justinmk/vim-dirvish'

"Plug 'vim-ctrlspace/vim-ctrlspace'
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
Plug 'unkiwii/vim-nerdtree-sync', { 'on': 'NERDTreeToggle' }
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists(“s:std_in”) | NERDTree | endif

augroup PluginNerd
  autocmd!
  autocmd VimEnter * NERDTree
  autocmd BufEnter * NERDTreeMirror
  autocmd VimEnter * wincmd w
augroup END

let NERDTreeMinimalUI = 1 " don't show help message
"let g:nerdtree_sync_cursorline = 1
let g:NERDTreeHighlightCursorline = 0 " highlight current file
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

"Plug 'francoiscabrol/ranger.vim'
"Plug 'rbgrouleff/bclose.vim'
""let g:ranger_map_keys = 0
""map <leader>f :Ranger<CR>

" tpope/vim-sleuth

" show tag sidebar for current file
Plug 'majutsushi/tagbar'
let g:tagbar_usearrows = 1
let g:tagbar_compact = 1

"Plug 'severin-lemaignan/vim-minimap'
"let g:minimap_highlight='CursorLine'

" TODO macos/homebrew

"Plug 'junegunn/vim-peekaboo' " show contents of registers

" fuzzy finder navigator
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " base fzf
Plug 'junegunn/fzf.vim' " load Ex commands
"let g:fzf_command_prefix = 'F' " use :Fzf prefix for Ex commands
Plug 'tweekmonster/fzf-filemru' " provides :FilesMru :ProjectMru

" lifted from: https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
command! -bang -nargs=* Pgrep call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).' '.s:get_project_root(), 1, <bang>0) " search file content within proj scope
"set grepprg=rg\ --vimgrep

" find filenames within project scope
" TODO: add search string as second param, add --tiebreak=end for better sorting
" lifted from: https://github.com/junegunn/fzf.vim/issues/47#issuecomment-160237795
function! s:get_project_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! Pfiles execute 'Files' s:get_project_root()
"command! -bang -complete=buffer -nargs=? Bclose Bdelete<bang> <args>
"command! FPfiles execute 'FFiles '.s:get_project_root().' '.shellescape(<q-args>)

command! Pmru execute 'ProjectMru'

"*** TODO fuzzy tags, fuzzy function list

"FIXME these only work when set later in keybinds.vim??
"nmap <leader>b :Buffers<cr>
"nmap <leader>f :Pfiles<cr>
"nmap <leader>r :ProjectMru --tiebreak=end<cr>
"nnoremap <c-p> :FilesMru --tiebreak=end<cr>

"" ctrlp navigator
"Plug 'ctrlpvim/ctrlp.vim'
"let g:ctrlp_extensions = ['funky', 'switcher']
"
"if executable('rg')
"  set grepprg=rg\ --vimgrep
"  "set grepprg=rg\ --color=never
"  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""' " use rg in CtrlP for listing files
"  let g:ctrlp_use_caching = 0 " ag is fast enough that CtrlP doesn't need to cache
"endif
"
"Plug 'tacahiroy/ctrlp-funky'
"nnoremap <leader>cu :CtrlPFunky<Cr>
"" narrow the list down with a word under cursor
"nnoremap <leader>cU :execute 'CtrlPFunky ' . expand('<cword>')<cr>
"
"Plug 'iurifq/ctrlp-rails.vim'
"":CtrlPModels :CtrlPControllers :CtrlPViews :CtrlPLibs :CtrlPSpecs :CtrlPMigrations
"
""Plug 'ivan-cukic/vim-ctrlp-switcher'
""let g:ctrlpswitcher_mode = 1

"---- REPL

"Plug 'thinca/vim-quickrun'
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

Plug 'wincent/terminus' " change cursor shape with mode
"let g:TerminusMouse=0
"Plug 'jszakmeister/vim-togglecursor'
"let g:togglecursor_insert='line'

"---- LINTING ----

"---- STATUS LINE ----
Plug 'bling/vim-airline'
Plug 'jordwalke/flatlandia'

" airline - use unicode symbols (terminal friendly)
" TODO make conditional on term mode
if !exists('g:airline_symbols')
		let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
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
"let g:airline_theme = 'base16_tomorrow'
"let g:airline_theme = 'zenburn'
let g:airline_theme = 'monochrome'
"let g:airline_theme = 'flatlandia'

" show marks in left gutter
Plug 'kshenoy/vim-signature'

" start screen menu
Plug 'mhinz/vim-startify'

"---- wiki
Plug 'mattn/calendar-vim'
Plug 'tpope/vim-speeddating' " use CTRL-A/CTRL-X to increment dates, times
Plug 'vimwiki/vimwiki'

let g:vimwiki_map_prefix = '<Leader>i'
let g:vimwiki_global_ext = 0
" FIXME these apply to all open buffers when a vimwiki buffer is open
"au BufRead,BufNewFile *.wiki set filetype=vimwiki
"autocmd FileType vimwiki map d :VimwikiMakeDiaryNote<cr>
"autocmd FileType vimwiki map c :call ToggleCalendar()<cr>


"Plug 'MikeCoder/markdown-preview.vim'
"TODO pull request this to also work on vimwiki files
""---- preview markdown in browser
"Plug 'tyru/open-browser.vim'
"Plug 'kannokanno/previm'
"let g:previm_open_cmd = 'open -a Safari'

"augroup PrevimSettings
"    autocmd!
"    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
"augroup END

""---- clojure
"Plug 'tpope/vim-classpath', { 'for': 'clojure' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"Plug 'tpope/vim-salve', { 'for': 'clojure' }
"Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
"Plug 'guns/vim-sexp', { 'for': 'clojure' }
"Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
"Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }

"---- javascript
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

"---- other languages

Plug 'aklt/plantuml-syntax' " plantuml
Plug 'scrooloose/vim-slumlord' " plantuml live preview
"autocmd FileType plantuml nnoremap e :!java -jar ~/bin/plantuml.jar -o %:p:h %
"autocmd FileType plantuml nnoremap e :!plantuml -o %:p:h %

Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-cucumber' ", { 'for': 'rails'} ' cucumber syntax
Plug 'vim-ruby/vim-ruby' ", { 'for': 'ruby' } ' ruby syntax
Plug 'tpope/vim-rails' " rails syntax
Plug 'tpope/vim-haml' ", { 'for': 'haml' } rails syntax
Plug 'sheerun/vim-polyglot' " multi-language syntax pack
Plug 'stephpy/vim-yaml' " better yaml support
Plug 'cakebaker/scss-syntax.vim'
"Plug 'letientai299/vim-react-snippets', { 'branch': 'es6' } " react code snips, ./UltiSnips/javascript.snippets
"Plug 'skalnik/vim-vroom' " run tests

"Bundle 'astashov/vim-ruby-debugger'
"Bundle 'ecomba/vim-ruby-refactoring'
"Bundle 'skwp/vim-ruby-conque'
"Bundle 'tpope/vim-rake.git'
"Bundle 'tpope/vim-rvm.git'
"Bundle 'vim-scripts/Specky.git'
"Bundle 'ck3g/vim-change-hash-syntax'

"-- AUTOCOMPLETE

" TODO https://www.gregjs.com/vim/2016/configuring-the-deoplete-asynchronous-keyword-completion-plugin-with-tern-for-vim/

Plug 'ervandew/supertab' " use tab for autocompletion
let g:SuperTabDefaultCompletionType = "<c-n>"

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

let g:deoplete#enable_at_startup = 1

"Plug 'kien/ctrlp.vim'
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"  \ 'file': '\v\.(exe|so|dll)$',
"  \ 'link': 'some_bad_symbolic_links',
"  \ }
"
"Plug 'ivalkeen/vim-ctrlp-tjump'
"nnoremap <c-]> :CtrlPtjump<cr>
"vnoremap <c-]> :CtrlPtjumpVisual<cr>

"TODO snippets...
"TODO https://github.com/bonsaiben/bootstrap-snippets
"TODO https://www.gregjs.com/vim/2016/configuring-the-deoplete-asynchronous-keyword-completion-plugin-with-tern-for-vim/
"TODO https://www.gregjs.com/vim/2016/neovim-deoplete-jspc-ultisnips-and-tern-a-config-for-kickass-autocompletion/

" -- misc

"TODO: add a pull request to make <leader>fml optional
"" show all leader mappings
"let g:fml_all_sources = 1
"Plug 'ktonga/vim-follow-my-lead'
"nunmap <Leader>fml
"command! -bang -nargs=0 FollowMyLead call FMLShow()

call plug#end()

runtime macros/matchit.vim

" ---- file browser ----

"" -- open netrw as left pane with :Ve
"" https://shapeshed.com/vim-netrw/
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore " always show file drawer
"augroup END
