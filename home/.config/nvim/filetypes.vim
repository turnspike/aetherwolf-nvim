
"---- all files
autocmd FileType * setlocal formatoptions-=cro " don't autocomment newlines
"autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
au FileType * set tabstop=4|set shiftwidth=4|set noexpandtab

"---- ruby
"autocmd FileType ruby nnoremap <buffer> <leader>r :exec '!clear; ruby' shellescape(@%, 1)<cr>
"autocmd FileType ruby nnoremap <buffer> <C-S-r> :exec '!clear; python' shellescape(@%, 1)<cr>
command! FR set filetype=ruby

"---- plantuml
autocmd FileType plantuml nnoremap <buffer> <leader>r :!java -jar ~/bin/plantuml.jar -o %:p:h %<cr>

"---- other
au FileType python set tabstop=4|set shiftwidth=4|set softtabstop=4|set expandtab
au FileType make setlocal noexpandtab|set softtabstop=4
au BufRead,BufNewFile *.md setlocal filetype=markdown

"---- indenting
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab

"" - Go {{{3
"augroup myGolang
"    au!
"    autocmd FileType go
"                \  nmap <buffer> <LocalLeader>r   <Plug>(go-run)
"                \| nmap <buffer> <LocalLeader>b   <Plug>(go-build)
"                \| nmap <buffer> <LocalLeader>t   <Plug>(go-test)
"                \| nmap <buffer> <LocalLeader>c   <Plug>(go-coverage)
"                \| nmap <buffer> <LocalLeader>gd  <Plug>(go-doc)
"                \| nmap <buffer> <LocalLeader>gv  <Plug>(go-doc-vertical)
"                \| nmap <buffer> <LocalLeader>s   <Plug>(go-implements)
"                \| nmap <buffer> <LocalLeader>i   <Plug>(go-info)
"augroup END
"
"" - CSV {{{3
"augroup myCSV
"    au!
"    autocmd FileType csv
"                \  nmap <buffer> <LocalLeader>i  :InitCSV<cr>
"                \| nmap <buffer> <LocalLeader>A  :%ArrangeColumn!<cr>
"                \| nmap <buffer> <LocalLeader>T  :CSVTabularize<cr>
"                \| nmap <buffer> <LocalLeader>F  :CSVFixed<cr>
"                \| nmap <buffer> <LocalLeader>a  :AddColumn<cr>
"                \| nmap <buffer> <LocalLeader>c  :Column<space>
"                \| nmap <buffer> <LocalLeader>d  :DeleteColumn<cr>
"                \| nmap <buffer> <LocalLeader>n  :NewRecord<cr>
"                \| nmap <buffer> <LocalLeader>z  :VertFold<cr>
"                \| nmap <buffer> <LocalLeader>Z  :VertFold!<cr>
"                \| nmap <buffer> <LocalLeader>w  :WhatColumn<cr>
"                \| nmap <buffer> <LocalLeader>#  :NrColumns<cr>
"                \| nmap <buffer> <LocalLeader>=  :SumCol<cr>
"                \| nmap <buffer> <LocalLeader>/  :SearchInColumn //<Left>
"                \| nmap <buffer> <LocalLeader>th :HeaderToggle<cr>
"                \| nmap <buffer> <LocalLeader>ts :let g:csv_strict_columns = 1<cr>
"                \| nmap <buffer> <LocalLeader>tS :let g:csv_strict_columns = 0<cr>
"augroup END
"
""------------------
"" - Diff mode {{{3
""------------------
"" (from left win)
"if &diff
"    nnoremap            <Left>          do
"    nnoremap            <Right>         dp
"    nnoremap <silent>   !               :diffupdate<cr>
"    nnoremap            <Down>          ]c
"    nnoremap            <Up>            [c
"    nnoremap <expr><silent> <LocalLeader>w  ':set diffopt'.
"                \ (match(&dip,'iwhite')!=-1?'-=':'+=').
"                \ 'iwhite<cr>'
"    nnoremap <expr><silent> <LocalLeader>c  ':set diffopt'.
"                \ (match(&dip, 'icase')!=-1?'-=':'+=').
"                \ 'icase<cr>'
"endif
