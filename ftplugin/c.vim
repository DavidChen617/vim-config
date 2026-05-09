" C-local editor settings.
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab
setlocal autoindent
setlocal cindent
setlocal textwidth=100
setlocal colorcolumn=100

setlocal makeprg=make

let b:coc_root_patterns = ['compile_commands.json', 'compile_flags.txt', 'Makefile', 'makefile', '.git']
