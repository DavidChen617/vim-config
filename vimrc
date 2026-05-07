" Main Vim configuration entrypoint.
set nocompatible

let g:vim_config_root = expand('<sfile>:p:h')

execute 'set runtimepath^=' . fnameescape(g:vim_config_root)
execute 'set packpath^=' . fnameescape(g:vim_config_root)

syntax enable
filetype plugin indent on

execute 'source ' . fnameescape(g:vim_config_root . '/config/base.vim')
execute 'source ' . fnameescape(g:vim_config_root . '/config/coc.vim')
execute 'source ' . fnameescape(g:vim_config_root . '/config/python.vim')
execute 'source ' . fnameescape(g:vim_config_root . '/config/csharp.vim')
