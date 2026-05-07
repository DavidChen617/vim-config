" Python-local editor settings.
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab
setlocal autoindent
setlocal smartindent
setlocal textwidth=88
setlocal colorcolumn=88
setlocal foldmethod=indent
setlocal foldlevel=99

setlocal makeprg=python3\ -m\ py_compile\ %
setlocal errorformat=%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%#%m
