
" the built-in vim cabbrev replaces all command strings including search /
" we only want to remap :example commands
" https://stackoverflow.com/questions/3878692/aliasing-a-command-in-vim/3879737#3879737
fu! Cabbrev(key, value)
  exe printf('cabbrev <expr> %s (getcmdtype() == ":" && getcmdpos() <= %d) ? %s : %s',
    \ a:key, 1+len(a:key), string(a:value), string(a:key))
endfu

